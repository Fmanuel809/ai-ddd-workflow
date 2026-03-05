# Install AI DDD Workflow in OpenCode

This guide installs the workflow into your global OpenCode configuration by cloning this repository and linking (preferred) or copying `commands/`, `skills/`, and `agents/`.

## Prerequisites

- `git` installed and available in your shell
- OpenCode already installed

## 1) Go to the global OpenCode config directory

Use `OPENCODE_CONFIG_DIR` if you already have it configured. Otherwise use the default path for your OS.

### Linux/macOS (bash)

```bash
export OPENCODE_CONFIG_DIR="${OPENCODE_CONFIG_DIR:-$HOME/.config/opencode}"
mkdir -p "$OPENCODE_CONFIG_DIR"
cd "$OPENCODE_CONFIG_DIR"
```

### Windows (PowerShell)

```powershell
if (-not $env:OPENCODE_CONFIG_DIR) {
  $env:OPENCODE_CONFIG_DIR = Join-Path $HOME ".config/opencode"
}
New-Item -ItemType Directory -Path $env:OPENCODE_CONFIG_DIR -Force | Out-Null
Set-Location $env:OPENCODE_CONFIG_DIR
```

## 2) Clone the workflow repository

### Linux/macOS (bash)

```bash
git clone https://github.com/Fmanuel809/ai-ddd-workflow.git
```

### Windows (PowerShell)

```powershell
git clone https://github.com/Fmanuel809/ai-ddd-workflow.git
```

## 3) Link `commands/`, `skills/`, and `agents/` (preferred), fallback to copy

Symlinks keep your OpenCode config synced with repository updates.

### Linux/macOS (bash)

```bash
ln -sfn "$OPENCODE_CONFIG_DIR/ai-ddd-workflow/commands" "$OPENCODE_CONFIG_DIR/commands"
ln -sfn "$OPENCODE_CONFIG_DIR/ai-ddd-workflow/skills" "$OPENCODE_CONFIG_DIR/skills"
ln -sfn "$OPENCODE_CONFIG_DIR/ai-ddd-workflow/agents" "$OPENCODE_CONFIG_DIR/agents"
```

If symlinks are not allowed:

```bash
cp -R "$OPENCODE_CONFIG_DIR/ai-ddd-workflow/commands" "$OPENCODE_CONFIG_DIR/"
cp -R "$OPENCODE_CONFIG_DIR/ai-ddd-workflow/skills" "$OPENCODE_CONFIG_DIR/"
cp -R "$OPENCODE_CONFIG_DIR/ai-ddd-workflow/agents" "$OPENCODE_CONFIG_DIR/"
```

### Windows (PowerShell)

```powershell
$repoRoot = Join-Path $env:OPENCODE_CONFIG_DIR "ai-ddd-workflow"
New-Item -ItemType SymbolicLink -Path (Join-Path $env:OPENCODE_CONFIG_DIR "commands") -Target (Join-Path $repoRoot "commands") -Force
New-Item -ItemType SymbolicLink -Path (Join-Path $env:OPENCODE_CONFIG_DIR "skills") -Target (Join-Path $repoRoot "skills") -Force
New-Item -ItemType SymbolicLink -Path (Join-Path $env:OPENCODE_CONFIG_DIR "agents") -Target (Join-Path $repoRoot "agents") -Force
```

If symlinks are not allowed:

```powershell
$repoRoot = Join-Path $env:OPENCODE_CONFIG_DIR "ai-ddd-workflow"
Copy-Item -Path (Join-Path $repoRoot "commands") -Destination $env:OPENCODE_CONFIG_DIR -Recurse -Force
Copy-Item -Path (Join-Path $repoRoot "skills") -Destination $env:OPENCODE_CONFIG_DIR -Recurse -Force
Copy-Item -Path (Join-Path $repoRoot "agents") -Destination $env:OPENCODE_CONFIG_DIR -Recurse -Force
```

## 4) Restart OpenCode and initialize the workflow

After finishing installation:

1. Restart your OpenCode instance.
2. Run the command: `/ddd-init`
3. Optionally include context in the same command.

Example prompt:

```text
/ddd-init Build a DDD requirements baseline for a B2B invoicing SaaS with multi-tenant billing and approval workflows.
```
