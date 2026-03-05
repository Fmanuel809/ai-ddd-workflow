---
name: subdomain-analysis
description: Build A3 subdomain classification and strategic prioritization artifacts.
compatibility: opencode
---

# subdomain-analysis

## Purpose
Classify domain capabilities into core, supporting, and generic subdomains and define strategic priorities for A3-subdomains.
Anti-scope: detailed context contracts and aggregate design.

## Stage & Ownership
- stage: `A3-subdomains`
- owner_agent: `domain-analyst`
- handoffs:
  - consumes: A2 event outputs and A1 business rules
  - delivers: `subdomain-map.md`, `core-domain-rationale.md`, `build-buy-reuse.md`

## Inputs (Required)
1. `artifacts/02-event-storming/event-catalog.md`
2. `artifacts/02-event-storming/hotspots.md`
3. `artifacts/01-discovery/domain-rules.md`
4. Existing strategic constraints from intake or decisions log

## Outputs (Artifacts)
- `A3.1` -> `artifacts/03-subdomains/subdomain-map.md` (create or update)
- `A3.2` -> `artifacts/03-subdomains/core-domain-rationale.md` (create or update)
- `A3.3` -> `artifacts/03-subdomains/build-buy-reuse.md` (create or update)

## Workflow (Steps)
1. Cluster capabilities by business outcome and rule coupling.
2. Assign each cluster to core/supporting/generic.
3. Document rationale for core differentiation.
4. Build build-buy-reuse matrix per capability.
5. Validate dependency map and strategic coherence.
6. Stop point: unresolved classification conflicts must be resolved via grouped prompts using the OpenCode `question` tool before advancing.

## Quality Gates (Definition of Done)
- Every capability is assigned to one subdomain classification.
- Core domain rationale includes differentiation evidence.
- Build-buy-reuse decisions include constraints and assumptions.
- No subdomain is defined only by technical layers.
- Classification terminology is consistent with A1 and A2.
- Material ambiguities are recorded as open questions.

## Memory Writes (artifacts vs Engram)

### A) When memory.backend=artifacts
- write `artifacts/_state/session-log.md`: A3 completion and output references.
- write `artifacts/_state/decisions.md`: classification rationale and strategic tradeoffs.
- write `artifacts/_state/open-questions.md`: unresolved capability ownership or strategy gaps.

### B) When memory.backend=engram
- Use the full Engram memory toolset (14 tools) as needed; do not limit operations to a fixed subset.
- target `engram:ddd.domain` (topic_keys.domain) via `mem_save` for subdomain definitions.
- target `engram:ddd.decisions` (topic_keys.decisions) via `mem_save` for build-buy-reuse rationale.
- use `mem_context`/`mem_search` for prior strategic decisions.
- use `mem_session_summary` for A3 closure.

## Prompts / Scripts / References / Assets (Components)
- prompts:
  - `skills/subdomain-analysis/prompts/subdomain-classification.prompt.md` - capability classification prompt.
- scripts: N/A.
- references:
  - `skills/subdomain-analysis/references/index.md` - strategic DDD reference set.
- assets:
  - `skills/subdomain-analysis/assets/subdomain-map.template.md` - subdomain matrix template.

## Failure Modes
1. Core domain picked by technical novelty -> re-evaluate by business differentiation.
2. Supporting/generic mixed in one capability -> split by rule ownership.
3. Build-buy-reuse without constraints -> add explicit economic and risk criteria.
4. Missing capability dependencies -> add directed dependency map.
5. Semantic drift from prior stages -> align terms to A1 glossary.

## Example Invocation (Minimal)
Invoke `subdomain-analysis` with A2 and A1 artifacts; generate A3.1-A3.3 and log unresolved strategic conflicts.
