# Domain Modeling Prompt

## Intent
Produce tactical domain model artifacts with aggregate boundaries, invariants, and event ownership for stage A5-domain-model.

## Required Inputs
- `artifacts/04-contexts/bounded-contexts.md`
- `artifacts/04-contexts/context-map.md`
- `artifacts/02-event-storming/event-catalog.md`

## Output Artifacts
- `A5.1` -> `artifacts/05-domain-model/domain-model.md`
- `A5.2` -> `artifacts/05-domain-model/invariants.md`
- `A5.3` -> `artifacts/05-domain-model/events-by-context.md`

## Questions Policy
Ask only for ambiguous invariants, aggregate ownership conflicts, or unresolved transaction boundaries.
Use the OpenCode `question` tool for blocking decisions.

## Token Discipline
Respond with artifact markdown only.
