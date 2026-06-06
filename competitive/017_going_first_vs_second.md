# 017 Going First vs Second

Status: DRAFTED
Version: v0.1
Category: competitive
Scope: Framework for evaluating going-first, going-second, and hybrid deckbuilding choices
Owner: Admin
Last Updated: 2026-06-06

## 1. Purpose

This module defines how YGOBrain should discuss turn-order bias in deckbuilding.

It exists so the assistant can explain why a card's value changes depending on whether the deck expects to build first, break second, or remain flexible across both roles.

## 2. Scope

This module covers:

- going-first deckbuilding
- going-second deckbuilding
- hybrid builds
- main deck vs side deck tension
- why card value changes by turn order

This module does not cover:

- exact matchup side plans
- current metagame calls
- individual card legality or rulings
- full side deck theory

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
- runtime/020_deckbuilding_assistant_context.md
- glossary/010_deckbuilding_terms.md
- competitive/010_deckbuilding_principles.md
- competitive/012_engine_vs_non_engine.md
- competitive/016_interruption_layering.md

Related Modules:

- competitive/018_side_deck_theory.md

## 5. Clarifying Questions

Questions Needed:

- None for this first draft.

Assumptions Used Instead of Asking:

- This module should define strategic turn-order logic, not prescribe current format card choices.

## 6. Key Definitions

```text
Term: Going-First Card
Definition: A card whose main value appears when the player acts first, establishes pressure, protects a setup, or prepares interruption before the opponent develops.
Source Status: Inferred Not Verified / Needs Admin Review
```

```text
Term: Going-Second Card
Definition: A card whose main value appears when the opponent has already acted or is expected to commit threats before the player can execute their plan.
Source Status: Inferred Not Verified / Needs Admin Review
```

```text
Term: Hybrid Build
Definition: A build designed to retain acceptable plans when going first and going second rather than maximizing only one turn order.
Source Status: Inferred Not Verified / Needs Admin Review
```

## 7. Core Rules or Principles

### 7.1 Going-First Deckbuilding Prioritizes Setup

Going-first builds usually care about starter access, protection, engine resilience, layered interruption, follow-up, and avoiding dead going-first cards.

Source Status: Inferred Not Verified / Needs Admin Review

### 7.2 Going-Second Deckbuilding Prioritizes Access Through Opposition

Going-second builds usually care about board breakers, hand traps, engine cards that play through interruption, damage conversion, and cards that remain useful into established boards.

Source Status: Inferred Not Verified / Needs Admin Review

### 7.3 Hybrid Builds Trade Ceiling for Flexibility

A hybrid build may accept lower maximum power in either direction to reduce bad hands across unknown turn orders.

This is useful when game one turn order is uncertain or when the deck can naturally play both roles.

Source Status: Inferred Not Verified / Needs Admin Review

### 7.4 Main Deck and Side Deck Create Tension

The main deck must function before side decking.

The side deck can specialize after turn order and matchup are clearer, but it should not create a post-side plan that breaks engine function.

Source Status: Inferred Not Verified / Needs Admin Review

### 7.5 Card Value Changes by Turn Order

A card that is excellent going first may be weak going second, and a card that breaks boards going second may be poor when drawn while going first.

Classify card value by turn order before recommending ratio changes.

Source Status: Inferred Not Verified / Needs Admin Review

## 8. Practical Application

When reviewing a deck list:

1. Identify whether the build is going-first, going-second, or hybrid.
2. Mark cards with going-first, going-second, or flexible value.
3. Check whether the main deck can function game one.
4. Check whether the side deck can specialize without damaging engine access.
5. Connect turn-order choices to interruption layering and ratio analysis.

## 9. Examples

### Example 1 - Dead Going-First Board Breakers

Situation:
- A deck mains many cards that only answer established boards.

Answer:
- The deck may be biased going second and may have weaker going-first openers.

Reasoning:
- Board breakers can be poor before the opponent commits threats.

Source Status:
- Inferred / Needs Review

### Example 2 - Strong Setup, Weak Recovery

Situation:
- A deck builds a strong first turn but has little ability to break boards.

Answer:
- It may need side deck support or main deck flexibility for going second.

Reasoning:
- Winning the die roll cannot be the only plan across a match.

Source Status:
- Inferred / Needs Review

## 10. Common Mistakes

- Evaluating cards without asking whether they are good going first or second.
- Main decking too many going-second cards in a deck that must establish first.
- Siding so many answers that the engine stops functioning.
- Assuming a hybrid card is always flexible in every matchup.
- Ignoring that side decking can change the deck's role.
- Treating game one and post-side games as the same deckbuilding problem.

## 11. Edge Cases

- A card can be weak going first but still correct if the deck expects to lose the die roll often enough in testing.
- A going-first deck may still need enough going-second tools to avoid auto-losing game one.
- A going-second card can become follow-up if it also advances the deck's own plan.
- A post-side build can intentionally become more specialized than the main deck.

## 12. Verification Gate

This module cannot be marked VERIFIED until Admin has reviewed or approved it.

Verification Status:

```text
NEEDS_ADMIN_REVIEW
```

Review Notes:

- Confirm whether "going-first card", "going-second card", and "hybrid build" should become glossary terms.

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
Relevant Claim: Going-first vs going-second framework approval.
Confidence: UNKNOWN until reviewed
Verification Status: NEEDS_HUMAN_REVIEW
Approval Status: APPROVED
Approved Scope: Project acceptance, terminology approval, deckbuilding preferences, and final verification decisions.
Approved By: Admin
Notes: This module is a strategic framework draft requiring Admin review.
```

## 15. Open Questions

- Should turn-order labels become a required field in future deck role tables?
- Should "hybrid build" be formal glossary terminology?

## 16. Change Log

```text
2026-06-06
Status: DRAFTED
Change: Created going first vs second foundation module.
Reason: YGOBrain needs turn-order logic before side deck and matchup modules.
```
