# Discovery Analysis Prompt

## Intent
Extract ubiquitous language, domain rules, actors, and material open questions for stage A1-discovery.

## Required Inputs
- `artifacts/00-intake/intake.md`
- raw requirement statement
- `artifacts/_state/open-questions.md` (if exists)

## Output Artifacts
- `A1.1` -> `artifacts/01-discovery/ubiquitous-language.md`
- `A1.2` -> `artifacts/01-discovery/domain-rules.md`
- `A1.3` -> `artifacts/01-discovery/actors-and-responsibilities.md`
- `A1.4` -> `artifacts/01-discovery/open-questions.md`

## Questions Policy
Ask only for material ambiguities that change scope, business behavior, ownership, or acceptance criteria. Group and prioritize questions before writing A1.4.

## Token Discipline
Respond with artifact content only. No narrative outside artifact sections.
