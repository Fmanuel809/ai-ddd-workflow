Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$targetDir = if ($args.Count -gt 0 -and -not [string]::IsNullOrWhiteSpace($args[0])) { $args[0] } else { (Get-Location).Path }

function Get-OpenCodeConfigDir {
    if ($env:OPENCODE_CONFIG_DIR) {
        return $env:OPENCODE_CONFIG_DIR
    }
    if ($env:XDG_CONFIG_HOME) {
        return (Join-Path $env:XDG_CONFIG_HOME "opencode")
    }
    return (Join-Path (Join-Path $HOME ".config") "opencode")
}

New-Item -ItemType Directory -Force -Path $targetDir | Out-Null

$projectScopeOrchestrator = Join-Path $targetDir ".opencode/agents/ddd-workflow-orchestrator.md"
if (Test-Path $projectScopeOrchestrator) {
    Write-Host "Project-scope OpenCode workflow already installed in $targetDir/.opencode. Init is not required."
    exit 0
}

$configDir = Get-OpenCodeConfigDir
$sourceWorkflow = Join-Path $configDir "ai-ddd-workflow"

if (-not (Test-Path $sourceWorkflow)) {
    Write-Error "Global workflow not found at $sourceWorkflow. Install globally first using instructions/.opencode/install.md"
}

Copy-Item -Path (Join-Path $sourceWorkflow "AGENTS.md") -Destination (Join-Path $targetDir "AGENTS.md") -Force
Copy-Item -Path (Join-Path $sourceWorkflow "ddd-config.yml") -Destination (Join-Path $targetDir "ddd-config.yml") -Force

$targetArtifacts = Join-Path $targetDir "artifacts"
if (Test-Path $targetArtifacts) {
    Remove-Item -Path $targetArtifacts -Recurse -Force
}

Copy-Item -Path (Join-Path $sourceWorkflow "artifacts") -Destination $targetArtifacts -Recurse -Force

Write-Host "Initialized DDD workflow structure at $targetDir"
