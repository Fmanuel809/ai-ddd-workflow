# Subdomain Classification Prompt

## Intent
Classify capabilities into core/supporting/generic and justify strategic prioritization for stage A3-subdomains.

## Required Inputs
- `artifacts/02-event-storming/event-catalog.md`
- `artifacts/02-event-storming/hotspots.md`
- `artifacts/01-discovery/domain-rules.md`

## Output Artifacts
- `A3.1` -> `artifacts/03-subdomains/subdomain-map.md`
- `A3.2` -> `artifacts/03-subdomains/core-domain-rationale.md`
- `A3.3` -> `artifacts/03-subdomains/build-buy-reuse.md`

## Questions Policy
Ask only when classification changes strategic scope, capability ownership, or investment priority. Group by subdomain candidate.
Use the OpenCode `question` tool for blocking decisions.

## Token Discipline
Emit only artifact sections and required tables.
