# 020 Card Tagging Framework

Status: DRAFTED
Version: v0.1
Category: competitive
Scope: Strategic tagging framework for discovering and evaluating cards by function
Owner: Admin
Last Updated: 2026-06-06
Applies To: Card discovery, deckbuilding recommendations, analytics, local card database strategic overlays
Task Modes: deckbuilding, analytics
Keywords: card tags, role tags, function tags, synergy tags, risk tags, card discovery, recommendations, confidence, admin verification
Depends On:
- governance/009_card_knowledge_architecture.md
- governance/010_card_database_schema.md
- runtime/070_card_lookup_context.md
- runtime/080_card_recommendation_context.md
- competitive/011_card_roles.md
Source Tier: Strategic Framework / Assistant Draft
Verification Status: NEEDS_ADMIN_REVIEW
Retrieval Priority: HIGH
Related Modules:
- templates/card_tag_template.md
- competitive/010_deckbuilding_principles.md
- competitive/012_engine_vs_non_engine.md
- analytics/010_analytics_principles.md

## 1. Purpose

This module defines how YGOBrain should tag cards strategically so the assistant can discover cards by function rather than only by name.

Example discovery tasks:

- find LIGHT Fiend extenders
- find discard outlets
- find cards that convert bricks into value
- find searchable starters
- find board breakers
- find engine bridges

This framework supports card discovery, recommendations, analytics, and future local card database overlays.

## 2. Core Principle

Card tags are strategic interpretation layered on top of card facts.

Card facts come from the local card database.

Strategic tags come from YGOBrain reasoning, testing, analytics, and Admin review.

A tag should not be trusted just because an AI inferred it from card text.

## 3. Tag Families

YGOBrain should organise card tags into four families:

```text
Role tags
Function tags
Synergy tags
Risk tags
```

A single card can have many tags across multiple families.

## 4. Role Tags

Role tags describe what the card does in a deck plan.

Common role tags:

```text
starter
one_card_starter
one_point_five_card_starter
two_card_starter
extender
payoff
engine_requirement
searcher
board_breaker
hand_trap
floodgate
follow_up
consistency_card
side_deck_card
flex_slot
```

Examples:

```text
starter
- Begins meaningful engine progress in a defined deck context.

extender
- Continues or strengthens play after a starter or partial line.

payoff
- Converts engine progress into advantage, disruption, board presence, or win pressure.
```

Role tags are usually context-dependent and should often be deck-specific.

## 5. Function Tags

Function tags describe the mechanical action or utility the card provides.

Common function tags:

```text
search
add_from_deck
special_summon
normal_summon_enabler
send_to_graveyard
mill
discard
discard_outlet
draw
filter
banish
return_to_hand
return_to_deck
destroy
negate
tribute
protect
recover
revive
token_generate
extra_deck_access
spell_trap_removal
monster_removal
```

Examples:

```text
search
- The card can access another card or defined card category.

discard
- The card discards as cost or effect.

discard_outlet
- The card lets the deck convert cards in hand into value, graveyard setup, or engine progression.

mill
- The card sends cards from deck to graveyard or otherwise loads graveyard resources.
```

Function tags may be proposed by database text search, but trusted assignment requires review.

## 6. Risk Tags

Risk tags describe how a card can harm hand quality, sequencing, or deck performance.

Common risk tags:

```text
brick
garnet
situational
win_more
low_ceiling
low_floor
requires_discard
requires_specific_pair
requires_normal_summon
hard_once_per_turn_overlap
conflicts_with_engine
poor_going_first
poor_going_second
bad_in_multiples
format_dependent
side_only
```

Examples:

```text
brick
- Broad tag for a card or hand-state contributor that is dead, weak, or non-functional in many contexts.

garnet
- Specific required card that is bad to draw but needed in deck for another card or line to function.

situational
- Card is powerful only under narrow board, matchup, timing, or hand conditions.
```

Risk tags should be used carefully. A card can be risky in one deck and excellent in another.

## 7. Synergy Tags

Synergy tags describe what the card works with or supports.

Common synergy tags:

```text
LIGHT
DARK
Fiend
Spellcaster
Warrior
Dragon
GY_focused
banish_focused
discard_synergy
spell_trap_synergy
normal_summon_synergy
extra_deck_synergy
fusion_synergy
synchro_synergy
xyz_synergy
link_synergy
ritual_synergy
field_spell_synergy
equip_synergy
continuous_spell_synergy
trap_synergy
archetype_specific
engine_bridge
```

