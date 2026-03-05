# Specification Synthesis Prompt

## Intent
Generate implementation-planning specification artifacts for stage A6-specification.

Hard boundary: do not generate code, scaffolds, tests, CI/CD definitions, or infrastructure manifests.

## Required Inputs
- `artifacts/05-domain-model/domain-model.md`
- `artifacts/05-domain-model/invariants.md`
- `artifacts/04-contexts/integration-contracts.md`
- `artifacts/_state/decisions.md`

## Output Artifacts
- `A6.1` -> `artifacts/06-spec/prd.md`
- `A6.2` -> `artifacts/06-spec/interfaces.md`
- `A6.3` -> `artifacts/06-spec/nfrs.md`
- `A6.4` -> `artifacts/06-spec/adrs/` with `ADR-0001+.md`
- `A6.5` -> `artifacts/06-spec/traceability.md`

## Questions Policy
Ask only when acceptance criteria, ownership, interfaces, or measurable NFR targets are undefined.

## Token Discipline
Output only artifact markdown and ADR documents.
