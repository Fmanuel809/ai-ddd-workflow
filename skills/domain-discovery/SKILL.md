---
name: domain-discovery
description: Build A1 discovery artifacts with glossary, rules, actors, and material ambiguities.
compatibility: opencode
---

# domain-discovery

## Purpose
Identify domain language, rules, actors, and unresolved material questions for A1-discovery.
Anti-scope: implementation design, bounded context design, and technology choices.

## Stage & Ownership
- stage: `A1-discovery`
- owner_agent: `domain-analyst`
- handoffs:
  - consumes: `artifacts/00-intake/intake.md`, unresolved questions from configured memory backend, raw requirement input
  - delivers: `artifacts/01-discovery/ubiquitous-language.md`, `artifacts/01-discovery/domain-rules.md`, `artifacts/01-discovery/actors-and-responsibilities.md`, `artifacts/01-discovery/open-questions.md`

## Inputs (Required)
1. `artifacts/00-intake/intake.md`
2. Raw requirement statement and user clarifications
3. Existing unresolved questions from configured memory backend
4. Prior decisions if available in `artifacts/_state/decisions.md`

## Outputs (Artifacts)
- `A1.1` -> `artifacts/01-discovery/ubiquitous-language.md` (create or update)
- `A1.2` -> `artifacts/01-discovery/domain-rules.md` (create or update)
- `A1.3` -> `artifacts/01-discovery/actors-and-responsibilities.md` (create or update)
- `A1.4` -> `artifacts/01-discovery/open-questions.md` (create or update)

## Workflow (Steps)
1. Parse intake objective, scope, constraints, and unknowns.
2. Extract candidate domain terms and normalize synonyms.
3. Extract explicit and implicit business rules with sources.
4. Identify actors and responsibility boundaries.
5. Detect material ambiguities and append them to A1.4.
6. Validate consistency across A1.1-A1.4.
7. Stop point: if any critical rule conflict exists, stop and collect user decisions with the OpenCode `question` tool.

## Quality Gates (Definition of Done)
- All core terms have one unambiguous definition.
- Business rules are phrased in domain language and include source rationale.
- Every actor has explicit responsibility boundaries.
- Open questions only contain unresolved material ambiguities.
- Terminology is consistent across all A1 artifacts.
- No ambiguous requirement is silently assumed.

## Memory Writes (artifacts vs Engram)

### A) When memory.backend=artifacts
- write `artifacts/_state/session-log.md`: A1 completion summary and generated files.
- write `artifacts/_state/decisions.md`: glossary normalization and rule interpretation decisions.
- write `artifacts/_state/open-questions.md`: unresolved material ambiguities.

### B) When memory.backend=engram
- Use the full Engram memory toolset (14 tools) as needed; do not limit operations to a fixed subset.
- target `engram:ddd.glossary` (topic_keys.glossary) via `mem_save` for normalized terms.
- target `engram:ddd.domain` (topic_keys.domain) via `mem_save` for rules and actor map.
- use `mem_context` and `mem_search` before writing to avoid duplicate observations.
- use `mem_session_summary` at stage close with artifact references and unresolved questions.

## Prompts / Scripts / References / Assets (Components)
- prompts:
  - `skills/domain-discovery/prompts/discovery-analysis.prompt.md` - structured extraction prompt.
- scripts: N/A.
- references:
  - `skills/domain-discovery/references/index.md` - curated references for discovery heuristics.
- assets:
  - `skills/domain-discovery/assets/glossary.template.md` - glossary table template.

## Failure Modes
1. Inconsistent term definitions -> enforce canonical glossary and synonym bans.
2. Technical language replacing business language -> rewrite rules in domain terms.
3. Actor overlap -> split responsibilities by decision authority.
4. Hidden assumptions in rules -> mark as open questions with priority.
5. Missing exception handling -> add explicit rule exceptions and preconditions.

## Example Invocation (Minimal)
Invoke `domain-discovery` with inputs `artifacts/00-intake/intake.md` and raw requirement text; produce A1.1-A1.4 under `artifacts/01-discovery/` and register unresolved questions.
