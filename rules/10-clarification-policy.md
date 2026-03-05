# Clarification Policy

## Purpose
Define when and how the team must ask questions before continuing analysis.

## Mandatory Clarification Triggers

Ask clarification questions when one or more of the following conditions exist:

1. Material ambiguity
   - Ambiguity can alter architecture, boundaries, scope, risk, cost, or acceptance criteria.

2. Incomplete business rules
   - Decision logic, constraints, eligibility, or exception paths are missing.

3. Undefined process states
   - Lifecycle states, transitions, or terminal conditions are unknown.

4. Unknown data ownership
   - Source of truth, write authority, or stewardship is not defined.

5. Unspecified external integrations
   - External systems, events, APIs, SLAs, or failure contracts are not described.

## Question Handling Rules

1. Group questions
   - Consolidate related questions into coherent batches by topic.

2. Prioritize questions
   - Mark each question as Critical, High, or Medium based on pipeline impact.

3. Avoid per-step interruptions
   - Do not interrupt every analysis micro-step.
   - Ask at decision checkpoints or when a gate cannot be passed safely.

4. Traceability
   - Record open questions in the configured state store.
