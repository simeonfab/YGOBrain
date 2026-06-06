# 010 Deckbuilding Terms

Status: DRAFTED
Version: v0.1
Category: glossary
Scope: Glossary surface for strategic deckbuilding terminology used by YGOBrain
Owner: Admin
Last Updated: 2026-06-06

## 1. Purpose

This file is the dedicated glossary surface for strategic deckbuilding terminology.

It exists so competitive modules, deck overlays, analytics notes, and runtime prompts can use stable terms without redefining them every time.

## 2. Scope

This glossary covers:

- strategic deckbuilding shorthand
- verified card-role terms from `competitive/011_card_roles.md`
- source module references for deckbuilding terms
- future links to deckbuilding terminology tests

This glossary does not cover:

- official rules terminology
- card-specific rulings
- archetype-specific terminology
- full ratio or probability methodology

## 3. Default Assumptions

Unless stated otherwise, assume:

- Yu-Gi-Oh TCG Advanced Format
- official cards only
- strategic terms are YGOBrain project terminology unless explicitly marked official
- Admin Verification is project authority for accepted strategic terminology

## 4. Dependencies

Depends On:

- governance/000_system_operating_rules.md
- governance/001_knowledge_architecture.md
- governance/002_source_hierarchy.md
- governance/006_module_creation_and_review_policy.md
- competitive/011_card_roles.md

Related Modules:

- competitive/010_deckbuilding_principles.md
- competitive/012_engine_vs_non_engine.md
- competitive/013_ratios_and_consistency.md

## 5. Key Definitions

```text
Term: Card Role
Definition: The practical job a card performs in a specific deck context.
Source Module: competitive/011_card_roles.md
Source Status: VERIFIED_BY_ADMIN
```

```text
Term: Starter
Definition: A card or card combination that can begin the deck's intended line of play.
Source Module: competitive/011_card_roles.md
Source Status: VERIFIED_BY_ADMIN
```

```text
Term: One-Card Starter
Definition: A single card that can begin the deck's intended line without requiring another specific card in hand.
Source Module: competitive/011_card_roles.md
Source Status: VERIFIED_BY_ADMIN
```

```text
Term: 1.5-Card Starter
Definition: One specific card that starts the deck's intended line only when paired with another card in hand, where the other card can be any card rather than a specific named card.
Source Module: competitive/011_card_roles.md
Source Status: VERIFIED_BY_ADMIN
```

```text
Term: Two-Card Starter
Definition: A starting line that requires two cards, usually because neither card starts the intended line alone.
Source Module: competitive/011_card_roles.md
Source Status: VERIFIED_BY_ADMIN
```

```text
Term: Extender
Definition: A card that continues, strengthens, protects, or rebuilds a play after a starter or partial line has begun.
Source Module: competitive/011_card_roles.md
Source Status: VERIFIED_BY_ADMIN
```

```text
Term: Payoff
Definition: A card or outcome that rewards the deck for successfully executing its plan, such as pressure, interruption, follow-up, damage, advantage, or board presence.
Source Module: competitive/011_card_roles.md
Source Status: VERIFIED_BY_ADMIN
```

```text
Term: Engine Requirement
Definition: A card that the engine needs in the deck, graveyard, banished zone, Extra Deck, or hand for lines to function, even if drawing it is not always desirable.
Source Module: competitive/011_card_roles.md
Source Status: VERIFIED_BY_ADMIN
```

```text
Term: Brick
Definition: A card that is weak, dead, or difficult to use in many opening hands.
Source Module: competitive/011_card_roles.md
Source Status: VERIFIED_BY_ADMIN
```

```text
Term: Garnet
Definition: A specific engine requirement that is bad or much worse to draw because the deck usually wants to access it from another location.
Source Module: competitive/011_card_roles.md
Source Status: VERIFIED_BY_ADMIN
```

```text
Term: Non-Engine
Definition: Cards included primarily to interact, defend, break boards, improve matchups, or support the deck without being part of the core engine.
Source Module: competitive/011_card_roles.md
Source Status: VERIFIED_BY_ADMIN
```

```text
Term: Defensive Non-Engine
Definition: Non-engine cards used mainly to prevent, interrupt, or reduce the opponent's progress.
Source Module: competitive/011_card_roles.md
Source Status: VERIFIED_BY_ADMIN
```

