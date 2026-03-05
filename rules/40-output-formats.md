# Output Formats

## Purpose
Define mandatory formatting conventions for DDD artifacts.

## Format Rules

1. Use structured Markdown.
2. Include mandatory sections defined by stage templates.
3. Prefer tables over narrative text for comparisons, mappings, and decisions.
4. Event names must be in past tense.
5. Command names must be in imperative mood.

## Minimum Structure

Each artifact should include, when applicable:

- Title
- Purpose
- Scope
- Assumptions
- Decisions
- Open Questions
- Traceability (links to related artifacts)

## Naming Conventions

- Events: `OrderPlaced`, `PaymentAuthorized`, `ShipmentDispatched`.
- Commands: `PlaceOrder`, `AuthorizePayment`, `DispatchShipment`.
- Policies/invariants: concise business-language statements.
