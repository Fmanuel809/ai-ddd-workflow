# event-storming

## Purpose
Model domain behavior using events, commands, timelines, and hotspots for A2-event-storming.
Anti-scope: subdomain strategy, bounded context contracts, and implementation architecture.

## Stage & Ownership
- stage: `A2-event-storming`
- owner_agent: `event-storming-facilitator`
- handoffs:
  - consumes: A1 artifacts (`ubiquitous-language.md`, `domain-rules.md`, `actors-and-responsibilities.md`)
  - delivers: `event-storming.md`, `event-catalog.md`, `command-catalog.md`, `hotspots.md`

## Inputs (Required)
1. `artifacts/01-discovery/ubiquitous-language.md`
2. `artifacts/01-discovery/domain-rules.md`
3. `artifacts/01-discovery/actors-and-responsibilities.md`
4. User clarifications affecting flow behavior

## Outputs (Artifacts)
- `A2.1` -> `artifacts/02-event-storming/event-storming.md` (create or update)
- `A2.2` -> `artifacts/02-event-storming/event-catalog.md` (create or update)
- `A2.3` -> `artifacts/02-event-storming/command-catalog.md` (create or update)
- `A2.4` -> `artifacts/02-event-storming/hotspots.md` (create or update)

## Workflow (Steps)
1. Build scenario flows from actor intents and business rules.
2. Derive commands in imperative form.
3. Derive events in past tense and map causality.
4. Capture policies and invariants per transition.
5. Identify hotspots (ambiguity, coupling, high-risk transitions).
6. Stop point: unresolved causal links or policy conflicts become questions in `hotspots.md`; if blocking, ask grouped decisions with the OpenCode `question` tool.

## Quality Gates (Definition of Done)
- Every command maps to at least one domain event.
- Events are named in past tense and represent business outcomes.
- Causal chains include actor intent and policy checks.
- Hotspots are prioritized with explicit risk rationale.
- Terminology is consistent with A1 glossary.
- No material ambiguity remains untracked.

## Memory Writes (artifacts vs Engram)

### A) When memory.backend=artifacts
- write `artifacts/_state/session-log.md`: A2 execution summary and output artifact status.
- write `artifacts/_state/decisions.md`: event-command mapping decisions and invariants.
- write `artifacts/_state/open-questions.md`: unresolved hotspot questions.

### B) When memory.backend=engram
- Use the full Engram memory toolset (14 tools) as needed; do not limit operations to a fixed subset.
- target `engram:ddd.events` (topic_keys.events) via `mem_save` for event timelines.
- target `engram:ddd.risks` (topic_keys.risks) via `mem_save` for hotspots.
- use `mem_context`/`mem_search` to retrieve prior event decisions.
- use `mem_session_summary` with A2 artifact links and blocker status.

## Prompts / Scripts / References / Assets (Components)
- prompts:
  - `skills/event-storming/prompts/event-storming-session.prompt.md` - flow-to-event derivation prompt.
- scripts: N/A.
- references:
  - `skills/event-storming/references/index.md` - event storming conventions and checks.
- assets:
  - `skills/event-storming/assets/event-catalog.template.md` - event and command catalog template.

## Failure Modes
1. CRUD operations disguised as events -> rewrite to business outcome events.
2. Commands without events -> add missing outcomes or reject invalid commands.
3. Events without cause -> link to actor command or external trigger.
4. Technical sequence instead of domain flow -> re-anchor to business policy decisions.
5. Unranked hotspots -> add impact and likelihood ranking.

## Example Invocation (Minimal)
Invoke `event-storming` with A1 artifacts; generate A2.1-A2.4 and register unresolved causal gaps as open questions.
