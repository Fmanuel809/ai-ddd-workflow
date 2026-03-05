# Event Storming Session Prompt

## Intent
Generate domain event flows, command mappings, and hotspot analysis for stage A2-event-storming.

## Required Inputs
- `artifacts/01-discovery/ubiquitous-language.md`
- `artifacts/01-discovery/domain-rules.md`
- `artifacts/01-discovery/actors-and-responsibilities.md`

## Output Artifacts
- `A2.1` -> `artifacts/02-event-storming/event-storming.md`
- `A2.2` -> `artifacts/02-event-storming/event-catalog.md`
- `A2.3` -> `artifacts/02-event-storming/command-catalog.md`
- `A2.4` -> `artifacts/02-event-storming/hotspots.md`

## Questions Policy
Ask only for missing causal links, undefined policies, or ambiguous state transitions. Batch questions by flow.

## Token Discipline
Return only artifact-ready markdown sections.
