---
name: review-and-readiness
description: Execute A7 cross-stage review and readiness decision artifact generation.
compatibility: opencode
---

# review-and-readiness

## Purpose
Execute stage A7 cross-stage review and produce final readiness decision with blockers and acceptance status.
Anti-scope: generating new domain design artifacts beyond review outputs.

## Stage & Ownership
- stage: `A7-review`
- owner_agent: `review-agent`
- handoffs:
  - consumes: all A0-A6 artifacts and state logs
  - delivers: `review.md`, `readiness.md`

## Inputs (Required)
1. `artifacts/00-intake/intake.md`
2. `artifacts/01-discovery/ubiquitous-language.md`
3. `artifacts/01-discovery/domain-rules.md`
4. `artifacts/02-event-storming/event-catalog.md`
5. `artifacts/03-subdomains/subdomain-map.md`
6. `artifacts/04-contexts/context-map.md`
7. `artifacts/05-domain-model/domain-model.md`
8. `artifacts/06-spec/traceability.md`
9. Unresolved questions from configured memory backend

## Outputs (Artifacts)
- `A7.1` -> `artifacts/07-review/review.md` (create or update)
- `A7.2` -> `artifacts/07-review/readiness.md` (create or update)

## Workflow (Steps)
1. Validate required artifacts exist and are coherent across stages.
2. Evaluate unresolved questions and acceptance of residual risks.
3. Record blocker list with severity and owner.
4. Produce readiness verdict: ready, conditionally ready, or blocked.
5. Escalate stop-the-line conflicts to challenger.

## Quality Gates (Definition of Done)
- All prior stage gate status is evaluated.
- Critical findings are resolved or explicitly accepted.
- Readiness decision includes explicit rationale and blockers.

## Memory Writes (artifacts vs Engram)

### A) When memory.backend=artifacts
- write `artifacts/_state/session-log.md`: A7 closure and readiness verdict.
- write `artifacts/_state/decisions.md`: accepted risks and final trade-offs.

### B) When memory.backend=engram
- use `mem_context`/`mem_search` to recover previous gate decisions.
- use `mem_save` for final readiness decision and blocker rationale.
- use `mem_session_summary` at stage close with review artifact links.

## Prompts / Scripts / References / Assets (Components)
- prompts:
  - `skills/review-and-readiness/prompts/review-check.prompt.md` - cross-stage coherence review prompt.
- scripts: N/A.
- references: N/A.
- assets: N/A.

## Example Invocation (Minimal)
Invoke `review-and-readiness` with A0-A6 artifacts and open questions; produce `artifacts/07-review/review.md` and `artifacts/07-review/readiness.md`.
