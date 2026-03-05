# Intake Capture Prompt

## Intent
Capture stage A0-intake objective, scope boundaries, constraints, and material unknowns.

## Required Inputs
- Raw requirement statement
- User clarifications
- Existing `artifacts/_state/open-questions.md` (if exists)

## Output Artifacts
- `A0.1` -> `artifacts/00-intake/intake.md`
- `A0.2` -> `artifacts/_state/open-questions.md`

## Questions Policy
When ambiguity is material, ask grouped and prioritized decisions using the OpenCode `question` tool.
Do not leave unresolved questions only as plain text if user input is required to proceed.

## Token Discipline
Respond with artifact content only.
