# 018 Side Deck Theory

Status: DRAFTED
Version: v0.1
Category: competitive
Scope: Foundational side deck framework for Yu-Gi-Oh TCG Advanced Format deckbuilding analysis
Owner: Admin
Last Updated: 2026-06-06

## 1. Purpose

This module defines how YGOBrain should discuss side deck planning.

It exists so the assistant can recommend side deck changes without breaking the main engine, over-siding, or ignoring turn-order and matchup plans.

## 2. Scope

This module covers:

- side deck purpose
- going-first side plans
- going-second side plans
- matchup-specific plans
- what to take out
- avoiding over-siding
- keeping engine functional post-side

This module does not cover:

- current metagame side deck lists
- exact matchup guides
- tournament-specific card choices
- official policy or legality claims

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
- competitive/011_card_roles.md
- competitive/012_engine_vs_non_engine.md
- competitive/016_interruption_layering.md
- competitive/017_going_first_vs_second.md

Related Modules:

- competitive/013_ratios_and_consistency.md
- analytics/010_analytics_principles.md

## 5. Clarifying Questions

Questions Needed:

- None for this first draft.

Assumptions Used Instead of Asking:

- This module should define side deck method, not current format side cards.
- Matchup-specific side plans should be created later in deck or matchup modules.

## 6. Key Definitions

```text
Term: Side Plan
Definition: The planned set of cards to add and remove for a matchup, turn order, or expected opponent strategy.
Source Status: Inferred Not Verified / Needs Admin Review
```

```text
Term: Over-Siding
Definition: Adding or removing so many cards that the deck's core plan, ratios, or engine function becomes unreliable.
Source Status: Inferred Not Verified / Needs Admin Review
```

```text
Term: Post-Side Role
Definition: The role a card or deck takes after side decking, which may differ from its game one role.
Source Status: Inferred Not Verified / Needs Admin Review
```

## 7. Core Rules or Principles

### 7.1 The Side Deck Has a Job

The side deck should solve specific problems:

- improve going first
- improve going second
- answer matchup threats
- change interaction coverage
- protect the engine
- punish predictable opponent plans

Source Status: Inferred Not Verified / Needs Admin Review

### 7.2 Going-First Side Plans Protect or Strengthen Setup

Going-first side plans often add cards that make the deck's first-turn setup harder to break or more punishing.

They should not add so many narrow cards that starter access becomes unreliable.

Source Status: Inferred Not Verified / Needs Admin Review

### 7.3 Going-Second Side Plans Need Access Through Boards

Going-second side plans often add hand traps, board breakers, or cards that force through engine access.

They should still leave enough engine to convert after the board is answered.

Source Status: Inferred Not Verified / Needs Admin Review

### 7.4 Every Side-In Needs a Side-Out

Do not recommend side cards without explaining what leaves the deck.

The side-out plan should preserve starters, necessary extenders, engine requirements, and enough payoff to win.

Source Status: Inferred Not Verified / Needs Admin Review

### 7.5 Avoid Over-Siding

Over-siding can turn a functional deck into a pile of answers that cannot execute its own plan.

Side plans should improve the matchup while keeping the post-side deck coherent.

Source Status: Inferred Not Verified / Needs Admin Review

## 8. Practical Application

When creating a side plan:

1. Identify matchup and expected turn order.
2. Identify what problem must be solved.
3. Choose side-in cards by role and coverage.
4. Choose side-out cards by low impact, turn-order weakness, overlap, or matchup weakness.
5. Recheck engine count, starter access, and brick risk.
6. Confirm the post-side plan still wins games, not just answers cards.

Suggested side plan table:

```text
Matchup:
Turn Order:
Side In:
Side Out:
Reason:
Engine Count After Side:
Non-Engine Count After Side:
Risk:
Testing Note:
```

## 9. Examples

### Example 1 - No Side-Out Plan

Situation:
- A recommendation adds five matchup cards but does not say what to remove.

Answer:
- The recommendation is incomplete.

Reasoning:
- Side-ins must be balanced against side-outs or the engine may stop functioning.

Source Status:
- Inferred / Needs Review

### Example 2 - Over-Siding

Situation:
- A post-side list removes many starters to fit narrow answers.

Answer:
- The side plan may over-side and reduce the deck's ability to win after answering the opponent.

Reasoning:
- Interaction needs a functional engine behind it.

Source Status:
- Inferred / Needs Review

## 10. Common Mistakes

- Recommending side-ins without side-outs.
- Removing too many starters.
- Keeping cards that are weak for the expected turn order.
- Adding narrow answers without checking matchup relevance.
- Overlapping too many answers to one problem.
- Forgetting that the opponent also sides.
- Building a side deck that changes the plan without supporting the new role.

## 11. Edge Cases

- A main-deck flex slot can become core post-side.
- A side card can be correct only going first or only going second.
- A matchup may require reducing ceiling to gain survivability.
- A card can be sided out even if it is strong in general, if it is poor in the specific matchup.
- A deck can change from proactive to reactive post-side, but the new role must be deliberate.

## 12. Verification Gate

This module cannot be marked VERIFIED until Admin has reviewed or approved it.

Verification Status:

```text
NEEDS_ADMIN_REVIEW
```

Review Notes:

- Confirm whether "side plan", "over-siding", and "post-side role" should become glossary terms.

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
Relevant Claim: Side deck theory framework approval.
Confidence: UNKNOWN until reviewed
Verification Status: NEEDS_HUMAN_REVIEW
Approval Status: APPROVED
Approved Scope: Project acceptance, terminology approval, deckbuilding preferences, and final verification decisions.
Approved By: Admin
Notes: This module is a strategic framework draft requiring Admin review.
```

## 15. Open Questions

- Should side plans require a side-in/side-out table in future deck overlays?
- Should "over-siding" be formal glossary terminology?

## 16. Change Log

```text
2026-06-06
Status: DRAFTED
Change: Created side deck theory foundation module.
Reason: YGOBrain needs side deck planning language before deck-specific side plans.
```
