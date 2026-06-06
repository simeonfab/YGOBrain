# 011 Card Roles

Status: VERIFIED
Version: v0.1
Category: competitive
Scope: Standard YGOBrain card role taxonomy for Yu-Gi-Oh TCG Advanced Format deckbuilding analysis
Owner: Admin
Last Updated: 2026-06-02

## 1. Purpose

This module defines the standard card role taxonomy used by YGOBrain when analyzing deck lists.

It exists so the assistant can classify what each card does before recommending cuts, additions, ratio changes, or testing plans.

## 2. Scope

This module covers:

- what a card role is
- why role classification matters before deck changes
- standard YGOBrain role definitions
- how one card can have multiple roles depending on context
- how to create a role table for a submitted deck list

This module does not cover:

- archetype-specific role maps
- exact ratio thresholds
- full probability analysis
- current metagame conclusions
- official rules claims about card legality or effects

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
- templates/module_template.md
- runtime/020_deckbuilding_assistant_context.md
- competitive/010_deckbuilding_principles.md

Related Modules:

- competitive/012_engine_vs_non_engine.md
- competitive/013_ratios_and_consistency.md
- analytics/016_probability_and_consistency.md

## 5. Clarifying Questions

Questions Needed:

- None for this first draft.

Assumptions Used Instead of Asking:

- Admin confirmed "brick" and "garnet" should be separate YGOBrain terms.
- Admin confirmed "starter-equivalent" should become a formal YGOBrain term.
- Admin clarified that a "1.5-card starter" generally means one specific card that requires another card in hand, where the other card can be any card rather than a specific named card.
- Examples should use generic Yu-Gi-Oh language rather than specific archetypes.

## 6. Key Definitions

```text
Term: Card Role
Definition: The practical job a card performs in a specific deck context.
Source Status: Admin Verified
```

```text
Term: Starter
Definition: A card or card combination that can begin the deck's intended line of play.
Source Status: Admin Verified
```

```text
Term: One-Card Starter
Definition: A single card that can begin the deck's intended line without requiring another specific card in hand.
Source Status: Admin Verified
```

```text
Term: 1.5-Card Starter
Definition: One specific card that starts the deck's intended line only when paired with another card in hand, where the other card can be any card rather than a specific named card.
Source Status: Admin Verified
```

```text
Term: Two-Card Starter
Definition: A starting line that requires two cards, usually because neither card starts the intended line alone.
Source Status: Admin Verified
```

```text
Term: Extender
Definition: A card that continues, strengthens, protects, or rebuilds a play after a starter or partial line has begun.
Source Status: Admin Verified
```

```text
Term: Payoff
Definition: A card or outcome that rewards the deck for successfully executing its plan, such as pressure, interruption, follow-up, damage, advantage, or board presence.
Source Status: Admin Verified
```

```text
Term: Engine Requirement
Definition: A card that the engine needs in the deck, graveyard, banished zone, Extra Deck, or hand for lines to function, even if drawing it is not always desirable.
Source Status: Admin Verified
```

```text
Term: Brick
Definition: A card that is weak, dead, or difficult to use in many opening hands.
Source Status: Admin Verified
```

```text
Term: Garnet
Definition: A specific engine requirement that is bad or much worse to draw because the deck usually wants to access it from another location.
Source Status: Admin Verified
```

```text
Term: Non-Engine
Definition: Cards included primarily to interact, defend, break boards, improve matchups, or support the deck without being part of the core engine.
Source Status: Admin Verified
```

```text
Term: Defensive Non-Engine
Definition: Non-engine cards used mainly to prevent, interrupt, or reduce the opponent's progress.
Source Status: Admin Verified
```

```text
Term: Board Breaker
Definition: A card used mainly to answer an established opponent board, especially when going second.
Source Status: Admin Verified
```

```text
Term: Hand Trap
Definition: A card that can usually be used from the hand to interrupt or constrain the opponent during their turn.
Source Status: Admin Verified
```

```text
Term: Floodgate
Definition: A card that restricts what one or both players can do, usually by limiting actions, card types, summons, effects, or zones.
Source Status: Admin Verified
```

```text
Term: Consistency Card
Definition: A card included primarily to improve access to starters, engine pieces, playable hands, or specific role categories.
Source Status: Admin Verified
```

```text
Term: Flex Slot
Definition: A card slot that can change based on metagame, matchup expectations, build preference, or testing results without breaking the deck's core plan.
Source Status: Admin Verified
```

```text
Term: Side Deck Card
Definition: A card used in the side deck to change the deck's matchup plan, going-first plan, going-second plan, or answer profile after game one.
Source Status: Admin Verified
```

```text
Term: Follow-Up Card
Definition: A card that helps continue pressure, rebuild after interruption, or play the next turn after the initial exchange.
Source Status: Admin Verified
```

```text
Term: Starter-Equivalent
Definition: A candidate YGOBrain term for a card or package that does not literally start alone but functionally increases the deck's access to playable opening lines.
Source Status: Admin Verified
```

## 7. Core Rules or Principles

### 7.1 Classify Before Cutting

Do not recommend cutting or adding a card until its role is understood.

A card that looks low-impact in isolation may be important because it is a starter, engine requirement, bridge card, or follow-up card.

Source Status: Admin Verified

### 7.2 A Card Can Have Multiple Roles

Role labels are contextual.

The same card might be:

- a starter in one build
- an extender after another card resolves
- a brick when drawn with no enabler
- a side deck card after game one
- a flex slot in one format but core in another

Source Status: Admin Verified

### 7.3 Starter Quality Matters

Not all starters are equal.

When classifying starters, note whether they are:

