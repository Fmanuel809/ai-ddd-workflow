---
description: Initialize DDD workflow in current project, run OS-specific init script, and capture idea context into AGENTS.md
agent: ddd-workflow-orchestrator
---

Initialize the DDD workflow in the current project directory.

## Inputs
- Idea/context from command arguments: `$ARGUMENTS`

## Execution
1. Resolve the global workflow package root using this priority:
   - `$OPENCODE_CONFIG_DIR/ai-ddd-workflow`
   - `$XDG_CONFIG_HOME/opencode/ai-ddd-workflow`
   - `~/.config/opencode/ai-ddd-workflow`
2. Confirm the package contains:
   - `scripts/init.sh`
   - `scripts/init.ps1`
3. Detect current shell family and run the matching init script against the current project path:
   - POSIX shells (`bash`, `zsh`, `sh`, including Git Bash/WSL): `bash "<workflow-root>/scripts/init.sh" "$PWD"`
   - PowerShell shells (`powershell`, `pwsh`): `powershell.exe -NoProfile -ExecutionPolicy Bypass -File "<workflow-root>/scripts/init.ps1" (Get-Location).Path`
   - Do not use `powershell.exe -Command "..."` with unescaped `$` from POSIX shells.
4. If `$ARGUMENTS` is not empty:
   - Invoke the `brainstorming` skill.
   - Build a concise project-context proposal from the idea.
   - Update `AGENTS.md` by creating or replacing a `## Project Context` section with:
     - `Goal`
     - `In Scope`
     - `Out Of Scope`
     - `Success Criteria`
     - `Open Questions`
5. Keep output minimal: report only initialization result and whether `AGENTS.md` context was updated.
6. Scope placement rule:
   - Project gets analysis assets (`artifacts/`, `AGENTS.md`, `ddd-config.yml`).
   - Skills, skills registry, and workflow agents remain in global OpenCode config.

## Constraints
- Do not run ad-hoc analysis outside the workflow conventions.
- Do not modify files other than initialization targets and `AGENTS.md` context section.
- Do not generate code, scaffolds, tests, or infrastructure from this command.
