# Quality Gates

## Purpose
Define stage-level Definition of Done and pipeline stop behavior.

## Gate Enforcement

1. Each stage must pass all listed gates before progression.
2. If any gate fails:
   - The `ddd-workflow-orchestrator` stops the pipeline.
   - Open questions are generated and recorded.
   - Progression to the next stage is blocked.

## Definition Of Done By Stage

### A0 - Intake
- Objective and business problem are explicit and testable.
- Scope boundaries and constraints are documented.
- Material unknowns are captured as open questions.

### A1 - Discovery
- Domain signals and assumptions are explicit.
- Glossary terms are unambiguous.
- Discovery output remains consistent with A0 scope.

### A2 - Event Storming
- Critical end-to-end flows are represented.
- Commands/events show causal consistency.
- Invariants and exception paths are identified.

### A3 - Subdomains
- Core/supporting/generic classification is justified.
- Strategic priority criteria are explicit.
- Dependency map is complete enough for context design.

### A4 - Bounded Contexts
- Boundaries are clear and non-overlapping.
- Ownership and integration relationships are explicit.
- Context map includes integration patterns and contracts.

### A5 - Domain Model
- Aggregates/entities/value objects are internally consistent.
- Invariants and transaction boundaries are explicit.
- Model traceability to A2 and A4 is demonstrated.

### A6 - Specification & ADRs
- Functional and non-functional requirements are testable.
- Acceptance criteria are explicit and verifiable.
- ADRs include context, decision, alternatives, and consequences.

### A7 - Review
- Cross-stage coherence is validated.
- Critical findings are resolved or explicitly accepted.
- Readiness decision and blockers are documented.
