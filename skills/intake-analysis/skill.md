# intake-analysis

## Purpose
Establish objective, scope, constraints, stakeholders, and success criteria for A0-intake.
Anti-scope: deep domain modeling, event design, context mapping, and implementation planning.

## Stage & Ownership
- stage: `A0-intake`
- owner_agent: `intake-agent`
- handoffs:
  - consumes: raw requirement statement and user context
  - delivers: `intake.md`, `_state/open-questions.md`

## Inputs (Required)
1. Raw requirement statement
2. Any user-provided project constraints
3. Existing `artifacts/_state/open-questions.md` (if present)

## Outputs (Artifacts)
- `A0.1` -> `artifacts/00-intake/intake.md` (create or update)
- `A0.2` -> `artifacts/_state/open-questions.md` (create or update)

## Workflow (Steps)
1. Capture problem statement and expected business outcomes.
2. Define in-scope and out-of-scope boundaries.
3. Capture constraints, assumptions, stakeholders, and success criteria.
4. Detect material unknowns and write prioritized questions.
5. If ambiguities block safe progression, ask grouped decisions through OpenCode `question` tool.

## Quality Gates (Definition of Done)
- Problem statement is explicit and testable.
- In-scope and out-of-scope are documented.
- Constraints and assumptions are visible and traceable.
- Material unknowns are captured as open questions.

## Memory Writes (artifacts vs Engram)

### A) When memory.backend=artifacts
- write `artifacts/_state/session-log.md`: A0 execution summary and output references.
- write `artifacts/_state/open-questions.md`: unresolved material ambiguities.

### B) When memory.backend=engram
- use `mem_context` at stage start to recover prior project context.
- use `mem_save` for intake decisions, constraints, and scope boundaries.
- use `mem_save_prompt` to persist user objective statement.
- use `mem_session_summary` at stage close with A0 artifact references.

## Prompts / Scripts / References / Assets (Components)
- prompts:
  - `skills/intake-analysis/prompts/intake-capture.prompt.md` - intake extraction prompt.
- scripts: N/A.
- references: N/A.
- assets: N/A.

## Example Invocation (Minimal)
Invoke `intake-analysis` with user requirement text; produce `artifacts/00-intake/intake.md` and update `artifacts/_state/open-questions.md`.
