# Context Mapping Prompt

## Intent
Produce bounded context boundaries, context map relationships, integration contracts, and data ownership for stage A4-bounded-contexts.

## Required Inputs
- `artifacts/03-subdomains/subdomain-map.md`
- `artifacts/03-subdomains/core-domain-rationale.md`
- `artifacts/02-event-storming/event-catalog.md`

## Output Artifacts
- `A4.1` -> `artifacts/04-contexts/bounded-contexts.md`
- `A4.2` -> `artifacts/04-contexts/context-map.md`
- `A4.3` -> `artifacts/04-contexts/integration-contracts.md`
- `A4.4` -> `artifacts/04-contexts/data-ownership.md`

## Questions Policy
Ask only for unresolved ownership, relationship direction, or contract semantics that materially affect boundaries.

## Token Discipline
Produce only artifact content in markdown format.
