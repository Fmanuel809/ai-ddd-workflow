# requirements-specification

## Purpose
Synthesize implementation-planning requirements, interfaces, NFRs, ADR set, and traceability for A6-specification.
Anti-scope: implementation coding and deployment execution.

## Stage & Ownership
- stage: `A6-specification`
- owner_agent: `specification-agent`
- handoffs:
  - consumes: A5 domain model artifacts, A4 integration contracts, and decision logs
  - delivers: `prd.md`, `interfaces.md`, `nfrs.md`, `adrs/` (ADR-0001+.md), `traceability.md`

## Inputs (Required)
1. `artifacts/05-domain-model/domain-model.md`
2. `artifacts/05-domain-model/invariants.md`
3. `artifacts/04-contexts/integration-contracts.md`
4. `artifacts/_state/decisions.md`
5. Current open questions from `artifacts/_state/open-questions.md`

## Outputs (Artifacts)
- `A6.1` -> `artifacts/06-spec/prd.md` (create or update)
- `A6.2` -> `artifacts/06-spec/interfaces.md` (create or update)
- `A6.3` -> `artifacts/06-spec/nfrs.md` (create or update)
- `A6.4` -> `artifacts/06-spec/adrs/` (create or update `ADR-0001+.md` files)
- `A6.5` -> `artifacts/06-spec/traceability.md` (create or update)

## Workflow (Steps)
1. Convert domain behavior into testable functional requirements.
2. Derive interface contracts from context integrations.
3. Define measurable NFRs with target thresholds.
4. Capture architecture decisions as ADRs (`ADR-0001+.md`).
5. Build traceability matrix linking A1-A6 lineage.
6. Stop point: unresolved acceptance criteria or NFR thresholds go to open questions.

## Quality Gates (Definition of Done)
- PRD includes testable functional requirements and acceptance criteria.
- Interfaces include contracts, error semantics, and ownership.
- NFRs are measurable with target thresholds.
- Traceability links requirements to model, contexts, and ADRs.
- Terminology is aligned with prior stage artifacts.
- Material ambiguity remains only in explicit open questions.

## Memory Writes (artifacts vs Engram)

### A) When memory.backend=artifacts
- write `artifacts/_state/session-log.md`: A6 closure and delivered artifacts.
- write `artifacts/_state/decisions.md`: ADR summaries, alternatives, and consequences.
- write `artifacts/_state/open-questions.md`: unresolved acceptance/NFR decisions.

### B) When memory.backend=engram
- Use the full Engram memory toolset (14 tools) as needed; do not limit operations to a fixed subset.
- target `engram:ddd.decisions` (topic_keys.decisions) via `mem_save` for ADR summaries.
- target `engram:ddd.project` (topic_keys.project) via `mem_save` for specification baseline.
- use `mem_context`/`mem_search` to recover previous decisions and unresolved risks.
- use `mem_session_summary` at stage close with traceability pointers.

## Prompts / Scripts / References / Assets (Components)
- prompts:
  - `skills/requirements-specification/prompts/specification-synthesis.prompt.md` - synthesis prompt for A6 artifacts.
- scripts: N/A.
- references:
  - `skills/requirements-specification/references/index.md` - concise references for PRD/ADR/NFR quality.
- assets:
  - `skills/requirements-specification/assets/prd.template.md` - PRD template.
  - `skills/requirements-specification/assets/adr.template.md` - ADR template.

## Failure Modes
1. Requirements not testable -> rewrite with explicit acceptance criteria.
2. Interfaces without error semantics -> add failure codes and retry semantics.
3. NFRs without measurable thresholds -> convert to quantifiable targets.
4. ADR missing alternatives -> add options and tradeoff consequences.
5. Traceability gaps across stages -> complete requirement-to-artifact mapping.

## Example Invocation (Minimal)
Invoke `requirements-specification` with A5/A4 artifacts and decision logs; generate A6.1-A6.5 including ADR-0001+.md convention under `artifacts/06-spec/adrs/`.
