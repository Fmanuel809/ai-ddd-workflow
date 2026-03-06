# AGENTS.md - DDD Team Single Source of Truth

## 1) Operating Philosophy

1. Non-complacent execution: agents do not rubber-stamp assumptions.
2. Material ambiguity policy: if ambiguity can change architecture, scope, risk, cost, or acceptance criteria, pause and ask focused questions.
3. Challenger authority: challenger/review has stop-the-line authority and can block progression.
4. Evidence-first decisions: decisions, risks, and tradeoffs must be traceable in artifacts.
5. Rule precedence: this document and configured rule sources are binding.
6. Orchestration boundary: the orchestrator coordinates pipeline execution and validation; specialist analysis is delegated to sub-agents.
7. Analysis-only mandate: this workflow produces domain/design artifacts only and must not perform software implementation or scaffolding.

## 2) OpenCode Scope Neutrality

1. This specification is scope-neutral: agents and skills can be resolved from project scope or global scope.
2. Project scope examples: `.opencode/agents/`, `.opencode/skills/`.
3. Global scope examples: `~/.config/opencode/agents/`, `~/.config/opencode/skills/`.
4. References in this document use logical IDs and path templates, not hard-coded physical locations for agents/skills.

## 3) Stages & Deliverables (A0-A7)

Path template notation:
- `${ARTIFACT_ROOT}` is resolved from `ddd-config.yml` (`artifacts.root`).

### A0 - Intake
- Purpose: establish objective, scope boundaries, constraints, stakeholders, and success criteria.
- Required artifacts (ID -> path template):
  - `A0-INTAKE-01` -> `${ARTIFACT_ROOT}/00-intake/intake.md`
- Owner agent (logical): `intake-agent`
- Quality gates (Definition of Done):
  - Problem statement is explicit and testable.
  - In/out of scope is documented.
  - Material unknowns are logged.

### A1 - Discovery
- Purpose: build shared domain understanding and ubiquitous language baseline.
- Required artifacts (ID -> path template):
  - `A1-UBIQUITOUS-LANGUAGE-01` -> `${ARTIFACT_ROOT}/01-discovery/ubiquitous-language.md`
  - `A1-DOMAIN-RULES-01` -> `${ARTIFACT_ROOT}/01-discovery/domain-rules.md`
  - `A1-ACTORS-01` -> `${ARTIFACT_ROOT}/01-discovery/actors-and-responsibilities.md`
- Owner agent (logical): `domain-analyst`
- Quality gates (Definition of Done):
  - Domain signals and assumptions are explicit.
  - Glossary terms are unambiguous.
  - Output is consistent with A0 scope.

### A2 - Event Storming
- Purpose: model domain behavior through events, commands, actors, and invariants.
- Required artifacts (ID -> path template):
  - `A2-STORMING-01` -> `${ARTIFACT_ROOT}/02-event-storming/event-storming.md`
  - `A2-EVENT-CATALOG-01` -> `${ARTIFACT_ROOT}/02-event-storming/event-catalog.md`
  - `A2-COMMAND-CATALOG-01` -> `${ARTIFACT_ROOT}/02-event-storming/command-catalog.md`
  - `A2-HOTSPOTS-01` -> `${ARTIFACT_ROOT}/02-event-storming/hotspots.md`
- Owner agent (logical): `event-storming-facilitator`
- Quality gates (Definition of Done):
  - Critical flows are represented end-to-end.
  - Commands and events are causally coherent.
  - Key invariants are identified.

### A3 - Subdomains
- Purpose: classify subdomains and identify strategic differentiation.
- Required artifacts (ID -> path template):
  - `A3-SUBDOMAIN-MAP-01` -> `${ARTIFACT_ROOT}/03-subdomains/subdomain-map.md`
  - `A3-CORE-RATIONALE-01` -> `${ARTIFACT_ROOT}/03-subdomains/core-domain-rationale.md`
  - `A3-BUILD-BUY-REUSE-01` -> `${ARTIFACT_ROOT}/03-subdomains/build-buy-reuse.md`
- Owner agent (logical): `domain-analyst`
- Quality gates (Definition of Done):
  - Core/supporting/generic classification is justified.
  - Strategic priorities are explicit.
  - Dependencies are identified.

### A4 - Bounded Contexts
- Purpose: define bounded contexts, boundaries, and integration relationships.
- Required artifacts (ID -> path template):
  - `A4-BOUNDED-CONTEXTS-01` -> `${ARTIFACT_ROOT}/04-contexts/bounded-contexts.md`
  - `A4-CONTEXT-MAP-01` -> `${ARTIFACT_ROOT}/04-contexts/context-map.md`
  - `A4-INTEGRATION-01` -> `${ARTIFACT_ROOT}/04-contexts/integration-contracts.md`
  - `A4-DATA-OWNERSHIP-01` -> `${ARTIFACT_ROOT}/04-contexts/data-ownership.md`
- Owner agent (logical): `context-mapper`
- Quality gates (Definition of Done):
  - Boundaries are clear and non-overlapping.
  - Upstream/downstream relationships are documented.
  - Integration patterns are explicit.

### A5 - Domain Model
- Purpose: define tactical DDD model for selected bounded contexts.
- Required artifacts (ID -> path template):
  - `A5-DOMAIN-MODEL-01` -> `${ARTIFACT_ROOT}/05-domain-model/domain-model.md`
  - `A5-INVARIANTS-01` -> `${ARTIFACT_ROOT}/05-domain-model/invariants.md`
  - `A5-EVENTS-BY-CONTEXT-01` -> `${ARTIFACT_ROOT}/05-domain-model/events-by-context.md`
