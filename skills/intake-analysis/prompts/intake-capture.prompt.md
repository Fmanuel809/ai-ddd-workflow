# Intake Capture Prompt

## Intent
Capture stage A0-intake objective, scope boundaries, constraints, and material unknowns.

## Required Inputs
- Raw requirement statement
- User clarifications
- Existing unresolved questions from the configured memory backend (if exists)

## Output Artifacts
- `A0.1` -> `artifacts/00-intake/intake.md`

## Questions Policy
When ambiguity is material, ask grouped and prioritized decisions using the OpenCode `question` tool.
Do not leave unresolved questions only as plain text if user input is required to proceed.
For `memory.backend=engram`, persist unresolved blockers using Engram tools instead of `_state` files.

## Token Discipline
Respond with artifact content only.
