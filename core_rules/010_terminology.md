# 010 Terminology

Status: DRAFTED
Version: v0.1
Category: core_rules
Scope: Shared YGOBrain glossary for reusable Yu-Gi-Oh TCG Advanced Format terminology
Owner: Admin
Last Updated: 2026-06-02

## 1. Purpose

This module is the shared YGOBrain glossary surface.

It exists so future deckbuilding, analytics, ruling, testing, and deck overlay modules can use stable terminology instead of redefining common terms in every file.

## 2. Scope

This module covers:

- shared YGOBrain terminology
- verified card-role terms from `competitive/011_card_roles.md`
- source module references for glossary terms
- review status for glossary placement and structure

This module does not cover:

- full official rule explanations
- card-specific rulings
- archetype-specific terminology
- full PSCT analysis
- ratio or probability methodology

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
- competitive/011_card_roles.md

Related Modules:

- competitive/010_deckbuilding_principles.md
- competitive/012_engine_vs_non_engine.md
- competitive/013_ratios_and_consistency.md
- analytics/010_analytics_principles.md

## 5. Clarifying Questions

Questions Needed:

- None for this first glossary surface.

Assumptions Used Instead of Asking:

- `core_rules/010_terminology.md` is the glossary path to review before the next workstream.
- Verified card-role terms can be listed here with their source module noted.
- This glossary remains DRAFTED until Admin reviews the glossary structure and location.

## 6. Key Definitions

### 6.1 Deckbuilding Role Terms

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

## 7. Core Rules or Principles

### 7.1 Glossary Terms Should Point Back to Source Modules

The glossary should not replace source modules.

Each term should identify where the definition came from so future updates can patch the canonical module and then update this glossary.

Source Status: Inferred Not Verified / Needs Admin Review

### 7.2 Verified Terms Can Still Need Better Examples

A term can be accepted while still needing more examples, tests, or archetype-specific applications later.

Source Status: Inferred Not Verified / Needs Admin Review

## 8. Practical Application

Use this file when:

- checking whether a term already exists
- deciding whether a future module needs a new term
- aligning competitive, analytics, and deck overlay language
- preparing runtime context for portable chats

Before creating a new recurring term:

1. Check this glossary.
2. Check the relevant source module.
3. Add the term to the most appropriate canonical module first.
4. Add or update the glossary entry after the module is drafted or verified.

## 9. Examples

### Example 1 - Checking a Deckbuilding Term

Situation:
- A future deck module wants to use "starter-equivalent."

Answer:
- Use the glossary entry and source module `competitive/011_card_roles.md`.

Reasoning:
- The term is already accepted for YGOBrain deckbuilding language.

Source Status:
- VERIFIED_BY_ADMIN from `competitive/011_card_roles.md`

### Example 2 - Adding a New Term

Situation:
- A future module needs a repeated term that is not in this glossary.

Answer:
- Draft the term in the relevant module first, then add it to the glossary with source status.

Reasoning:
- This prevents glossary entries from becoming detached from reviewable source modules.

Source Status:
- Inferred / Needs Review

## 10. Common Mistakes

- Treating the glossary as a replacement for source modules.
- Adding terms without source status.
- Adding terms without a source module.
- Mixing official rules terms with YGOBrain strategic shorthand without labels.
- Treating a draft glossary term as verified.

## 11. Edge Cases

- A term may be verified for YGOBrain strategy but not be an official rules term.
- A term may be useful in deckbuilding but misleading in ruling analysis.
- A term may need separate definitions across competitive, analytics, and rules contexts.

## 12. Verification Gate

This module cannot be marked VERIFIED until Admin has reviewed or approved it.

Verification Status:

```text
NEEDS_ADMIN_REVIEW
```

Review Notes:

- Confirm whether `core_rules/010_terminology.md` is the correct glossary location.
- Confirm whether verified card-role terms should live here or in a dedicated glossary folder.
- Confirm whether future official rules terms should share this glossary or use separate rules modules.

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
Relevant Claim: Glossary structure and term placement approval.
Confidence: UNKNOWN until reviewed
Verification Status: NEEDS_HUMAN_REVIEW
Approval Status: APPROVED
Approved Scope: Project acceptance, terminology approval, deckbuilding preferences, and final verification decisions.
Approved By: Admin
Notes: This glossary module is drafted for Admin review before the next competitive workstream.
```

```text
Source Name: 011 Card Roles
Source Family: Admin Verification
Source Type: PROJECT_MODULE
Authority Tier: Project-specific authority
URL or Reference: competitive/011_card_roles.md
Format: PROJECT_INTERNAL
Date Checked: 2026-06-02
Relevant Claim: Verified card role terminology.
Confidence: HIGH for project acceptance
Verification Status: VERIFIED_BY_ADMIN
Approval Status: APPROVED
Approved Scope: YGOBrain card role taxonomy.
Approved By: Admin
Notes: Card role terms are listed from the verified card role module.
```

## 15. Open Questions

- Should this file remain in `core_rules/`, or should a dedicated `glossary/` folder be created?
- Should official rules terminology and strategic deckbuilding terminology be separated into different glossary sections or files?
- Should glossary entries link to tests once terminology tests exist?

## 16. Change Log

```text
2026-06-02
Status: DRAFTED
Change: Created first glossary surface with verified card-role terms.
Reason: Admin requested glossary visibility before the next workstream.
```