- Owner agent (logical): `domain-modeler`
- Quality gates (Definition of Done):
  - Aggregates, entities, and value objects are consistent.
  - Invariants and transaction boundaries are explicit.
  - Model aligns with A2 and A4.

### A6 - Specification & ADRs
- Purpose: produce implementation-planning specifications and architecture decisions (without coding/scaffolding).
- Required artifacts (ID -> path template):
  - `A6-PRD-01` -> `${ARTIFACT_ROOT}/06-spec/prd.md`
  - `A6-INTERFACES-01` -> `${ARTIFACT_ROOT}/06-spec/interfaces.md`
  - `A6-NFRS-01` -> `${ARTIFACT_ROOT}/06-spec/nfrs.md`
  - `A6-ADR-DIR-01` -> `${ARTIFACT_ROOT}/06-spec/adrs/`
  - `A6-TRACEABILITY-01` -> `${ARTIFACT_ROOT}/06-spec/traceability.md`
- Owner agent (logical): `requirements-engineer`
- Quality gates (Definition of Done):
  - Functional and non-functional requirements are testable.
  - Acceptance criteria are explicit.
  - ADRs include context, decision, alternatives, and consequences.

### A7 - Review (Challenger)
- Purpose: verify cross-stage coherence, quality, and readiness.
- Required artifacts (ID -> path template):
  - `A7-REVIEW-01` -> `${ARTIFACT_ROOT}/07-review/review.md`
  - `A7-READINESS-01` -> `${ARTIFACT_ROOT}/07-review/readiness.md`
- Owner agent (logical): `review-agent`
- Quality gates (Definition of Done):
  - All prior stage gates are satisfied.
  - Critical findings are resolved or explicitly accepted.
  - Stop-the-line decision is recorded for blockers.

### Stage Definitions End
- Stage deliverable definitions above are the only required stage artifacts for A0-A7.

## 3.1) Out Of Scope Execution (Hard Stop)

1. Do not generate or modify product source code.
2. Do not scaffold technical architectures, frameworks, or project templates.
3. Do not create automated tests, CI/CD pipelines, or infrastructure manifests.
4. If the user asks for implementation, stop and redirect to a separate implementation workflow.

## 4) Memory Strategy (Mandatory)

1. `ddd-config.yml` must be read before stage execution.
2. Behavior is driven by `memory.backend`:
   - `backend=artifacts`:
      - Persist state/memory in `artifacts/_state/*`.
      - Persist unresolved material questions in `artifacts/_state/open-questions.md`.
      - Use configured state files.
   - `backend=engram`:
      - Engram memory operations are mandatory during stage execution and close-out.
      - Use the full Engram MCP memory toolset (14 tools) when required by stage execution.
      - Do not persist session state into `artifacts/_state/*` unless fallback to artifacts is active.
      - Resolve blocking ambiguities through OpenCode `question` and persist results with `mem_save`.
      - Do not implement custom memory APIs.
3. If Engram is unavailable, apply `memory.fallback.if_engram_unavailable` from config.
4. Single-session protocol (backend=engram):
   - Orchestrator starts one shared session with `mem_session_start` once per workflow run.
   - Orchestrator passes the same `session_id` to all sub-agents and all stages A0-A7.
   - Sub-agents must not open per-stage sessions.
   - Orchestrator closes the shared session at workflow end using `mem_session_summary` and `mem_session_end`.
5. Question-resolution protocol:
   - Do not persist unresolved blocking questions to artifact files when backend=engram.
   - Orchestrator must resolve material ambiguities through OpenCode `question` before stage transition.
   - Persist resulting decisions in Engram via `mem_save`.

## 5) Skill Registry Protocol

1. Every new skill must be registered in the active skill catalog for the selected scope.
2. Project-scope default catalog: `skills/_registry/skills.catalog.json`.
3. If using global scope, registry must follow the global OpenCode skill location/conventions.
4. Any registry change that affects ownership, stage mapping, or governance must be reflected in this file.
5. Stage and sub-agent execution is invalid unless the mapped registered skill is explicitly invoked.

## 6) Token Discipline

1. Enforce artifact-only-output when configured.
2. Keep explanations minimal and operational.
3. Prefer concise structured deliverables over narrative text.

## 7) Parallel Execution Policy

1. Parallel execution is enabled only when `workflow.parallel_agents=true` in `ddd-config.yml`.
2. Orchestrator must honor `workflow.max_parallel_tasks` as hard concurrency limit.
3. Parallelization is allowed only for stage-approved agent sets defined by orchestrator policy.
4. Stage barrier is mandatory: no next stage starts until merge + gates pass.
5. Any failed gate in a parallel branch fails the entire stage (stop-the-line).

## 8) Artifact Language Policy

1. All artifacts are English by default.
2. Exception: explicit user request or project language policy in `ddd-config.yml`.

## 9) Response Language Policy

1. Agent responses must match user language.

## 10) Tooling Integration Policy (Mandatory)

1. Mandatory workflow tools:
   - `todowrite`: required to create/update the execution task list for multi-step work.
   - `question`: required to collect user decisions when material ambiguity blocks safe progression.
   - `context7` lookup (`resolve-library-id` + `query-docs`): required before raising tool-behavior questions that can be resolved from OpenCode documentation.
2. These tools are mandatory across orchestrator and sub-agents when their trigger conditions apply.
3. Other OpenCode tools are allowed when justified by task needs.
4. Prefer high-efficiency tools that operate on multiple files in one operation when broad read/write updates are needed.
5. Tool use must follow least-privilege and orchestration boundary rules.
