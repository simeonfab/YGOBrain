# 015 Chokepoints

Status: DRAFTED
Version: v0.1
Category: competitive
Scope: Framework for identifying and applying chokepoints in Yu-Gi-Oh TCG Advanced Format deckbuilding and play analysis
Owner: Admin
Last Updated: 2026-06-06

## 1. Purpose

This module defines how YGOBrain should discuss chokepoints.

It exists so deckbuilding advice can connect card choices, hand traps, redundancy, baiting, and sequencing to the places where a deck is most vulnerable or most profitable to disrupt.

## 2. Scope

This module covers:

- what chokepoints are
- how to identify chokepoints
- how hand traps and disruption interact with chokepoints
- baiting, sequencing, and redundancy
- how chokepoints affect deckbuilding

This module does not cover:

- exact archetype-specific combo maps
- official rules claims about card activation legality
- current matchup guides
- formal probability calculations

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
- competitive/014_starters_extenders_payoffs.md

Related Modules:

- competitive/016_interruption_layering.md
- competitive/017_going_first_vs_second.md

## 5. Clarifying Questions

Questions Needed:

- None for this first draft.

Assumptions Used Instead of Asking:

- Chokepoint discussion should be strategic unless exact card text is being analyzed.
- Specific rulings must be checked in rules modules or official sources when wording matters.

## 6. Key Definitions

```text
Term: Chokepoint
Definition: A point in a deck's line where interruption, removal, or prevention creates unusually high impact because the line depends on that action, card, summon, effect, or resource.
Source Status: Inferred Not Verified / Needs Admin Review
```

```text
Term: Redundancy
Definition: The deck's ability to continue or reach a similar outcome through multiple cards, lines, or resource paths.
Source Status: Inferred Not Verified / Needs Admin Review
```

```text
Term: Bait
Definition: A play or card used to invite interruption before the more important action resolves.
Source Status: Inferred Not Verified / Needs Admin Review
```

## 7. Core Rules or Principles

### 7.1 A Chokepoint Is Contextual

A card is not always a chokepoint by itself.

It becomes a chokepoint when the deck's current hand, line, or matchup depends heavily on it resolving or remaining available.

Source Status: Inferred Not Verified / Needs Admin Review

### 7.2 Identify What the Line Cannot Replace

To find a chokepoint, ask:

- What must resolve?
- What must stay on field?
- What specific card or type is required next?
- What resource cannot be recovered if stopped?
- Does the hand have another path?

Source Status: Inferred Not Verified / Needs Admin Review

### 7.3 Disruption Is Best When It Hits Dependency

Hand traps and other disruption are strongest when they stop access, conversion, payoff, or follow-up that the opponent cannot replace.

Low-impact interruption may trade one-for-one without stopping the deck's plan.

Source Status: Inferred Not Verified / Needs Admin Review

### 7.4 Baiting and Sequencing Can Protect Chokepoints

A deck can reduce vulnerability by ordering plays to draw interruption early, preserve important effects, or establish redundant access before committing to the key point.

Source Status: Inferred Not Verified / Needs Admin Review

### 7.5 Deckbuilding Can Reduce Chokepoint Risk

Redundant starters, extenders, flexible access cards, and alternate lines can reduce how often one interruption ends the turn.

This must be balanced against brick risk and deck size.

Source Status: Inferred Not Verified / Needs Admin Review

## 8. Practical Application

When analyzing chokepoints:

1. Identify the deck's intended line.
2. Mark the points that must resolve.
3. Check whether the hand has alternate access or extenders.
4. Identify which disruption types matter at each point.
5. Note whether the deck can bait or sequence around them.
6. Suggest deckbuilding changes only after checking ratios and role counts.

## 9. Examples

### Example 1 - No Redundancy

Situation:
- A hand reaches one important search effect and has no alternate access if it is stopped.

Answer:
- Treat that search effect as a chokepoint for that hand.

Reasoning:
- The hand depends on that effect to continue.

Source Status:
- Inferred / Needs Review

### Example 2 - Extender Changes the Chokepoint

Situation:
- A hand has a starter plus an extender that can continue if the first monster is removed.

Answer:
- The same interruption may be lower impact in this hand than in a hand without the extender.

Reasoning:
- Redundancy changes the value of the disruption point.

Source Status:
- Inferred / Needs Review

## 10. Common Mistakes

- Assuming a card is always the chokepoint in every hand.
- Ignoring extenders and alternate lines.
- Using disruption too early without checking what the opponent still has.
- Building only for ceiling while leaving one fragile dependency.
- Adding redundancy without checking whether it creates more bricks.
- Treating bait as guaranteed rather than matchup and hand dependent.

## 11. Edge Cases

- A weak-looking action can be the chokepoint if it is the only bridge to engine access.
- A strong effect may not be a chokepoint if the hand has multiple backups.
- A chokepoint can shift post-side when different cards enter or leave the deck.
- A card can be both bait and a real threat depending on the hand.

## 12. Verification Gate

This module cannot be marked VERIFIED until Admin has reviewed or approved it.

Verification Status:

```text
NEEDS_ADMIN_REVIEW
```

Review Notes:

- Confirm whether "chokepoint", "redundancy", and "bait" should become glossary terms.

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
Relevant Claim: Chokepoint framework approval.
Confidence: UNKNOWN until reviewed
Verification Status: NEEDS_HUMAN_REVIEW
Approval Status: APPROVED
Approved Scope: Project acceptance, terminology approval, deckbuilding preferences, and final verification decisions.
Approved By: Admin
Notes: This module is a strategic framework draft requiring Admin review.
```

## 15. Open Questions

- Should "chokepoint" be added to `glossary/010_deckbuilding_terms.md` after acceptance?
- Should future tests include hand-state examples for chokepoint identification?

## 16. Change Log

```text
2026-06-06
Status: DRAFTED
Change: Created chokepoints foundation module.
Reason: YGOBrain needs chokepoint language before detailed interruption and matchup analysis.
```