- one-card starters
- 1.5-card starters
- two-card starters
- fragile starters
- starters that require a discard
- starters that require a specific card
- starters that lock the deck into a narrow line

Source Status: Admin Verified

### 7.4 Brick and Garnet Should Be Separate Draft Terms

Admin confirmed YGOBrain should separate the terms:

- Brick: broad term for a bad or dead draw.
- Garnet: narrower term for an engine requirement that is especially bad to draw because it is meant to stay in deck or be accessed indirectly.

This distinction is useful because a card can be a brick without being a garnet.

Source Status: Admin Verified

### 7.5 Starter-Equivalent Should Be a Formal Term

"Starter-equivalent" is useful when a card does not start alone but increases the number of playable openers.

Example uses:

- a consistency card that accesses starters
- a bridge card that turns many hands into engine access
- a broad enabler that makes several partial hands playable

Admin confirmed this should become formal YGOBrain terminology.

Source Status: Admin Verified

## 8. Practical Application

When classifying a submitted deck list:

1. Identify the deck's core plan.
2. Mark each card's primary role.
3. Add secondary roles where the card changes function by hand, turn, or matchup.
4. Mark starter type: one-card, 1.5-card, or two-card.
5. Mark engine requirements, bricks, and garnets separately.
6. Separate engine from non-engine.
7. Count role totals.
8. Use those counts to support later ratio and probability analysis.

Role table format:

```text
Card:
Count:
Primary Role:
Secondary Role(s):
Starter Type:
Engine / Non-Engine:
Brick or Garnet Risk:
Going First / Going Second Bias:
Notes:
```

Role counts should connect to later questions such as:

- Does the deck have enough starter access?
- Are there too many payoffs relative to starters?
- Is the deck drawing too many engine requirements?
- Is the non-engine count supporting or weakening the deck plan?
- Which cards should be tested before changing ratios?

## 9. Examples

### Example 1 - Two-Card Starter Mislabelled as Starter

Situation:
- Card A only begins the deck's main line if Card B is also in hand.

Answer:
- Classify Card A as part of a two-card starter package, not as a full one-card starter.

Reasoning:
- Calling Card A a starter by itself would overstate opening hand consistency.

Source Status:
- Admin Verified

### Example 2 - Engine Requirement That Is Bad to Draw

Situation:
- A card is needed in the deck for a combo line but is weak when opened.

Answer:
- Classify it as an engine requirement with garnet risk.

Reasoning:
- It supports the engine's ceiling but can reduce opening hand quality when drawn.

Source Status:
- Admin Verified

### Example 3 - Post-Side Role Change

Situation:
- A card is weak in game one but becomes important after siding for a specific matchup.

Answer:
- Classify it as a side deck card or post-side flex role, not as part of the default main-deck engine.

Reasoning:
- Role classification should account for matchup and side pattern, not just the card's text.

Source Status:
- Admin Verified

## 10. Common Mistakes

- Treating every starter equally.
- Ignoring discard requirements.
- Ignoring specific-card requirements.
- Calling a card a starter when it only starts with another card.
- Overvaluing payoff cards.
- Failing to distinguish engine from non-engine.
- Counting a consistency card as a true starter without explaining what it accesses.
- Cutting an engine requirement because it looks bad in isolation.
- Treating all bad draws as garnets.

## 11. Edge Cases

- A card can be a brick in one hand but an extender in another.
- A card can be bad to draw but still necessary in the deck.
- A card can be starter-equivalent only in certain builds.
- A card can change role post-side.
- A card can be engine in one archetype shell and non-engine in another.
- A payoff can also be follow-up if it remains useful after the first turn.

## 12. Verification Gate

This module is marked VERIFIED because Admin has reviewed and accepted it.

Verification Status:

```text
VERIFIED_BY_ADMIN
```

Review Notes:

- Admin confirmed "brick" and "garnet" should remain separate YGOBrain terms.
- Admin confirmed "starter-equivalent" should become formal terminology.
- Admin clarified that "1.5-card starter" generally means one specific card that needs any other card in hand, rather than a specific named second card.
- Admin confirmed the full card role taxonomy module on 2026-06-02.

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
- [x] Admin has reviewed or approved the module.

## 14. Sources

```text
Source Name: Admin Verification
Source Family: Admin Verification
Source Type: ADMIN_VERIFICATION
Authority Tier: Project-specific authority
URL or Reference: Internal YGOBrain review
Format: PROJECT_INTERNAL
Date Checked: 2026-06-02
Relevant Claim: Card role terminology and taxonomy approval.
Confidence: HIGH for project acceptance
Verification Status: VERIFIED_BY_ADMIN
Approval Status: APPROVED
Approved Scope: Project acceptance, terminology approval, deckbuilding preferences, and final verification decisions.
Approved By: Admin
Notes: Admin reviewed and accepted this card role taxonomy module on 2026-06-02.
```

## 15. Open Questions

- Add verified card role terms to `glossary/010_deckbuilding_terms.md` for glossary review.
- Create `competitive/012_engine_vs_non_engine.md` after Admin has reviewed the glossary surface.

## 16. Change Log

```text
2026-06-02
Status: DRAFTED
Change: Created first draft of card role taxonomy module.
Reason: YGOBrain needs standard role terminology before deeper engine, ratio, and probability modules are created.

2026-06-02
Status: DRAFTED
Change: Recorded Admin terminology decisions for brick/garnet, starter-equivalent, and 1.5-card starter.
Reason: Admin clarified core card-role terminology while keeping the module pending full review.

2026-06-02
Status: VERIFIED
Change: Admin reviewed and accepted the card role taxonomy module.
Reason: Admin confirmed card roles are verified.
```
