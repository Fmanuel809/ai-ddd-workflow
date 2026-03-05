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
3. Detect OS and run the matching init script against the current project path:
   - Unix/macOS/Linux/WSL: `bash "<workflow-root>/scripts/init.sh" "$PWD"`
   - Windows: `powershell.exe -NoProfile -ExecutionPolicy Bypass -File "<workflow-root>/scripts/init.ps1" "$PWD"`
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

## Constraints
- Do not run ad-hoc analysis outside the workflow conventions.
- Do not modify files other than initialization targets and `AGENTS.md` context section.
