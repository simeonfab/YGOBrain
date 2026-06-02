# 010 Deckbuilding Principles

Status: DRAFTED
Version: v0.1
Category: competitive
Scope: Foundational principles for evaluating and improving Yu-Gi-Oh TCG Advanced Format deck lists
Owner: Simeon Fabowale-Makinde
Last Updated: 2026-06-02

## 1. Purpose

This module defines the first-pass framework for deckbuilding analysis in YGOBrain.

It exists to help the assistant critique deck lists in a structured, practical, and testable way rather than giving generic advice.

## 2. Scope

This module covers:

- high-level deckbuilding principles
- how to identify a deck's plan
- how to evaluate card roles
- how to think about ratios
- how to connect deckbuilding theory to testing
- how to avoid vague or unsupported recommendations

This module does not cover:

- specific archetype theory
- exact metagame calls
- current banlist recommendations
- full probability math
- full side deck theory
- detailed ruling interactions

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

Related Modules:

- competitive/011_card_roles.md
- competitive/012_engine_vs_non_engine.md
- competitive/013_ratios_and_consistency.md
- analytics/016_probability_and_consistency.md

## 5. Clarifying Questions

Questions Needed:

- None for this first draft.

Assumptions Used Instead of Asking:

- This module should remain general and not reference a specific deck yet.
- Specific ratio thresholds should be handled later in ratio and probability modules.
- This module should be practical rather than academically exhaustive.

## 6. Key Definitions

```text
Term: Deck Plan
Definition: The primary way a deck intends to win or reach a winning position.
Source Status: Inferred Not Verified / Needs Simeon Review
```

```text
Term: Engine
Definition: The connected set of cards that enable the deck's main strategy.
Source Status: Inferred Not Verified / Needs Simeon Review
```

```text
Term: Non-Engine
Definition: Cards included primarily to interact with the opponent, improve matchup coverage, or support the deck without being part of the core engine.
Source Status: Inferred Not Verified / Needs Simeon Review
```

```text
Term: Starter
Definition: A card or card combination that initiates the deck's main line of play.
Source Status: Inferred Not Verified / Needs Simeon Review
```

```text
Term: Extender
Definition: A card that continues, strengthens, or protects plays after a starter or partial line has begun.
Source Status: Inferred Not Verified / Needs Simeon Review
```

```text
Term: Brick or Garnet
Definition: A card that is required or useful within the engine but is weak, dead, or actively bad to draw in many hands.
Source Status: Inferred Not Verified / Needs Simeon Review
```

## 7. Core Rules or Principles

### 7.1 Start with the Deck Plan

Before changing cards, identify what the deck is trying to do.

A deck list should be judged against its own plan, not against a generic idea of consistency or power.

Examples of deck plans include:

- establish a strong going-first board
- break boards going second
- simplify the game into a grind
- assemble a compact two-card combo
- trade efficiently until a payoff wins
- use a flexible midrange engine with strong non-engine support

Source Status: Inferred Not Verified / Needs Simeon Review

### 7.2 Classify Cards by Role Before Recommending Changes

A card should not be cut or added without understanding its role.

Before recommending changes, classify cards where useful as:

- starter
- extender
- payoff
- engine requirement
- brick or garnet
- defensive non-engine
- board breaker
- hand trap
- floodgate
- consistency card
- flex slot
- side deck card
- follow-up card

Source Status: Inferred Not Verified / Needs Simeon Review

### 7.3 Ratios Must Serve the Plan

There is no universally correct ratio of engine to non-engine.

A combo deck, midrange deck, control deck, and going-second deck may require very different ratios.

The right question is not only:

```text
Is this ratio mathematically consistent?
```

The better question is:

```text
Does this ratio create the hands the deck needs to execute its plan while still interacting enough with the format?
```

Source Status: Inferred Not Verified / Needs Simeon Review

### 7.4 Identify the Cost of Every Inclusion

Adding a card always means cutting or diluting something else.

Every recommendation should explain the opportunity cost.

Example:

```text
Adding more board breakers may improve going second, but it may reduce the number of hands that can build a strong going-first board.
```

Source Status: Inferred Not Verified / Needs Simeon Review

### 7.5 Separate Theory from Testing

A deckbuilding recommendation should be framed as:

- proven by results
- supported by testing
- common competitive practice
- theory
- needs testing

The assistant should not present theory as proven.

Source Status: Inferred Not Verified / Needs Simeon Review

