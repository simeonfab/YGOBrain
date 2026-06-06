# 001 Card Eval Plan

Status: DRAFTED
Version: v0.1
Category: tests
Scope: Evaluation plan for YGOBrain card lookup, recommendation, discovery, and source discipline
Owner: Admin
Last Updated: 2026-06-06
Applies To: Card knowledge evaluation, local card database workflows, strategic tagging, recommendations, discovery, source discipline
Task Modes: deckbuilding, analytics, ruling, system-building
Keywords: card eval plan, card lookup, card recommendation, card discovery, source hierarchy, draft vs verified, fuzzy lookup
Depends On:
- tests/card_lookup_eval_template.md
- tests/card_recommendation_eval_template.md
- tests/card_discovery_eval_template.md
- tests/eval_test_template.md
- governance/009_card_knowledge_architecture.md
- governance/010_card_database_schema.md
- competitive/020_card_tagging_framework.md
Source Tier: Project test framework
Verification Status: NEEDS_ADMIN_REVIEW
Retrieval Priority: HIGH
Related Modules:
- runtime/070_card_lookup_context.md
- runtime/080_card_recommendation_context.md
- runtime/090_retrieval_manifest.md

## 1. Purpose

This file defines the evaluation plan for YGOBrain card knowledge.

The goal is to measure whether YGOBrain is actually good at:

1. card lookup
2. card recommendation
3. card discovery
4. source discipline

This is a framework only. It does not create actual card tests yet.

## 2. Core Evaluation Principle

Card evals should test whether YGOBrain separates:

```text
card facts
strategic reasoning
rulings
source discipline
```

The assistant should not use model memory as authority for card facts, should not treat strategic tags as automatic truth, and should not use card database entries as complete ruling authority.

## 3. Required Eval Fields

Each card eval should include:

```text
Question:
Expected retrieval:
Expected files:
Expected answer points:
Forbidden errors:
Pass/fail:
```

Recommended expanded fields:

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

## 4. Test Categories

### 4.1 Card Text Accuracy

Purpose:

- verify exact card facts come from the local card database or approved source/API
- prevent model-memory card text hallucination
- ensure stale or unavailable cache is labelled

Should test:

```text
exact card lookup
current card text retrieval
card type and metadata retrieval
banlist/legality lookup
cache freshness handling
```

Use template:

```text
tests/card_lookup_eval_template.md
```

### 4.2 Fuzzy Card Lookup

Purpose:

- verify typo, partial name, punctuation, and ambiguous lookup handling

Should test:

```text
partial card names
misspelled names
multiple possible matches
alias-like searches
ambiguous names
```

Expected behaviour:

- ask clarification when needed
- provide candidate matches when appropriate
- do not guess a single card when ambiguous

Use template:

```text
tests/card_lookup_eval_template.md
```

### 4.3 Obscure Card Discovery

Purpose:

- verify YGOBrain can discover cards by filters, functions, and tags rather than memory

Should test:

```text
function-based search
role-tag search
synergy-tag search
risk-tag filtering
obscure candidate discovery
```

Examples of future test prompts:

```text
Find LIGHT Fiend extenders.
Find discard outlets that convert bricks into value.
Find cards that bridge two engines.
Find searchable starters in this context.
```

Use template:

```text
tests/card_discovery_eval_template.md
```

### 4.4 Deckbuilding Recommendations

Purpose:

- verify recommendations use card facts plus YGOBrain strategic modules
- prevent unsupported card recommendations
- ensure opportunity cost and confidence are included

Should test:

```text
card role classification
recommendation reasoning
opportunity cost
testing suggestions
uncertainty labelling
ruling boundary handling
```

Use template:

```text
tests/card_recommendation_eval_template.md
```

### 4.5 Source Hierarchy Compliance

Purpose:

- verify card facts, rulings, verified modules, draft modules, and inference are not conflated

Should test:

```text
local card database vs markdown
card database vs official rulings
verified modules vs draft modules
approved source vs unapproved source
AI inference as lowest authority
```

Expected behaviour:

- use database for card facts
- use official rulings for ruling certainty
- label DRAFTED/UNDER_REVIEW module use
- avoid treating inference as authority

Use templates:

```text
tests/card_lookup_eval_template.md
tests/card_recommendation_eval_template.md
tests/card_discovery_eval_template.md
```

### 4.6 Draft vs Verified Handling

Purpose:

- verify DRAFTED modules or tags are not treated as final authority

Should test:

```text
DRAFTED module used as support
unverified strategic tag used as candidate only
verified module conflict with draft module
tag confidence handling
Admin verification requirement
```

Expected behaviour:

- prioritize VERIFIED/VERIFIED_BY_ADMIN modules
- label DRAFTED/UNDER_REVIEW content as unverified
- do not promote confidence without review

## 5. Eval Template Map

```text
Card lookup evals:
- tests/card_lookup_eval_template.md

Card recommendation evals:
- tests/card_recommendation_eval_template.md

Card discovery evals:
- tests/card_discovery_eval_template.md

General evals:
- tests/eval_test_template.md
```

## 6. Initial Future Eval Backlog

Do not create the tests yet. These are placeholders for future implementation.

```text
CARD-LOOKUP-TEXT-001 - exact card text retrieved from local card database
CARD-LOOKUP-FUZZY-001 - fuzzy lookup resolves typo with candidate list
CARD-LOOKUP-AMBIGUOUS-001 - ambiguous lookup asks clarification or lists candidates
CARD-DISCOVERY-OBSCURE-001 - finds obscure cards by function/tag search
CARD-DISCOVERY-SYNERGY-001 - finds LIGHT Fiend extenders using database filters plus tags
CARD-DISCOVERY-RISK-001 - filters out high-risk or situational cards
CARD-REC-ROLE-001 - recommendation identifies role and opportunity cost
CARD-REC-RULING-BOUNDARY-001 - recommendation pauses for ruling workflow when interaction matters
SOURCE-CARDFACT-001 - does not use markdown as card fact authority
SOURCE-RULING-001 - does not treat card database as complete ruling authority
SOURCE-DRAFT-001 - labels draft modules/tags as unverified
```

## 7. Pass Criteria

A card knowledge answer should pass when it:

- uses expected retrieval
- uses expected files
- separates facts, strategy, and rulings
- gives expected answer points
- avoids forbidden errors
- respects source hierarchy
- labels draft/unverified content correctly

## 8. Fail Criteria

A card knowledge answer should fail when it:

- invents exact card text or facts
- relies on model memory instead of database lookup
- treats markdown as card fact authority
- treats a card database entry as a full ruling answer
- recommends cards without opportunity cost or confidence
- treats DRAFTED modules/tags as verified
- ignores source hierarchy
- fails to identify uncertainty

## 9. Change Log

```text
2026-06-06
Status: DRAFTED
Change: Created card eval plan.
Reason: Admin requested a framework to evaluate card lookup, recommendation, discovery, and source discipline.
```
