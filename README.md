# AI DDD Workflow

AI agent-driven workflow for Domain-Driven Design (DDD) requirement analysis in OpenCode-compatible environments.

## Purpose

This repository defines a multi-agent system that executes DDD analysis through strict stages, registered skills, hard rules, and configurable memory backends.

## Core Principles

- Skill-only execution: no ad-hoc analysis outside registered skills.
- Orchestrator boundary: `ddd-workflow-orchestrator` coordinates only; specialist work is delegated.
- Stage gates: progression stops when quality gates fail.
- Artifact-first outputs: work is valid only when persisted in stage artifacts.
- Token discipline: minimal operational output.

## Workflow Stages

- `A1-discovery`
- `A2-event-storming`
- `A3-subdomains`
- `A4-bounded-contexts`
- `A5-domain-model`
- `A6-specification`

Stage definitions, required artifacts, and governance are defined in `AGENTS.md`.

## Repository Structure

```text
ai-ddd-workflow/
  AGENTS.md
  ddd-config.yml
  rules/
  skills/
    _registry/
      skills.schema.json
      skills.catalog.json
      skills.index.md
  agents/
    ddd-workflow-orchestrator.md
    sub-agents/
      domain-analyst.md
      event-storming-facilitator.md
      context-mapper.md
      domain-modeler.md
      requirements-engineer.md
      risk-auditor.md
      challenger.md
  artifacts/
    00-intake/
    01-discovery/
    02-event-storming/
    03-subdomains/
    04-contexts/
    05-domain-model/
    06-spec/adrs/
    07-review/
    _state/
  scripts/
    init.sh
    init.ps1
```

## Installation Scripts

Use scripts from `scripts/`.

### Initialize project structure

- Bash (from project root): `bash /path/to/ai-ddd-workflow/scripts/init.sh`
- PowerShell (from project root): `/path/to/ai-ddd-workflow/scripts/init.ps1`

`init` copies:

- `artifacts/*`
- `AGENTS.md`
- `ddd-config.yml`

`init` behavior:

- Resolves source files from global workflow package path (`$OPENCODE_CONFIG_DIR/ai-ddd-workflow` or default config location).
- If project scope already has `.opencode/agents/ddd-workflow-orchestrator.md`, init exits without changes.

## OpenCode Command

Use the custom command:

- `/ddd-init [optional idea context]`

Behavior:

- Runs OS-specific init script from global workflow package.
- Initializes `AGENTS.md`, `ddd-config.yml`, and `artifacts/*` in current project.
- If idea context is provided, updates `AGENTS.md` `Project Context` section through brainstorming flow.

## Agent System

### Orchestrator

- `agents/ddd-workflow-orchestrator.md`
  - Reads config, rules, skill registry, and existing artifacts.
  - Resolves stage skills from `skills/_registry/skills.index.md`.
  - Validates catalog integrity and gate compliance.
  - Delegates all specialist execution to sub-agents.

### Sub-agents

- `domain-analyst` -> `domain-discovery`, `subdomain-analysis`
- `event-storming-facilitator` -> `event-storming`
- `context-mapper` -> `bounded-context-mapping`
- `domain-modeler` -> `domain-modeling`
- `requirements-engineer` -> `requirements-specification`
- `risk-auditor` -> cross-stage technical and traceability review
- `challenger` -> stop-the-line authority for critical blockers

## Skills Registry

The registry lives in `skills/_registry/`:

- `skills.schema.json`: canonical schema (Draft 2020-12).
- `skills.catalog.json`: active skill contracts.
- `skills.index.md`: stage-to-skill readable index.

All new skills must be:

1. Added to `skills.catalog.json`.
2. Listed in `skills.index.md`.
3. Referenced in `AGENTS.md` when governance/ownership is affected.

## Memory Strategy

Memory is controlled by `ddd-config.yml`.

- `memory.backend=artifacts`
  - Persist in:
    - `artifacts/_state/session-log.md`
    - `artifacts/_state/decisions.md`
    - `artifacts/_state/open-questions.md`

- `memory.backend=engram`
  - Use the full Engram MCP memory toolset (14 tools) when needed.
  - Engram repository: [Gentleman-Programming/engram](https://github.com/Gentleman-Programming/engram)
  - Do not implement custom memory APIs.
  - Follow configured fallback if Engram is unavailable.

## Mandatory Tooling Policy

Mandatory when trigger conditions apply:

- `todowrite`
- `todoread`
- `question`

Other OpenCode tools are allowed as needed.
Prefer high-efficiency tools that can process multiple files in one operation for broad updates.

## Parallel Execution

Parallel stage execution is enabled only when configured:

- `workflow.parallel_agents=true`
- bounded by `workflow.max_parallel_tasks`

Rules:

- Stage barrier is mandatory.
- Any failed gate in a parallel branch fails the full stage.

## Language Policy

- Artifacts are English by default.
- Agent responses must match the user language.