### 7.6 Avoid Vague Recommendations

Weak recommendation:

```text
Improve consistency.
```

Better recommendation:

```text
Increase the number of reliable starters or reduce cards that do not contribute to playable opening hands.
```

Best recommendation:

```text
Cut 2 low-impact flex cards for 2 additional starter-equivalent cards, then test whether opening hand playability improves without increasing brick rate or reducing interaction too much.
```

Source Status: Inferred Not Verified / Needs Simeon Review

## 8. Practical Application

When analyzing a deck list, use this sequence:

1. Identify the deck's plan.
2. Count and classify card roles.
3. Identify engine requirements and bricks.
4. Check whether ratios support the plan.
5. Identify what the list loses to.
6. Recommend specific cuts and additions.
7. Mark recommendations as tested, source-backed, theory, or needs testing.
8. Suggest a small testing plan.

## 9. Examples

### Example 1 — Starter Count Problem

Situation:
- A deck has strong end boards but frequently opens hands that do not start its main line.

Answer:
- The first issue is likely starter density or access to starter-equivalent cards.

Reasoning:
- Increasing payoff cards does not help if the deck cannot reliably begin its engine. The recommendation should focus on improving hand playability before increasing ceiling.

Source Status:
- Inferred / Needs Review

### Example 2 — Too Much Non-Engine

Situation:
- A deck plays many hand traps and board breakers but often fails to execute its own plan.

Answer:
- The list may be over-indexed on interaction relative to engine consistency.

Reasoning:
- Non-engine is only useful if the deck can still convert disrupted game states into wins. Too much interaction can reduce the number of hands that actually progress the deck's own win condition.

Source Status:
- Inferred / Needs Review

### Example 3 — Too Many Engine Requirements

Situation:
- A deck contains several cards that are needed for combos but bad to draw.

Answer:
- The deck may need either a smaller engine, better discard/conversion outlets, or a larger deck size if the reduction in brick frequency outweighs the consistency loss.

Reasoning:
- Engine requirements create a tension between combo ceiling and opening hand quality. The right answer depends on starter density, brick count, and whether drawn requirements are usable or dead.

Source Status:
- Inferred / Needs Review

## 10. Common Mistakes

- Recommending more consistency without identifying what should be cut.
- Treating all starters as equal when some require discards, specific pairings, or additional conditions.
- Ignoring engine requirements and bricks when judging consistency.
- Judging every deck by the same engine-to-non-engine ratio.
- Treating a theoretical improvement as proven without testing.
- Adding powerful cards that do not support the deck's actual plan.
- Ignoring whether a card is good going first, going second, or only in specific matchups.

## 11. Edge Cases

- A larger deck can sometimes reduce brick frequency, but only if starter access remains acceptable.
- A card can be both an engine requirement and useful when drawn if the deck has discard outlets or secondary uses.
- A card can be a starter in one build but not in another if the supporting engine changes.
- A low-ceiling deck may still be correct if it gains enough consistency and interaction.
- A high-ceiling deck may be incorrect if it loses too often to its own hands.

## 12. Verification Gate

This module cannot be marked VERIFIED until Simeon has reviewed or approved it.

Verification Status:

```text
NEEDS_SIMEON_REVIEW
```

Review Notes:

- Confirm whether these definitions match Simeon's preferred deckbuilding language.
- Confirm whether the module is too broad, too basic, or useful as a first foundation.
- Confirm whether larger-deck discussion should remain here or move fully into ratios/probability.

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
- [ ] Simeon has reviewed or approved the module.

## 14. Sources

```text
Source Name: Simeon Verification
Source Type: SIMEON_VERIFICATION
Tier: Project-specific authority
URL or Reference: Internal YGOBrain review
Format: PROJECT_INTERNAL
Date Checked: Pending
Relevant Claim: Deckbuilding language and framework approval.
Confidence: UNKNOWN until reviewed
Notes: This module is currently a draft and requires Simeon review.
```

## 15. Open Questions

- Should YGOBrain use the term "brick" and "garnet" interchangeably, or distinguish them?
- Should deck size expansion be discussed here, or reserved for `competitive/013_ratios_and_consistency.md`?
- Should "starter-equivalent" become a formal term?

## 16. Change Log

```text
2026-06-02
Status: DRAFTED
Change: Created first draft of deckbuilding principles module.
Reason: Deckbuilding is Simeon's highest-priority YGOBrain use case.
```
