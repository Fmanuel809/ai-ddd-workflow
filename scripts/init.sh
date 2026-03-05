#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="${1:-$PWD}"

detect_opencode_config_dir() {
  if [[ -n "${OPENCODE_CONFIG_DIR:-}" ]]; then
    printf "%s" "$OPENCODE_CONFIG_DIR"
    return
  fi

  if [[ -n "${XDG_CONFIG_HOME:-}" ]]; then
    printf "%s" "$XDG_CONFIG_HOME/opencode"
    return
  fi

  printf "%s" "$HOME/.config/opencode"
}

mkdir -p "$TARGET_DIR"

if [[ -f "$TARGET_DIR/.opencode/agents/ddd-workflow-orchestrator.md" ]]; then
  echo "Project-scope OpenCode workflow already installed in $TARGET_DIR/.opencode. Init is not required."
  exit 0
fi

CONFIG_DIR="$(detect_opencode_config_dir)"
SOURCE_WORKFLOW="$CONFIG_DIR/ai-ddd-workflow"

if [[ ! -d "$SOURCE_WORKFLOW" ]]; then
  echo "Global workflow not found at $SOURCE_WORKFLOW"
  echo "Install globally first using instructions/.opencode/install.md"
  exit 1
fi

cp -R "$SOURCE_WORKFLOW/AGENTS.md" "$TARGET_DIR/AGENTS.md"
cp -R "$SOURCE_WORKFLOW/ddd-config.yml" "$TARGET_DIR/ddd-config.yml"

if [[ -d "$TARGET_DIR/artifacts" ]]; then
  rm -rf "$TARGET_DIR/artifacts"
fi

cp -R "$SOURCE_WORKFLOW/artifacts" "$TARGET_DIR/artifacts"

echo "Initialized DDD workflow structure at $TARGET_DIR"
