# 014 Starters, Extenders, and Payoffs

Status: DRAFTED
Version: v0.1
Category: competitive
Scope: Practical framework for comparing starter, extender, starter-equivalent, and payoff roles in deckbuilding analysis
Owner: Admin
Last Updated: 2026-06-06

## 1. Purpose

This module explains how YGOBrain should compare cards that begin plays, continue plays, or reward completed plays.

It exists so the assistant does not treat all starters as equal or overvalue payoff cards before checking access and resilience.

## 2. Scope

This module covers:

- one-card starters
- 1.5-card starters
- two-card starters
- starter-equivalent cards
- extenders
- payoff cards
- cards that change role depending on hand state
- why not all starters are equal

This module does not cover:

- exact probability math
- archetype-specific combo lines
- official card text or ruling claims
- complete engine vs non-engine theory

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
- competitive/011_card_roles.md
- competitive/013_ratios_and_consistency.md

Related Modules:

- competitive/012_engine_vs_non_engine.md
- competitive/015_chokepoints.md
- analytics/016_probability_and_consistency.md

## 5. Clarifying Questions

Questions Needed:

- None for this first draft.

Assumptions Used Instead of Asking:

- Definitions from verified `competitive/011_card_roles.md` control terminology.
- Examples should stay generic and avoid specific archetypes.

## 6. Key Definitions

```text
Term: Starter Quality
Definition: The practical reliability and value of a starter after considering required cards, costs, vulnerability, restrictions, and payoff.
Source Status: Inferred Not Verified / Needs Admin Review
```

```text
Term: Starter-Equivalent
Definition: A card or package that does not literally start alone but functionally increases the deck's access to playable opening lines.
Source Status: VERIFIED_BY_ADMIN from competitive/011_card_roles.md
```

```text
Term: Payoff Density
Definition: The amount of deck space assigned to cards or outcomes that reward successful engine execution.
Source Status: Inferred Not Verified / Needs Admin Review
```

## 7. Core Rules or Principles

### 7.1 One-Card Starters Are Not Automatically Equal

A one-card starter may still differ by cost, fragility, locks, follow-up, required deck space, or how much it loses to interruption.

Source Status: Inferred Not Verified / Needs Admin Review

### 7.2 1.5-Card Starters Need Their Condition Stated

A 1.5-card starter generally means one specific card plus any other card in hand.

When classifying one, state the required condition, such as discard cost, card in hand, empty field, or another broad condition.

Source Status: VERIFIED_BY_ADMIN for base term; application needs Admin review

### 7.3 Two-Card Starters Should Not Be Counted as Two Separate Starters

If a line requires two specific cards or two functional categories, count the package carefully.

Calling each card a full starter can overstate consistency.

Source Status: Inferred Not Verified / Needs Admin Review

### 7.4 Extenders Need a Started Game State

An extender usually becomes valuable after a starter, partial line, or established resource exists.

Too many extenders can create hands that do not begin play.

Source Status: Inferred Not Verified / Needs Admin Review

### 7.5 Payoffs Reward Execution but Do Not Fix Access

Payoff cards can raise ceiling, pressure, interruption, damage, advantage, or follow-up.

They should not be added to solve a starter problem unless they also improve access or conversion.

Source Status: Inferred Not Verified / Needs Admin Review

### 7.6 Role Changes Depend on Hand State

A card can be a brick in one hand, an extender in another, and a payoff or follow-up after the engine is established.

Classify the role for the actual context being analyzed.

Source Status: Inferred Not Verified / Needs Admin Review

## 8. Practical Application

When reviewing a deck list:

1. Separate true starters from starter-equivalent cards.
2. Split starters into one-card, 1.5-card, and two-card categories.
3. Note costs, restrictions, and required supporting cards.
4. Count extenders only after identifying what they extend.
5. Count payoff cards and ask whether they are needed or excessive.
6. Flag cards whose role changes by hand state.
7. Use the result to support ratio and probability analysis.

## 9. Examples

### Example 1 - Starter with a Cost

Situation:
- A card starts the main line only if another card can be discarded.

Answer:
- Classify it as a 1.5-card starter, not a clean one-card starter.

Reasoning:
- The card needs another card in hand to function.

Source Status:
- Inferred / Needs Review

### Example 2 - Extender Miscounted as Starter

Situation:
- A card is powerful after a monster reaches the field but does nothing alone.

Answer:
- Classify it as an extender, not a starter.

Reasoning:
- It continues a line but does not begin one.

Source Status:
- Inferred / Needs Review

## 10. Common Mistakes

- Treating all starters as equally reliable.
- Ignoring discard or reveal requirements.
- Ignoring specific-card requirements.
- Counting starter-equivalent cards as true starters without explanation.
- Calling an extender a starter because it is powerful in combo hands.
- Adding more payoffs when the deck lacks access.
- Ignoring whether a starter creates follow-up or only immediate board presence.

## 11. Edge Cases

- A card can be starter-equivalent only in builds with enough targets.
- A payoff can also be follow-up if it remains useful after the first turn.
- An extender can become a starter if another package changes the deck's access pattern.
- A card can be weak alone but strong enough with any discard to improve overall access.

## 12. Verification Gate

This module cannot be marked VERIFIED until Admin has reviewed or approved it.

Verification Status:

```text
NEEDS_ADMIN_REVIEW
```

Review Notes:

- Confirm whether "starter quality" and "payoff density" should become glossary terms.

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
Source Name: 011 Card Roles
Source Family: Admin Verification
Source Type: PROJECT_MODULE
Authority Tier: Project-specific authority
URL or Reference: competitive/011_card_roles.md
Format: PROJECT_INTERNAL
Date Checked: 2026-06-06
Relevant Claim: Verified starter, extender, payoff, and starter-equivalent terminology.
Confidence: HIGH for project acceptance
Verification Status: VERIFIED_BY_ADMIN
Approval Status: APPROVED
Approved Scope: YGOBrain card role taxonomy.
Approved By: Admin
Notes: This module builds on verified card role terms but its strategic framework still needs Admin review.
```

```text
Source Name: Admin Verification
Source Family: Admin Verification
Source Type: ADMIN_VERIFICATION
Authority Tier: Project-specific authority
URL or Reference: Internal YGOBrain review
Format: PROJECT_INTERNAL
Date Checked: Pending
Relevant Claim: Starter, extender, and payoff comparison framework approval.
Confidence: UNKNOWN until reviewed
Verification Status: NEEDS_HUMAN_REVIEW
Approval Status: APPROVED
Approved Scope: Project acceptance, terminology approval, deckbuilding preferences, and final verification decisions.
Approved By: Admin
Notes: This module is a strategic framework draft requiring Admin review.
```

## 15. Open Questions

- Should "starter quality" become a formal glossary term?
- Should "payoff density" become a formal glossary term?

## 16. Change Log

```text
2026-06-06
Status: DRAFTED
Change: Created starters, extenders, and payoffs foundation module.
Reason: YGOBrain needs starter quality language before chokepoint and ratio analysis.
```
