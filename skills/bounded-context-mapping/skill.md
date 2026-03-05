# bounded-context-mapping

## Purpose
Define bounded contexts, context relationships, integration contracts, and data ownership for A4-bounded-contexts.
Anti-scope: aggregate internals and implementation-level APIs.

## Stage & Ownership
- stage: `A4-bounded-contexts`
- owner_agent: `contexts-agent`
- handoffs:
  - consumes: A3 subdomain outputs and A2 event catalog
  - delivers: `bounded-contexts.md`, `context-map.md`, `integration-contracts.md`, `data-ownership.md`

## Inputs (Required)
1. `artifacts/03-subdomains/subdomain-map.md`
2. `artifacts/03-subdomains/core-domain-rationale.md`
3. `artifacts/02-event-storming/event-catalog.md`
4. Prior integration constraints from `artifacts/_state/decisions.md` when available

## Outputs (Artifacts)
- `A4.1` -> `artifacts/04-contexts/bounded-contexts.md` (create or update)
- `A4.2` -> `artifacts/04-contexts/context-map.md` (create or update)
- `A4.3` -> `artifacts/04-contexts/integration-contracts.md` (create or update)
- `A4.4` -> `artifacts/04-contexts/data-ownership.md` (create or update)

## Workflow (Steps)
1. Derive candidate contexts from capability and language boundaries.
2. Define context responsibilities and anti-corruption needs.
3. Create context map with relationship direction and pattern.
4. Specify integration contracts and failure semantics.
5. Build data ownership matrix by source of truth.
6. Stop point: unresolved ownership or coupling conflicts become open questions.

## Quality Gates (Definition of Done)
- Every context has explicit boundary, purpose, and owner.
- Context map declares relationship type and direction.
- Integration contracts specify data, protocol, and failure handling.
- Data ownership defines source-of-truth per entity.
- Terminology remains consistent across contexts.
- Material boundary ambiguity is tracked and unresolved items are logged.

## Memory Writes (artifacts vs Engram)

### A) When memory.backend=artifacts
- write `artifacts/_state/session-log.md`: A4 progress and output references.
- write `artifacts/_state/decisions.md`: context boundary and contract decisions.
- write `artifacts/_state/open-questions.md`: unresolved context ownership and integration questions.

### B) When memory.backend=engram
- target `engram:ddd.contexts` (topic_keys.contexts) via `mem_save` for bounded contexts and map.
- target `engram:ddd.risks` (topic_keys.risks) via `mem_save` for leakage/coupling risks.
- use `mem_context`/`mem_search` to recover previous contract decisions.
- use `mem_session_summary` at stage close with produced artifact links.

## Prompts / Scripts / References / Assets (Components)
- prompts:
  - `skills/bounded-context-mapping/prompts/context-mapping.prompt.md` - boundary and relationship derivation prompt.
- scripts: N/A.
- references:
  - `skills/bounded-context-mapping/references/index.md` - relationship patterns and contract checks.
- assets:
  - `skills/bounded-context-mapping/assets/context-map.template.md` - context map template.

## Failure Modes
1. Context boundaries based on technical layers -> redraw boundaries by language and policy ownership.
2. Context leakage through shared terms with different meaning -> add translation/ACL strategy.
3. Integration contracts without failure semantics -> add retries, timeouts, and error taxonomy.
4. Missing source-of-truth ownership -> define authoritative write owner per entity.
5. Overlapping responsibilities across contexts -> split by invariant ownership.

## Example Invocation (Minimal)
Invoke `bounded-context-mapping` with A3 and A2 artifacts; generate A4.1-A4.4 and record unresolved ownership conflicts.
