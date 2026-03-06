# Memory Policy

## Purpose
Define memory behavior controlled by `ddd-config.yml`.

## Mandatory Precondition

1. Read `ddd-config.yml` before stage execution.
2. Apply memory behavior from `memory.backend`.

## Backend: artifacts

If `memory.backend = artifacts`, persist state in:

- `artifacts/_state/session-log.md`
- `artifacts/_state/decisions.md`
- `artifacts/_state/open-questions.md`

Minimum persistence duties:

- Session updates and checkpoints in `session-log.md`.
- Decision records and rationale in `decisions.md`.
- Unresolved material gaps in `open-questions.md`.

## Backend: engram

If `memory.backend = engram`:

1. Engram usage is mandatory for stage execution and close-out; do not skip memory operations.
2. Orchestrator starts one shared workflow session with `mem_session_start` and reuses the same `session_id` across all stages/sub-agents.
3. At stage start, recover context with `mem_context` (and `mem_search` if needed).
4. At stage close, persist outcomes/decisions with `mem_save`.
5. Resolve blocking ambiguities with OpenCode `question` before stage transition, then persist decisions with `mem_save`.
6. At workflow close, persist summary with `mem_session_summary` and close with `mem_session_end`.
7. Use the full set of 14 available Engram memory tools when required by the workflow.
8. Do not hard-limit usage to a fixed subset of tools if the workflow needs others.
9. Do not invent custom memory APIs or parallel memory protocols.
10. Follow configured fallback if Engram is unavailable.
11. Do not write state to `artifacts/_state/*` when `memory.backend=engram` unless fallback is triggered.
