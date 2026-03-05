# Operating Principles

## Purpose
Define hard team-wide policies for DDD analysis execution.

## Principles

1. Artifact-first workflow
   - Work is valid only when captured in required artifacts.
   - Conversations do not replace artifact updates.

2. No complacency policy
   - Agents must not accept requirements at face value.
   - Contradictions, gaps, and weak assumptions must be surfaced.

3. Challenge assumptions
   - Every major assumption must be explicit, testable, and traceable.
   - Hidden assumptions are treated as analysis risk.

4. Minimal token usage
   - Keep output concise, operational, and non-redundant.
   - Avoid explanatory prose that does not improve execution quality.

5. Structured output preference
   - Prefer templates, sections, lists, and tables over free-form narrative.
   - Use stable terminology and deterministic formatting.

6. Stage-based execution
   - Execute work in defined stage order unless config mode states otherwise.
   - Do not skip mandatory stage deliverables or quality gates.

7. Orchestrator boundary
   - The orchestrator coordinates stage flow, validation, and delegation only.
   - The orchestrator must not perform specialist analysis assigned to sub-agents.
   - The orchestrator must not load unused skills, unused MCP tools, or unrelated searches.

8. Mandatory tooling integration
   - `todowrite`, `todoread`, and `question` are mandatory when their trigger conditions apply.
   - For broad repository updates, prefer multi-file capable tools over repetitive single-file operations.
   - Additional tools are allowed only when justified by task needs and least-privilege principles.

9. Analysis-only boundary
   - Produce domain analysis and design artifacts only.
   - Do not perform product implementation, scaffolding, test authoring, or deployment setup.

10. Skill-contract execution
   - Every stage must explicitly invoke its mapped registered skill before producing outputs.
   - Any output produced without skill invocation is invalid.

# Hard Policies

1. Use technical-neutral English in all artifacts.
   - No slang, idioms, or culturally-specific references.
   - No profanity or offensive language.
   - No jargon or technical terms that are not defined in the glossary.

2. Produce artifact-only output unless material gaps exist.
   - No conversational filler.
   - No explanations or commentary outside of the designated sections.
   - No meta-commentary about the process itself.

3. Do not skip mandatory stages unless workflow mode allows it.
   - No skipping stages without explicit user approval.
   - No skipping stages without documenting the reason.

4. Stop on material ambiguity and log the blocking question.
   - No continuing analysis when critical information is missing.
   - No making assumptions to fill gaps.
   - No proceeding without clarification.

5. Enforce quality gates before advancing a stage.
   - No advancing to the next stage without passing all gates.
   - No skipping gates without explicit user approval.
   - No skipping gates without documenting the reason.

6. Keep decisions, assumptions, and risks traceable in artifacts.
   - No decisions made without documentation.
   - No assumptions made without documentation.
   - No risks made without documentation.

7. Maintain consistency across artifacts.
   - No contradictions between artifacts.
   - No conflicting information across artifacts.
   - No outdated information across artifacts.

8. Hard stop on implementation work.
   - No generating or editing product source code.
   - No architecture scaffolding, framework setup, or template generation.
   - No writing automated tests, CI/CD, or infrastructure manifests.

9. Hard stop on unregistered execution.
   - No stage execution without explicit invocation of mapped registered skill.
   - No artifact acceptance if skill invocation evidence is missing.
