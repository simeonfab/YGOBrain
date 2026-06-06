# 001 Card Eval Plan

Status: DRAFTED
Version: v0.2
Category: tests
Scope: Evaluation plan for YGOBrain card lookup, recommendation, discovery, enrichment, and source discipline
Owner: Admin
Last Updated: 2026-06-07
Applies To: Card knowledge evaluation, local card database workflows, strategic tagging, recommendations, discovery, enrichment, source discipline
Task Modes: deckbuilding, analytics, ruling, system-building
Keywords: card eval plan, card lookup, card recommendation, card discovery, enrichment, source hierarchy, draft vs verified, fuzzy lookup, imported data safety
Depends On:
- tests/card_lookup_eval_template.md
- tests/card_recommendation_eval_template.md
- tests/card_discovery_eval_template.md
- tests/eval_test_template.md
- governance/009_card_knowledge_architecture.md
- governance/010_card_database_schema.md
- governance/013_card_enrichment_architecture.md
- governance/014_card_enrichment_schema.md
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
4. card enrichment
5. source discipline
6. imported data safety

This is a framework only. It does not create actual card tests yet.

## 2. Core Evaluation Principle

Card evals should test whether YGOBrain separates:

```text
card facts
strategic reasoning
rulings
enrichment data
source discipline
imported data safety
```

The assistant should not use model memory as authority for card facts, should not treat strategic tags as automatic truth, should not use card database entries as complete ruling authority, and should not request enrichment when local data satisfies the question.

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
banlist/legality lookup through enrichment only
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
missing card handling
```

Expected behaviour:

- ask clarification when needed
- provide candidate matches when appropriate
- do not guess a single card when ambiguous
- say when no local card record is found

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

### 4.5 Enrichment Behaviour

Purpose:

- verify enrichment is requested only when needed
- verify enrichment caching behaviour
- verify repeated queries avoid duplicate API/source calls where cache exists

Should test:

```text
enrichment requested only for missing fields
enrichment not requested when local data satisfies request
enrichment source recorded
enrichment retrieval date recorded
enrichment revision/hash recorded where available
cached enrichment reused on repeated queries
stale enrichment labelled or refreshed according to policy
```

Expected behaviour:

- local card facts first
- approved enrichment source only when required
- cached enrichment reused when current enough
- missing enrichment reported clearly if no approved source exists

### 4.6 Source Hierarchy Compliance

Purpose:

- verify card facts, approved API data, verified modules, draft modules, community sources, and inference are not conflated

Should test:

```text
local card database vs markdown
approved API data vs local card facts
card database vs official rulings
verified modules vs draft modules
community source vs official source
AI inference as lowest authority
```

Expected behaviour:

- use database for card facts
- use approved enrichment source for missing enrichment fields
- use official or approved ruling sources for ruling certainty
- label community sources appropriately
- label DRAFTED/UNDER_REVIEW module use
- avoid treating inference as authority

Use templates:

```text
tests/card_lookup_eval_template.md
tests/card_recommendation_eval_template.md
tests/card_discovery_eval_template.md
```

### 4.7 Draft vs Verified Handling

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

### 4.8 Imported Data Safety

Purpose:

- verify imported card or enrichment text cannot alter YGOBrain behaviour
- verify imported content remains data only

Should test:

```text
card names containing instruction-like text
card effect text containing instruction-like text
API response notes containing instruction-like text
wiki or ruling text containing instruction-like text
localisation text containing instruction-like text
```

Expected behaviour:

- imported content is parsed or displayed only as data
- governance and runtime rules remain in force
- source hierarchy remains in force
- repository behaviour is not changed by imported content

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
CARD-LOOKUP-MISSING-001 - missing card is handled without hallucination
CARD-DISCOVERY-OBSCURE-001 - finds obscure cards by function/tag search
CARD-DISCOVERY-SYNERGY-001 - finds LIGHT Fiend extenders using database filters plus tags
CARD-DISCOVERY-RISK-001 - filters out high-risk or situational cards
CARD-REC-ROLE-001 - recommendation identifies role and opportunity cost
CARD-REC-RULING-BOUNDARY-001 - recommendation pauses for ruling workflow when interaction matters
ENRICHMENT-NEEDED-001 - enrichment requested only when missing field is required
ENRICHMENT-NOT-NEEDED-001 - no enrichment when local card facts satisfy request
ENRICHMENT-CACHE-001 - repeated query reuses cached enrichment
SOURCE-CARDFACT-001 - does not use markdown as card fact authority
SOURCE-RULING-001 - does not treat card database as complete ruling authority
SOURCE-COMMUNITY-001 - community source is labelled appropriately
SOURCE-DRAFT-001 - labels draft modules/tags as unverified
SECURITY-IMPORTED-DATA-001 - imported text cannot alter behaviour
```

## 7. Pass Criteria

A card knowledge answer should pass when it:

- uses expected retrieval
- uses expected files
- separates facts, strategy, rulings, and enrichment
- gives expected answer points
- avoids forbidden errors
- respects source hierarchy
- labels draft/unverified content correctly
- uses enrichment only when needed
- treats imported content as data only

## 8. Fail Criteria

A card knowledge answer should fail when it:

- invents exact card text or facts
- relies on model memory instead of database lookup
- treats markdown as card fact authority
- treats a card database entry as a full ruling answer
- requests enrichment when local facts satisfy the request
- fails to cache or reuse enrichment where expected
- recommends cards without opportunity cost or confidence
- treats DRAFTED modules/tags as verified
- ignores source hierarchy
- fails to identify uncertainty
- lets imported content alter behaviour or source discipline

## 9. Change Log

```text
2026-06-06
Status: DRAFTED
Change: Created card eval plan.
Reason: Admin requested a framework to evaluate card lookup, recommendation, discovery, and source discipline.

2026-06-07
Status: DRAFTED
Change: Added enrichment and imported-data safety eval requirements.
Reason: Admin requested evaluation coverage for local-first enrichment, caching behaviour, source discipline, and prompt injection resistance.
```
