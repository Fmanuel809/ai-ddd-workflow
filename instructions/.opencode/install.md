# Install AI DDD Workflow in OpenCode

This guide installs the workflow into your global OpenCode configuration by cloning this repository and merging workflow content into existing OpenCode folders.

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

## 3) Merge workflow folders into OpenCode (`commands/`, `skills/`, `agents/`, `rules/`)

Do not use symbolic links.

Use merge-copy behavior:
- Keep existing OpenCode content that is not part of this workflow.
- Replace files with the same path/name when this workflow provides them.
- Do not delete unrelated files/folders already present in your OpenCode config.

### Linux/macOS (bash)

```bash
repo_root="$OPENCODE_CONFIG_DIR/ai-ddd-workflow"
for section in commands skills agents rules; do
  src_dir="$repo_root/$section"
  dst_dir="$OPENCODE_CONFIG_DIR/$section"
  mkdir -p "$dst_dir"
  if [ -d "$src_dir" ]; then
    cp -R "$src_dir"/. "$dst_dir"/
  fi
done
```

### Windows (PowerShell)

```powershell
$repoRoot = Join-Path $env:OPENCODE_CONFIG_DIR "ai-ddd-workflow"
$sections = @("commands", "skills", "agents", "rules")
foreach ($section in $sections) {
  $srcDir = Join-Path $repoRoot $section
  $dstDir = Join-Path $env:OPENCODE_CONFIG_DIR $section
  New-Item -ItemType Directory -Path $dstDir -Force | Out-Null
  if (Test-Path -LiteralPath $srcDir) {
    Copy-Item -Path (Join-Path $srcDir "*") -Destination $dstDir -Recurse -Force
  }
}
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
