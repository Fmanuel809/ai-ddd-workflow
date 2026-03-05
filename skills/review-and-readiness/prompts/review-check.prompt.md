# Review Check Prompt

## Intent
Run stage A7 review for cross-stage coherence, unresolved blockers, and readiness decision.

## Required Inputs
- A0-A6 stage artifacts
- `artifacts/_state/open-questions.md`

## Output Artifacts
- `A7.1` -> `artifacts/07-review/review.md`
- `A7.2` -> `artifacts/07-review/readiness.md`

## Questions Policy
If unresolved blockers require human decisions, ask grouped decisions through the OpenCode `question` tool.

## Token Discipline
Return only artifact-ready markdown.
