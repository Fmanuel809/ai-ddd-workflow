# domain-modeling

## Purpose
Design aggregates, entities, value objects, invariants, and event assignment by context for A5-domain-model.
Anti-scope: UI/API implementation details and deployment architecture.

## Stage & Ownership
- stage: `A5-domain-model`
- owner_agent: `domain-modeler`
- handoffs:
  - consumes: A4 context artifacts and A2 event catalog
  - delivers: `domain-model.md`, `invariants.md`, `events-by-context.md`

## Inputs (Required)
1. `artifacts/04-contexts/bounded-contexts.md`
2. `artifacts/04-contexts/context-map.md`
3. `artifacts/02-event-storming/event-catalog.md`
4. Prior design decisions from `artifacts/_state/decisions.md`

## Outputs (Artifacts)
- `A5.1` -> `artifacts/05-domain-model/domain-model.md` (create or update)
- `A5.2` -> `artifacts/05-domain-model/invariants.md` (create or update)
- `A5.3` -> `artifacts/05-domain-model/events-by-context.md` (create or update)

## Workflow (Steps)
1. Identify aggregate boundaries from invariants and transaction needs.
2. Distinguish entities from value objects using identity semantics.
3. Map events to owning bounded contexts.
4. Define invariants with trigger, validation, and failure outcome.
5. Validate model alignment with A2 and A4.
6. Stop point: unresolved aggregate ownership or invariant conflicts are logged as open questions.

## Quality Gates (Definition of Done)
- Aggregates are bounded by invariants and transactional consistency.
- Entities and value objects are distinguished by identity semantics.
- Invariants include validation trigger and failure policy.
- Events-by-context mapping has no context leakage.
- Terminology aligns with A1 glossary and A4 contexts.
- Material ambiguities are explicitly recorded.

## Memory Writes (artifacts vs Engram)

### A) When memory.backend=artifacts
- write `artifacts/_state/session-log.md`: A5 modeling summary and artifact updates.
- write `artifacts/_state/decisions.md`: aggregate boundary and invariant tradeoffs.
- write `artifacts/_state/open-questions.md`: unresolved model conflicts.

### B) When memory.backend=engram
- Use the full Engram memory toolset (14 tools) as needed; do not limit operations to a fixed subset.
- target `engram:ddd.contexts` (topic_keys.contexts) via `mem_save` for aggregate ownership.
- target `engram:ddd.decisions` (topic_keys.decisions) via `mem_save` for invariants and boundaries.
- use `mem_context`/`mem_search` to load prior model constraints.
- use `mem_session_summary` for stage closure with key model changes.

## Prompts / Scripts / References / Assets (Components)
- prompts:
  - `skills/domain-modeling/prompts/domain-modeling.prompt.md` - tactical modeling prompt.
- scripts: N/A.
- references:
  - `skills/domain-modeling/references/index.md` - tactical DDD modeling reference set.
- assets:
  - `skills/domain-modeling/assets/domain-model.template.md` - aggregate/entity/value-object template.

## Failure Modes
1. God aggregate spanning unrelated rules -> split by invariant boundary.
2. Value object modeled as entity -> remove identity and enforce immutability.
3. Invariants stated without enforcement point -> add trigger and transaction scope.
4. Event ownership assigned to wrong context -> remap by business authority.
5. Model defined from database schema only -> re-anchor to behavior and rules.

## Example Invocation (Minimal)
Invoke `domain-modeling` with A4 and A2 artifacts; generate A5.1-A5.3 and register unresolved aggregate boundary questions.
