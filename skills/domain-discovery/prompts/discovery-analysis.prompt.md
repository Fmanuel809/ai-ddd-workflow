# Discovery Analysis Prompt

## Intent
Extract ubiquitous language, domain rules, actors, and material ambiguities for stage A1-discovery.

## Required Inputs
- `artifacts/00-intake/intake.md`
- raw requirement statement
- unresolved questions from configured memory backend (if exists)

## Output Artifacts
- `A1.1` -> `artifacts/01-discovery/ubiquitous-language.md`
- `A1.2` -> `artifacts/01-discovery/domain-rules.md`
- `A1.3` -> `artifacts/01-discovery/actors-and-responsibilities.md`

## Questions Policy
Ask only for material ambiguities that change scope, business behavior, ownership, or acceptance criteria.
Group and prioritize questions, then collect decisions using the OpenCode `question` tool.
If ambiguity remains non-blocking, persist it in the configured memory backend rather than artifact question files.

## Token Discipline
Respond with artifact content only. No narrative outside artifact sections.