```text
Term: Board Breaker
Definition: A card used mainly to answer an established opponent board, especially when going second.
Source Module: competitive/011_card_roles.md
Source Status: VERIFIED_BY_ADMIN
```

```text
Term: Hand Trap
Definition: A card that can usually be used from the hand to interrupt or constrain the opponent during their turn.
Source Module: competitive/011_card_roles.md
Source Status: VERIFIED_BY_ADMIN
```

```text
Term: Floodgate
Definition: A card that restricts what one or both players can do, usually by limiting actions, card types, summons, effects, or zones.
Source Module: competitive/011_card_roles.md
Source Status: VERIFIED_BY_ADMIN
```

```text
Term: Consistency Card
Definition: A card included primarily to improve access to starters, engine pieces, playable hands, or specific role categories.
Source Module: competitive/011_card_roles.md
Source Status: VERIFIED_BY_ADMIN
```

```text
Term: Flex Slot
Definition: A card slot that can change based on metagame, matchup expectations, build preference, or testing results without breaking the deck's core plan.
Source Module: competitive/011_card_roles.md
Source Status: VERIFIED_BY_ADMIN
```

```text
Term: Side Deck Card
Definition: A card used in the side deck to change the deck's matchup plan, going-first plan, going-second plan, or answer profile after game one.
Source Module: competitive/011_card_roles.md
Source Status: VERIFIED_BY_ADMIN
```

```text
Term: Follow-Up Card
Definition: A card that helps continue pressure, rebuild after interruption, or play the next turn after the initial exchange.
Source Module: competitive/011_card_roles.md
Source Status: VERIFIED_BY_ADMIN
```

```text
Term: Starter-Equivalent
Definition: A card or package that does not literally start alone but functionally increases the deck's access to playable opening lines.
Source Module: competitive/011_card_roles.md
Source Status: VERIFIED_BY_ADMIN
```

## 6. Practical Application

Use this file when:

- checking whether a strategic deckbuilding term already exists
- aligning terminology across competitive modules and deck overlays
- preparing future runtime context
- deciding whether a new deckbuilding term needs Admin review

Before creating a new recurring strategic term:

1. Check this glossary.
2. Check the relevant competitive source module.
3. Draft or update the term in the most appropriate competitive module.
4. Add or update the glossary entry with source status.

## 7. Tests

In YGOBrain, a terminology test means a small validation case in `tests/` that checks whether an assistant uses a term correctly.

Example:

```text
Scenario: A card only starts a line when paired with any other card in hand.
Expected Classification: 1.5-card starter.
Failure Mode: Assistant incorrectly calls it a one-card starter or two-card starter requiring a specific named card.
```

This glossary does not link to tests yet because terminology tests have not been created.

## 8. Verification Gate

This glossary cannot be marked VERIFIED until Admin has reviewed or approved it.

Verification Status:

```text
NEEDS_ADMIN_REVIEW
```

Review Notes:

- Confirm whether this split glossary structure is correct.
- Confirm whether terminology tests should be created in a later small batch.

## 9. Sources

```text
Source Name: 011 Card Roles
Source Family: Admin Verification
Source Type: PROJECT_MODULE
Authority Tier: Project-specific authority
URL or Reference: competitive/011_card_roles.md
Format: PROJECT_INTERNAL
Date Checked: 2026-06-06
Relevant Claim: Verified card role terminology.
Confidence: HIGH for project acceptance
Verification Status: VERIFIED_BY_ADMIN
Approval Status: APPROVED
Approved Scope: YGOBrain card role taxonomy.
Approved By: Admin
Notes: Card role terms are listed from the verified card role module.
```

## 10. Open Questions

- Which terminology tests should be created first after this glossary structure is accepted?
- Should analytics terms get a third glossary file, such as `glossary/020_analytics_terms.md`, after analytics modules are verified?

## 11. Change Log

```text
2026-06-06
Status: DRAFTED
Change: Created separate deckbuilding glossary surface with verified card-role terms.
Reason: Admin requested a dedicated glossary and separation between official rules terminology and strategic deckbuilding terminology.
```
