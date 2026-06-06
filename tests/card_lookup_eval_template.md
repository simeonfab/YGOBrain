# Card Lookup Eval Template

Status: DRAFTED
Version: v0.1
Category: tests
Scope: Template for evaluating exact and fuzzy card lookup behaviour
Owner: Admin
Last Updated: 2026-06-06
Applies To: Card lookup, fuzzy lookup, card text accuracy, source discipline
Task Modes: deckbuilding, analytics, ruling, system-building
Keywords: card lookup eval, fuzzy lookup, card text accuracy, source discipline, local card database
Depends On:
- governance/009_card_knowledge_architecture.md
- governance/010_card_database_schema.md
- runtime/070_card_lookup_context.md
- tests/eval_test_template.md
Source Tier: Project test framework
Verification Status: NEEDS_ADMIN_REVIEW
Retrieval Priority: HIGH
Related Modules:
- tests/001_card_eval_plan.md
- tests/card_recommendation_eval_template.md
- tests/card_discovery_eval_template.md

## 1. Purpose

This template defines evals for card lookup behaviour.

Card lookup evals measure whether YGOBrain can retrieve accurate card facts from the local card database and avoid relying on model memory or markdown files as card fact authority.

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

The user-facing card lookup question being tested.

### Expected Retrieval

Specify the expected database or retrieval behaviour.

Examples:

```text
- exact card lookup by official name
- fuzzy lookup by typo
- ambiguity handling for multiple possible cards
- retrieve current card text from local card database
- retrieve legality or banlist status from approved source/cache
```

### Expected Files

List supporting YGOBrain files that should inform the workflow.

Common files:

```text
runtime/070_card_lookup_context.md
governance/009_card_knowledge_architecture.md
governance/010_card_database_schema.md
sources/000_source_index.md
sources/001_approved_source_families.md
```

### Expected Answer Points

List what a correct answer must include.

### Forbidden Errors

Examples:

```text
- answers exact card text from model memory
- treats YGOBrain markdown as card fact authority
- fails to resolve ambiguous card names
- invents card metadata
- treats stale cache as current without warning
- uses card lookup as a ruling answer when interpretation is required
```

### Source Discipline Checks

Check whether the answer:

```text
- uses local card database or approved database/API source for card facts
- identifies uncertainty when lookup fails
- separates card facts from strategic reasoning
- separates card facts from rulings
- does not treat AI inference as card fact authority
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

Card lookup evals should cover:

```text
Card text accuracy
Exact card lookup
Fuzzy card lookup
Ambiguous card name handling
Legality / banlist status lookup
Cache freshness handling
Source hierarchy compliance
Draft vs verified handling where repo files are used
```

## 5. Change Log

```text
2026-06-06
Status: DRAFTED
Change: Created card lookup eval template.
Reason: Admin requested card knowledge evaluation framework.
```
