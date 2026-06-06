# Card Recommendation Eval Template

Status: DRAFTED
Version: v0.1
Category: tests
Scope: Template for evaluating card recommendation behaviour
Owner: Admin
Last Updated: 2026-06-06
Applies To: Card recommendation, deckbuilding advice, strategic reasoning, source discipline
Task Modes: deckbuilding, analytics
Keywords: card recommendation eval, deckbuilding recommendation, strategic reasoning, card facts, source discipline
Depends On:
- governance/009_card_knowledge_architecture.md
- governance/010_card_database_schema.md
- runtime/080_card_recommendation_context.md
- competitive/020_card_tagging_framework.md
- tests/eval_test_template.md
Source Tier: Project test framework
Verification Status: NEEDS_ADMIN_REVIEW
Retrieval Priority: HIGH
Related Modules:
- tests/001_card_eval_plan.md
- tests/card_lookup_eval_template.md
- tests/card_discovery_eval_template.md

## 1. Purpose

This template defines evals for card recommendation behaviour.

Card recommendation evals measure whether YGOBrain can use retrieved card facts plus strategic modules to recommend cards without inventing card text, overclaiming, or ignoring source hierarchy.

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

The user-facing recommendation question being tested.

### Expected Retrieval

Specify expected retrieval behaviour.

Examples:

```text
- retrieve exact card facts from local card database
- retrieve relevant strategic modules
- retrieve card tag framework
- retrieve deck-specific overlay if available
- retrieve analytics module if recommendation depends on statistics
```

### Expected Files

Common files:

```text
runtime/080_card_recommendation_context.md
runtime/070_card_lookup_context.md
competitive/020_card_tagging_framework.md
competitive/011_card_roles.md
competitive/010_deckbuilding_principles.md
governance/009_card_knowledge_architecture.md
governance/010_card_database_schema.md
```

### Expected Answer Points

List what a correct answer must include.

Examples:

```text
- separates card facts from recommendation
- identifies card role and function
- explains trade-off or opportunity cost
- labels confidence
- suggests a test when uncertain
- identifies if ruling workflow is needed
```

### Forbidden Errors

Examples:

```text
- recommends card from memory without card lookup
- invents card text or function
- ignores opportunity cost
- treats DRAFTED module as verified
- treats theory as proven
- gives ruling-dependent recommendation without ruling check
- fails to label uncertainty
```

### Source Discipline Checks

Check whether the answer:

```text
- uses local card facts as input
- uses YGOBrain modules for strategic reasoning
- labels DRAFTED modules as unverified where relevant
- respects official rulings if interaction matters
- separates recommendation from card fact retrieval
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

Card recommendation evals should cover:

```text
Deckbuilding recommendations
Card role classification
Opportunity cost analysis
Testing recommendation quality
Ruling boundary handling
Source hierarchy compliance
Draft vs verified handling
```

## 5. Change Log

```text
2026-06-06
Status: DRAFTED
Change: Created card recommendation eval template.
Reason: Admin requested card knowledge evaluation framework.
```
