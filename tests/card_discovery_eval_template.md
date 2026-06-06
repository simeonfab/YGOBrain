# Card Discovery Eval Template

Status: DRAFTED
Version: v0.1
Category: tests
Scope: Template for evaluating card discovery behaviour
Owner: Admin
Last Updated: 2026-06-06
Applies To: Card discovery, function-based search, tag-based search, obscure card discovery, analytics support
Task Modes: deckbuilding, analytics
Keywords: card discovery eval, function search, tag search, obscure card discovery, strategic tags, local card database
Depends On:
- governance/009_card_knowledge_architecture.md
- governance/010_card_database_schema.md
- competitive/020_card_tagging_framework.md
- templates/card_tag_template.md
- tests/eval_test_template.md
Source Tier: Project test framework
Verification Status: NEEDS_ADMIN_REVIEW
Retrieval Priority: HIGH
Related Modules:
- tests/001_card_eval_plan.md
- tests/card_lookup_eval_template.md
- tests/card_recommendation_eval_template.md

## 1. Purpose

This template defines evals for card discovery behaviour.

Card discovery evals measure whether YGOBrain can find cards by function, role, synergy, and risk tags rather than only by exact card name.

## 2. Eval Format

```text
Test ID:
Question:
Task Mode:
Expected Retrieval:
Expected Files:
Expected Answer Points:
Forbidden Errors:
Source Discipline Checks:
Pass / Fail:
Reviewer:
Notes:
```

## 3. Required Fields

### Question

The user-facing discovery request being tested.

Examples:

```text
Find LIGHT Fiend extenders.
Find discard outlets that convert bricks into value.
Find searchable starters for this engine.
Find board breakers that do not conflict with my engine.
Find engine bridges between two packages.
```

### Expected Retrieval

Specify expected retrieval behaviour.

Examples:

```text
- query local card database for factual filters
- query strategic tag layer for role/function/synergy/risk tags
- retrieve card tagging framework
- retrieve card recommendation context if ranking or recommendations are requested
- retrieve deck-specific overlay if discovery is deck-specific
```

### Expected Files

Common files:

```text
runtime/070_card_lookup_context.md
runtime/080_card_recommendation_context.md
competitive/020_card_tagging_framework.md
templates/card_tag_template.md
governance/010_card_database_schema.md
governance/009_card_knowledge_architecture.md
```

### Expected Answer Points

List what a correct answer must include.

Examples:

```text
- separates database filters from strategic tags
- states whether results are exact, fuzzy, candidate, or verified
- identifies confidence/verification status of tags
- avoids over-ranking unsupported candidates
- explains why each candidate matches the requested function
```

### Forbidden Errors

Examples:

```text
- discovers cards from model memory only
- treats text matches as verified strategic tags
- ignores confidence or Admin verification status
- treats DRAFTED strategic modules as final authority
- fails to distinguish LIGHT/Fiend database facts from extender strategic tags
- presents candidate cards as proven best choices
```

### Source Discipline Checks

Check whether the answer:

```text
- uses database facts for factual filters
- uses YGOBrain strategic tags for function/role discovery
- labels unverified tag matches
- distinguishes discovery from recommendation
- switches to recommendation workflow if asked to rank or choose cards
```

### Pass / Fail

Use:

```text
PASS
FAIL
PARTIAL
NEEDS_REVIEW
```

## 4. Evaluation Categories

Card discovery evals should cover:

```text
Obscure card discovery
Function-based search
Role-tag search
Synergy-tag search
Risk-tag filtering
Fuzzy card lookup support
Deck-specific discovery
Source hierarchy compliance
Draft vs verified handling
```

## 5. Change Log

```text
2026-06-06
Status: DRAFTED
Change: Created card discovery eval template.
Reason: Admin requested card knowledge evaluation framework.
```
