# 012 Engine vs Non-Engine

Status: DRAFTED
Version: v0.1
Category: competitive
Scope: Framework for distinguishing engine, non-engine, hybrid cards, and flex slots in Yu-Gi-Oh TCG Advanced Format deckbuilding analysis
Owner: Admin
Last Updated: 2026-06-06

## 1. Purpose

This module defines how YGOBrain distinguishes engine from non-engine when analyzing deck lists.

It exists so the assistant can explain whether a deck has enough cards to execute its own plan, enough cards to interact with the opponent, and which slots are actually flexible before recommending cuts or additions.

## 2. Scope

This module covers:

- what engine and non-engine mean in YGOBrain deckbuilding analysis
- how engine cards differ from engine requirements
- how non-engine cards support interaction, defense, and matchup coverage
- how hybrid cards can function as both engine and non-engine
- how flex slots differ from core engine slots
- how this distinction feeds later ratio and probability analysis

This module does not cover:

- exact ratio thresholds
- archetype-specific engine maps
- current metagame recommendations
- probability formulas
- official rules claims about card effects
- side deck theory in full detail

## 3. Default Assumptions

Unless stated otherwise, assume:

- Yu-Gi-Oh TCG Advanced Format
- official cards only
- current official card text
- TCG rulings and policy are preferred
- OCG information is informative only when TCG authority is unavailable

## 4. Dependencies

Depends On:

- governance/000_system_operating_rules.md
- governance/001_knowledge_architecture.md
- governance/002_source_hierarchy.md
- governance/003_response_methodology.md
- governance/006_module_creation_and_review_policy.md
- governance/007_sub_agent_workflow_policy.md
- runtime/020_deckbuilding_assistant_context.md
- glossary/010_deckbuilding_terms.md
- competitive/010_deckbuilding_principles.md
- competitive/011_card_roles.md

Related Modules:

- competitive/013_ratios_and_consistency.md
- competitive/014_starters_extenders_payoffs.md
- analytics/016_probability_and_consistency.md

## 5. Clarifying Questions

Questions Needed:

- None for this first draft.

Assumptions Used Instead of Asking:

- This module should stay generic and avoid specific archetype examples.
- Exact engine/non-engine ratio targets belong in `competitive/013_ratios_and_consistency.md`.
- Side deck transformations should be noted here but handled fully in a later side deck module.

## 6. Key Definitions

```text
Term: Engine
Definition: The connected set of cards that enable the deck's main strategy.
Source Status: Inferred Not Verified / Needs Admin Review
```

```text
Term: Engine Card
Definition: A card that directly starts, extends, enables, protects, pays off, or is required by the deck's main strategy.
Source Status: Inferred Not Verified / Needs Admin Review
```

```text
Term: Engine Requirement
Definition: A card that the engine needs in the deck, graveyard, banished zone, Extra Deck, or hand for lines to function, even if drawing it is not always desirable.
Source Status: VERIFIED_BY_ADMIN from competitive/011_card_roles.md
```

```text
Term: Non-Engine
Definition: Cards included primarily to interact, defend, break boards, improve matchups, or support the deck without being part of the core engine.
Source Status: VERIFIED_BY_ADMIN from competitive/011_card_roles.md
```

```text
Term: Hybrid Card
Definition: A card that performs an engine role in some contexts and a non-engine role in others.
Source Status: Inferred Not Verified / Needs Admin Review
```

```text
Term: Flex Slot
Definition: A card slot that can change based on metagame, matchup expectations, build preference, or testing results without breaking the deck's core plan.
Source Status: VERIFIED_BY_ADMIN from competitive/011_card_roles.md
```

## 7. Core Rules or Principles

### 7.1 Engine Serves the Deck Plan

Engine cards are the cards that make the deck's own plan function.

They may include:

- starters
- extenders
- payoffs
- engine requirements
- consistency cards that access the engine
- follow-up cards tied to the engine

Source Status: Inferred Not Verified / Needs Admin Review

### 7.2 Non-Engine Serves Interaction and Coverage

Non-engine cards are not part of the deck's core plan, but they help the deck survive, disrupt, answer boards, or cover matchups.

They may include:

- defensive non-engine
- hand traps
- board breakers
- floodgates
- matchup-specific side deck cards
- flexible defensive or utility cards

Source Status: Inferred Not Verified / Needs Admin Review

### 7.3 Engine Requirement Is Not the Same as Good Engine

Some cards are required by the engine but are bad to draw.

Those cards should be labelled separately as engine requirements, bricks, or garnets where appropriate. Treating every engine requirement as a positive engine card can hide consistency problems.

Source Status: Inferred Not Verified / Needs Admin Review

### 7.4 Hybrid Cards Need Context

A card can be engine in one build and non-engine in another.

A card can also be engine in one hand but non-engine in another, depending on what it accesses, enables, or answers.

When a card has mixed use, label both roles instead of forcing a single category.

Source Status: Inferred Not Verified / Needs Admin Review

### 7.5 Flex Slots Are Not Free Slots

A flex slot can change without breaking the core plan, but it still has a job.

Before changing flex slots, identify what those slots are currently doing:

- increasing engine access
- adding interaction
- improving going second
- protecting combo lines
- improving a specific matchup
- reducing brick risk

Source Status: Inferred Not Verified / Needs Admin Review

### 7.6 Post-Side Roles Can Change

Side decking can change the engine/non-engine balance.