Examples:

```text
LIGHT
- Relevant when a deck searches, summons, discards, or benefits from LIGHT cards.

Fiend
- Relevant when a deck has Fiend-specific searchers, summons, restrictions, or payoffs.

GY_focused
- Relevant when a card loads, uses, revives, banishes from, or gains value from the graveyard.

engine_bridge
- Card connects two engines or lets one engine access another.
```

Some synergy tags come directly from card facts, such as LIGHT or Fiend. Others require strategic interpretation, such as engine_bridge or GY_focused.

## 8. How Tags Should Be Assigned

Use this workflow:

1. Retrieve exact card facts from the local card database.
2. Identify candidate tags from card facts, text search, and known deck context.
3. Separate database-derived tags from strategic interpretation tags.
4. Assign context: global, archetype-specific, deck-specific, format-specific, or build-specific.
5. Assign confidence.
6. Record source and reasoning.
7. Mark Admin verification status.
8. Use tags for discovery or recommendation only within their approved context.

Do not assign trusted strategic tags from model memory alone.

## 9. Context Scope

Every strategic tag should have a context.

Use:

```text
global
- broadly true across decks and formats

archetype_specific
- applies to a named archetype

deck_specific
- applies to a named deck or deck file

build_specific
- applies only to a build variant

format_specific
- applies because of current format, banlist, or metagame

side_context
- applies mainly before or after side decking
```

## 10. Confidence Model

Use confidence values:

```text
HIGH
MEDIUM
LOW
UNKNOWN
```

Guidance:

```text
HIGH
- Admin verified, strongly source-backed, or repeatedly validated by testing/analytics.

MEDIUM
- Strongly supported by card facts and YGOBrain framework, but not yet fully verified.

LOW
- Plausible but untested or weakly supported.

UNKNOWN
- Candidate tag only. Needs review.
```

Only Admin review or a clearly delegated validation process should move a strategic tag to HIGH confidence.

## 11. Admin Verification

Admin verification should answer:

```text
Is this tag correct?
Is this tag useful?
Is the context scope right?
Is the confidence level right?
Should it be global, deck-specific, or build-specific?
Does it create misleading recommendations?
```

Verification statuses:

```text
NEEDS_ADMIN_REVIEW
ADMIN_VERIFIED
REJECTED
SUPERSEDED
LIMITED_USE
```

Unverified tags can be used for exploration but must be labelled as unverified.

## 12. Card Discovery Examples

### Example 1 - LIGHT Fiend Extenders

Search logic:

```text
Database filters:
- Attribute = LIGHT
- Race = Fiend

Strategic tags:
- extender

Optional filters:
- special_summon
- discard_synergy
- GY_focused
```

### Example 2 - Discard Outlets

Search logic:

```text
Database text search:
- discard

Function tags:
- discard
- discard_outlet

Risk checks:
- requires_discard
- bad_in_multiples
```

### Example 3 - Convert Bricks Into Value

Search logic:

```text
Function tags:
- discard_outlet
- filter
- send_to_graveyard
- draw

Synergy tags:
- GY_focused
- discard_synergy

Risk tags:
- requires_discard
```

### Example 4 - Searchable Starters

Search logic:

```text
Role tags:
- starter
- one_card_starter
- one_point_five_card_starter

Function tags:
- search

Synergy tags:
- archetype_specific
- engine_bridge
```

### Example 5 - Engine Bridges

Search logic:

```text
Synergy tags:
- engine_bridge

Function tags:
- search
- send_to_graveyard
- special_summon
- discard_outlet

Context:
- deck_specific or build_specific
```

## 13. Failure Modes to Avoid

Avoid:

- treating database-derived text matches as verified strategic tags
- assigning global tags where the tag is deck-specific
- tagging a card as starter without defining the context
- ignoring risk tags when recommending cards
- treating LOW confidence tags as established facts
- using tags without retrieving card facts
- using model memory to tag cards without database support
- letting tags override official rulings or legality

## 14. Relationship to Database Schema

The local card database should store raw facts separately from strategic tags.

Recommended separation:

```text
card_facts
- imported, database-backed fields

card_tags
- YGOBrain strategic tags and metadata

card_tag_reviews
- Admin verification, review notes, confidence, source, date
```

This module defines the strategic tagging logic, not physical implementation.

## 15. Change Log

```text
2026-06-06
Status: DRAFTED
Change: Created card tagging framework.
Reason: Admin requested a framework that lets AI discover cards by function rather than only by name.
```
