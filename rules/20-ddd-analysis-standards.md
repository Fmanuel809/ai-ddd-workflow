# DDD Analysis Standards

## Purpose
Define mandatory standards for DDD analysis artifacts and modeling quality.

## Core Standards

### 1) Ubiquitous Language
- Use one canonical term per concept.
- Forbid synonyms for the same domain concept unless explicitly mapped.
- Define terms with business meaning, not implementation detail.

### 2) Event Storming
- Model domain behavior as business-significant events.
- Link commands to resulting events and actor intent.
- Capture invariants and policy checks near the flow.

### 3) Subdomain Classification
- Classify each subdomain as Core, Supporting, or Generic.
- Provide strategic rationale and business impact for each classification.
- Identify capability dependencies between subdomains.

### 4) Bounded Contexts
- Define explicit boundaries for language, rules, and data ownership.
- Prevent overlapping responsibilities across contexts.
- State upstream/downstream relationships.

### 5) Context Maps
- Document integration style per relationship (for example ACL, OHS, Published Language).
- Record contracts, ownership direction, and change impact.
- Include failure and versioning expectations.

### 6) Domain Invariants
- Express invariants as business truths that must always hold.
- Tie invariants to decision points and transaction boundaries.
- Include what must happen when invariant checks fail.

## Error Detection Heuristics

### CRUD disguised as domain model
Indicators:
- Model is only create/read/update/delete operations with no behavior.
- Events are technical ("record_updated") rather than business outcomes.
Action:
- Reframe around business decisions, policies, and domain events.

### God aggregates
Indicators:
- One aggregate owns too many unrelated responsibilities.
- High write contention and broad consistency boundaries.
Action:
- Split by invariant boundaries and transactional necessity.

### Context leakage
Indicators:
- One context uses internal terms or rules from another context directly.
- Shared database schemas drive behavior coupling.
Action:
- Introduce explicit contracts and translation layers.

### Semantic conflicts
Indicators:
- Same term has different meanings across artifacts without disambiguation.
- Different terms represent the same concept in the same context.
Action:
- Normalize glossary and add context-qualified naming where needed.