A card that is non-engine in game one may become central to the post-side plan, and a main-engine card may be trimmed if it is weak into the expected matchup.

Source Status: Inferred Not Verified / Needs Admin Review

## 8. Practical Application

When classifying a submitted deck list:

1. Identify the deck's main plan.
2. Mark each card as engine, non-engine, hybrid, or unclear.
3. Identify each card's card role from `competitive/011_card_roles.md`.
4. Separate engine requirements from actively useful engine cards.
5. Mark bricks and garnets.
6. Mark flex slots and explain why they are flexible.
7. Count engine, non-engine, hybrid, and unclear slots.
8. Use the counts as input for later ratio and probability analysis.

Suggested table:

```text
Card:
Count:
Engine / Non-Engine / Hybrid:
Primary Role:
Secondary Role(s):
Engine Requirement:
Brick or Garnet Risk:
Flex Slot:
Notes:
```

## 9. Examples

### Example 1 - Required but Bad to Draw

Situation:
- A card is necessary for a combo line but is weak when opened.

Answer:
- Classify it as an engine requirement with brick or garnet risk.

Reasoning:
- It belongs to the engine, but it should not be counted the same way as a starter or extender that improves hand quality.

Source Status:
- Inferred / Needs Review

### Example 2 - Interaction Card

Situation:
- A card is included mainly to interrupt the opponent and does not start or extend the deck's own line.

Answer:
- Classify it as non-engine, usually defensive non-engine or hand trap depending on how it functions.

Reasoning:
- Its role is interaction rather than executing the deck's engine.

Source Status:
- Inferred / Needs Review

### Example 3 - Hybrid Utility

Situation:
- A card can access engine pieces in some hands but can also answer the opponent's card in other hands.

Answer:
- Classify it as hybrid and list both roles.

Reasoning:
- Forcing it into only engine or only non-engine would hide its real deckbuilding value.

Source Status:
- Inferred / Needs Review

## 10. Common Mistakes

- Counting every engine requirement as a positive consistency card.
- Treating every non-engine card as interchangeable.
- Calling a card non-engine when it is required for the deck's main line.
- Calling a card engine just because it is searchable.
- Ignoring cards that are hybrid by context.
- Treating flex slots as meaningless filler.
- Cutting non-engine without checking what matchup or turn-order problem it solved.
- Adding more engine without identifying which non-engine function is being lost.

## 11. Edge Cases

- A card can be engine in one build but non-engine in another.
- A card can be a starter-equivalent in one shell but only a flex slot in another.
- A card can be bad to draw but still necessary for the engine.
- A card can become part of the post-side plan even if it is not part of the main engine.
- A card can be counted differently depending on whether the analysis is pre-side or post-side.

## 12. Verification Gate

This module cannot be marked VERIFIED until Admin has reviewed or approved it.

Verification Status:

```text
NEEDS_ADMIN_REVIEW
```

Review Notes:

- Confirm whether "hybrid card" should become formal YGOBrain terminology.
- Confirm whether engine requirements should always be counted separately from positive engine cards.
- Confirm whether this module should use "engine card" and "engine piece" as separate terms or synonyms.

## 13. Validation Checklist

Before marking this module as VERIFIED, check:

- [x] Scope is clear.
- [x] Clarifying questions were asked if needed.
- [x] Important assumptions are stated.
- [x] Important terms are defined.
- [x] Claims are sourced or labelled as needing review.
- [x] Examples are included where useful.
- [x] Edge cases are included where useful.
- [x] Common mistakes are included where useful.
- [ ] Related tests are created if needed.
- [ ] Admin has reviewed or approved the module.

## 14. Sources

```text
Source Name: Admin Verification
Source Family: Admin Verification
Source Type: ADMIN_VERIFICATION
Authority Tier: Project-specific authority
URL or Reference: Internal YGOBrain review
Format: PROJECT_INTERNAL
Date Checked: Pending
Relevant Claim: Engine vs non-engine framework approval.
Confidence: UNKNOWN until reviewed
Verification Status: NEEDS_HUMAN_REVIEW
Approval Status: APPROVED
Approved Scope: Project acceptance, terminology approval, deckbuilding preferences, and final verification decisions.
Approved By: Admin
Notes: This module is a strategic terminology and deckbuilding framework draft requiring Admin review.
```

```text
Source Name: 011 Card Roles
Source Family: Admin Verification
Source Type: PROJECT_MODULE
Authority Tier: Project-specific authority
URL or Reference: competitive/011_card_roles.md
Format: PROJECT_INTERNAL
Date Checked: 2026-06-06
Relevant Claim: Verified card role terminology used by this module.
Confidence: HIGH for project acceptance
Verification Status: VERIFIED_BY_ADMIN
Approval Status: APPROVED
Approved Scope: YGOBrain card role taxonomy.
Approved By: Admin
Notes: Provides verified definitions for engine requirement, non-engine, flex slot, brick, garnet, and other role terms.
```

## 15. Open Questions

- Should "hybrid card" be added to `glossary/010_deckbuilding_terms.md` if this module is accepted?
- Should YGOBrain distinguish "engine card" from "engine piece," or treat them as synonyms?
- Should future ratio modules count hybrid cards as partial engine, partial non-engine, or require context-specific classification?

## 16. Change Log

```text
2026-06-06
Status: DRAFTED
Change: Created first draft of engine vs non-engine module.
Reason: YGOBrain needs engine/non-engine classification before ratio and probability modules.
```
