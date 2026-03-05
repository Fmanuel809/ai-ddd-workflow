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

1. Use the full set of 14 available Engram memory tools when needed by the stage.
2. Do not hard-limit usage to a fixed subset of tools if the workflow needs others.
3. Do not invent custom memory APIs or parallel memory protocols.
4. Follow configured fallback if Engram is unavailable.
