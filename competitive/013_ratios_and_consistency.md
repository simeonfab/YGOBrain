# 013 Ratios and Consistency

Status: DRAFTED
Version: v0.1
Category: competitive
Scope: Foundational ratio and consistency framework for Yu-Gi-Oh TCG Advanced Format deckbuilding analysis
Owner: Admin
Last Updated: 2026-06-06

## 1. Purpose

This module defines how YGOBrain should discuss deck ratios before moving into formal probability analysis.

It exists so the assistant can connect deck size, starter density, extender density, engine size, non-engine count, and brick risk to the deck's actual plan rather than treating consistency as a vague goal.

## 2. Scope

This module covers:

- deck size logic
- starter and extender density
- engine vs non-engine balance
- brick and garnet risk
- 40, 45, 50, and 60 card deckbuilding logic
- why ratios must serve the deck plan
- links to future probability analysis

This module does not cover:

- exact probability formulas
- archetype-specific ratio targets
- current format metagame conclusions
- official rules or card text claims

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
- competitive/012_engine_vs_non_engine.md

Related Modules:

- competitive/014_starters_extenders_payoffs.md
- analytics/016_probability_and_consistency.md

## 5. Clarifying Questions

Questions Needed:

- None for this first draft.

Assumptions Used Instead of Asking:

- Exact mathematical thresholds belong in a later analytics module.
- This module should stay strategic and deck-agnostic.

## 6. Key Definitions

```text
Term: Ratio
Definition: The count and proportion of card roles or card groups in a deck list.
Source Status: Inferred Not Verified / Needs Admin Review
```

```text
Term: Consistency
Definition: The deck's ability to produce playable hands that execute or support its plan often enough for the intended format and matchup context.
Source Status: Inferred Not Verified / Needs Admin Review
```

```text
Term: Density
Definition: The number of cards in a deck that perform or access a specific role, such as starters, extenders, non-engine, or defensive cards.
Source Status: Inferred Not Verified / Needs Admin Review
```

## 7. Core Rules or Principles

### 7.1 Ratios Must Serve the Deck Plan

Do not judge a ratio in isolation.

A correct ratio is one that helps the deck produce the hands it needs while preserving the interaction, follow-up, and payoff structure required by its plan.

Source Status: Inferred Not Verified / Needs Admin Review

### 7.2 Starter Density Is the First Consistency Check

A deck that cannot begin its plan often enough usually has a starter access problem.

Starter density should include one-card starters, 1.5-card starters, two-card packages, and starter-equivalent cards only when their conditions are clearly stated.

Source Status: Inferred Not Verified / Needs Admin Review

### 7.3 Extender Density Determines Resilience and Ceiling

Extenders help a deck continue after partial progress, interruption, or a weak opener.

Too few extenders can make starters fragile. Too many extenders can create hands that do not start.

Source Status: Inferred Not Verified / Needs Admin Review

### 7.4 Engine and Non-Engine Create a Tension

More engine can improve access to the deck's own plan.

More non-engine can improve interaction, defense, and board-breaking. The best balance depends on what the deck must beat and how much engine it needs to function.

Source Status: Inferred Not Verified / Needs Admin Review

### 7.5 Brick and Garnet Risk Changes Deck Size Logic

A deck with required bad draws may consider increasing deck size if the larger size meaningfully reduces unwanted draws while preserving enough starter access.

This is a theory claim until supported by testing or probability analysis.

Source Status: Inferred Not Verified / Needs Admin Review

### 7.6 Deck Size Is a Tradeoff

Common deck size logic:

- 40 cards: maximizes access to the highest-value cards and core starters.
- 45 cards: may fit extra engine or non-engine while keeping reasonable access.
- 50 cards: can reduce repeated bad draws or fit larger engines, but requires strong access density.
- 60 cards: usually needs unusually high starter-equivalent density, search power, or a reason to dilute specific draws.

Source Status: Inferred Not Verified / Needs Admin Review

## 8. Practical Application

When reviewing a deck list:

1. Identify deck size.
2. Count true starters and starter-equivalent cards separately.
3. Count extenders.
4. Count payoffs, engine requirements, bricks, and garnets.
5. Count engine, non-engine, and hybrid cards.
6. Check whether the ratio supports the going-first, going-second, or hybrid plan.
7. Mark any recommendation as theory, tested, source-backed, or needing probability analysis.

## 9. Examples

### Example 1 - High Ceiling, Low Access

Situation:
- A deck plays many payoff cards but opens unplayable hands too often.

Answer:
- Review starter density before adding more payoffs.

Reasoning:
- Payoffs do not matter if the deck cannot reliably begin its plan.

Source Status:
- Inferred / Needs Review

### Example 2 - Larger Deck for Brick Risk

Situation:
- A deck has several required cards that are poor to draw.

Answer:
- A larger deck size may be worth testing only if starter access remains strong.

Reasoning:
- Diluting bad draws can also dilute starters, so the tradeoff needs testing or probability analysis.

Source Status:
- Inferred / Needs Review

## 10. Common Mistakes

- Calling a deck consistent without counting starter access.
- Treating every starter-equivalent card as a true starter.
- Adding extenders when the deck actually lacks starters.
- Adding payoffs when the deck cannot access its engine.
- Increasing deck size without checking starter density.
- Cutting non-engine without checking what interaction is lost.
- Treating 40 cards as automatically correct or larger decks as automatically wrong.

## 11. Edge Cases

- A 40-card deck can still be inconsistent if many cards do not start or access the plan.
- A larger deck can be justified if it has enough access density and a real reason to dilute bad draws.
- Hybrid cards may need to be counted differently by matchup or turn order.
- A card may improve consistency in one build but only add clutter in another.

## 12. Verification Gate

This module cannot be marked VERIFIED until Admin has reviewed or approved it.

Verification Status:

```text
NEEDS_ADMIN_REVIEW
```

Review Notes:

- Confirm whether the deck size logic is acceptable as a strategic framework.
- Confirm whether "density" should become glossary terminology.

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
Relevant Claim: Ratio and consistency framework approval.
Confidence: UNKNOWN until reviewed
Verification Status: NEEDS_HUMAN_REVIEW
Approval Status: APPROVED
Approved Scope: Project acceptance, terminology approval, deckbuilding preferences, and final verification decisions.
Approved By: Admin
Notes: This module is a strategic deckbuilding framework draft requiring Admin review.
```

## 15. Open Questions

- Should "density" be added to `glossary/010_deckbuilding_terms.md` after this module is accepted?
- Should YGOBrain use default caution language for 50-card and 60-card decks?

## 16. Change Log

```text
2026-06-06
Status: DRAFTED
Change: Created ratios and consistency foundation module.
Reason: YGOBrain needs ratio language before probability and deck-specific analysis modules.
```
