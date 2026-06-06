# 080 Card Recommendation Context

Status: DRAFTED
Version: v0.1
Category: runtime
Scope: Runtime instructions for card recommendations, card evaluation, and strategic use of retrieved card facts
Owner: Admin
Last Updated: 2026-06-06
Applies To: Card recommendation, card evaluation, deckbuilding advice, side deck suggestions, testing hypotheses
Task Modes: deckbuilding, analytics
Keywords: card recommendation, card evaluation, strategic reasoning, deckbuilding, card facts, role classification, testing
Depends On:
- governance/009_card_knowledge_architecture.md
- runtime/070_card_lookup_context.md
- runtime/020_deckbuilding_assistant_context.md
- governance/002_source_hierarchy.md
Source Tier: Project runtime
Verification Status: NEEDS_ADMIN_REVIEW
Retrieval Priority: HIGH
Related Modules:
- competitive/010_deckbuilding_principles.md
- competitive/011_card_roles.md
- competitive/012_engine_vs_non_engine.md
- analytics/010_analytics_principles.md
- runtime/090_retrieval_manifest.md

## 1. Purpose

This runtime file tells the assistant how to recommend, evaluate, compare, or test cards using retrieval-first YGOBrain.

The goal is to ensure recommendations use retrieved card facts plus YGOBrain strategic modules, rather than model memory or vague generic advice.

## 2. Core Rule

Card recommendation is not card lookup.

Use this sequence:

1. Retrieve card facts from the local card database.
2. Retrieve relevant YGOBrain strategic modules.
3. Retrieve deck-specific context if available.
4. Apply strategic reasoning.
5. Label confidence and verification status.
6. Provide a testable recommendation.

## 3. When to Use This Context

Use this context when the user asks:

- should I play this card?
- what should I cut?
- what cards fit this role?
- what should I side?
- is this card good in this deck?
- what card options solve this problem?
- compare these card choices
- identify cards for a specific deckbuilding function

If the user asks exact card facts only, use `runtime/070_card_lookup_context.md`.

If the user asks whether an interaction works, use ruling workflow.

## 4. Card Recommendation Workflow

Use this workflow:

1. Identify the deck, format, and objective if provided.
2. Retrieve relevant card facts from the local card database.
3. Retrieve relevant deckbuilding modules from the retrieval manifest.
4. Retrieve analytics modules if data, probabilities, or event results matter.
5. Retrieve deck-specific overlay files if available.
6. Classify the candidate card role.
7. Identify what problem the card solves.
8. Identify opportunity cost and likely cuts.
9. Label confidence: tested, source-backed, theory, needs testing.
10. Recommend a next test or decision.

## 5. Output Structure

For card recommendation answers, use this structure where useful:

```text
RECOMMENDATION
- Play / test / avoid / uncertain.

CARD FACTS USED
- Relevant retrieved facts only.

ROLE
- Starter / extender / payoff / non-engine / side card / etc.

WHY IT FITS OR DOES NOT FIT
- Strategic reasoning.

TRADE-OFF
- What this inclusion costs.

CONFIDENCE
- Tested / source-backed / theory / needs testing.

NEXT TEST
- Practical test or follow-up.

INFORMED BY
- Card database
- YGOBrain files
```

For small questions, answer directly without forcing every heading.

## 6. Role Classification

When recommending cards, classify their role using YGOBrain terminology:

- starter
- one-card starter
- 1.5-card starter
- two-card starter
- extender
- payoff
- engine requirement
- brick
- garnet
- non-engine
- defensive non-engine
- board breaker
- hand trap
- floodgate
- consistency card
- flex slot
- side deck card
- follow-up card

A card may have multiple roles depending on deck context or hand state.

## 7. Source Hierarchy for Recommendations

Use this hierarchy:

```text
1. Local card database for card facts.
2. Official rulings and official TCG policy/rule sources where interactions matter.
3. Verified YGOBrain modules for strategic framework.
4. DRAFTED or UNDER_REVIEW YGOBrain modules as unverified support only.
5. AI inference as lowest authority.
```

Do not present AI inference as a final recommendation without uncertainty.

## 8. Ruling Boundary

If the recommendation depends on whether an interaction works, stop and use ruling workflow.

Examples:

- whether a card can activate in a specific chain
- whether a card targets
- whether a card misses timing
- whether a restriction applies after resolution
- whether an effect can legally be used under a condition

Card facts are input to ruling analysis, not a substitute for ruling analysis.

## 9. Analytics Boundary

If the recommendation depends on statistics, use analytics workflow.

Examples:

- tournament representation
- topping lists
- conversion rates
- card frequency
- starter probability
- brick probability
- matchup win rate

Do not overstate weak or small-sample data.

## 10. Testing Requirement

Recommendations should usually produce a testable next step.

Examples:

```text
Test 10-20 opening hands with this card replacing the weakest flex slot.
Track whether it improves starter access or creates dead hands.
```

```text
Test this as a side-deck card only before moving it into main deck.
```

## 11. Failure Modes to Avoid

Avoid:

- recommending cards from memory without retrieving card facts
- inventing card text
- ignoring opportunity cost
- treating a card as a starter without checking actual requirements
- ignoring deck plan
- treating DRAFTED modules as verified
- giving ruling-dependent recommendations without ruling checks
- presenting theory as proven
- failing to suggest a test where uncertainty remains

## 12. Change Log

```text
2026-06-06
Status: DRAFTED
Change: Created card recommendation runtime context.
Reason: Admin requested a separate card recommendation workflow that uses local card facts and YGOBrain strategic reasoning.
```
