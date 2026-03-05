# Install AI DDD Workflow in OpenCode

This guide installs the workflow into your global OpenCode configuration by cloning this repository and linking (preferred) or copying items inside `commands/`, `skills/`, and `agents/`.

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

## 3) Link items inside `commands/`, `skills/`, and `agents/` (preferred), fallback to copy

Do not replace existing top-level directories in your OpenCode config. Create links only for the entries inside each directory.

Symlinks keep your OpenCode config synced with repository updates while preserving existing content.

### Linux/macOS (bash)

```bash
repo_root="$OPENCODE_CONFIG_DIR/ai-ddd-workflow"
for section in commands skills agents; do
  src_dir="$repo_root/$section"
  dst_dir="$OPENCODE_CONFIG_DIR/$section"
  mkdir -p "$dst_dir"
  for src in "$src_dir"/*; do
    [ -e "$src" ] || continue
    name="$(basename "$src")"
    dst="$dst_dir/$name"
    if [ ! -e "$dst" ] && [ ! -L "$dst" ]; then
      ln -s "$src" "$dst"
    fi
  done
done
```

If symlinks are not allowed:

```bash
repo_root="$OPENCODE_CONFIG_DIR/ai-ddd-workflow"
for section in commands skills agents; do
  src_dir="$repo_root/$section"
  dst_dir="$OPENCODE_CONFIG_DIR/$section"
  mkdir -p "$dst_dir"
  for src in "$src_dir"/*; do
    [ -e "$src" ] || continue
    name="$(basename "$src")"
    dst="$dst_dir/$name"
    if [ ! -e "$dst" ] && [ ! -L "$dst" ]; then
      cp -R "$src" "$dst"
    fi
  done
done
```

### Windows (PowerShell)

```powershell
$repoRoot = Join-Path $env:OPENCODE_CONFIG_DIR "ai-ddd-workflow"
$sections = @("commands", "skills", "agents")
foreach ($section in $sections) {
  $srcDir = Join-Path $repoRoot $section
  $dstDir = Join-Path $env:OPENCODE_CONFIG_DIR $section
  New-Item -ItemType Directory -Path $dstDir -Force | Out-Null
  Get-ChildItem -LiteralPath $srcDir | ForEach-Object {
    $dst = Join-Path $dstDir $_.Name
    if (-not (Test-Path -LiteralPath $dst)) {
      New-Item -ItemType SymbolicLink -Path $dst -Target $_.FullName | Out-Null
    }
  }
}
```

If symlinks are not allowed:

```powershell
$repoRoot = Join-Path $env:OPENCODE_CONFIG_DIR "ai-ddd-workflow"
$sections = @("commands", "skills", "agents")
foreach ($section in $sections) {
  $srcDir = Join-Path $repoRoot $section
  $dstDir = Join-Path $env:OPENCODE_CONFIG_DIR $section
  New-Item -ItemType Directory -Path $dstDir -Force | Out-Null
  Get-ChildItem -LiteralPath $srcDir | ForEach-Object {
    $dst = Join-Path $dstDir $_.Name
    if (-not (Test-Path -LiteralPath $dst)) {
      Copy-Item -LiteralPath $_.FullName -Destination $dst -Recurse -Force
    }
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
