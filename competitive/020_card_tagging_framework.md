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

## 4. Global vs Contextual Tags

YGOBrain must distinguish global tags from contextual tags.

This distinction is critical because some tags describe what a card factually or mechanically is, while other tags describe what a card does inside a specific deck, archetype, build, matchup, or format.

### 4.1 Global Tags

Global tags can be assigned to the card itself.

They usually include factual tags and mechanical function tags.

Examples:

```text
LIGHT
DARK
Fiend
Spellcaster
search
discard
destroy
special_summon
```

Global tags can support broad search and filtering.

Examples:

```text
Find LIGHT Fiend cards.
Find cards that discard.
Find cards that special summon.
Find cards that destroy monsters.
```

Global tags are still subject to source and confidence rules. A factual tag should come from card facts in the local card database. A mechanical function tag may be proposed by card text search but may still need review if wording or practical use is ambiguous.

### 4.2 Contextual Tags

Contextual tags should not be treated as always true for the card.

They must include context metadata.

They usually include role tags, risk tags, and strategic synergy tags.

Examples:

```text
starter
extender
payoff
engine_requirement
brick
garnet
engine_bridge
bad_in_multiples
poor_going_first
poor_going_second
conflicts_with_engine
```

Contextual tags should usually be attached to one of:

```text
deck
archetype
build
matchup
format
side-deck context
```

YGOBrain should not say:

```text
This card is a starter.
```

unless the statement is explicitly scoped.

Prefer:

```text
This card is a starter in [deck/build/context].
This card is a candidate starter for [deck/build/context].
This card has function tags that may make it starter-relevant.
```

### 4.3 Mixed Synergy Tags

Some synergy tags are factual/global. Others are strategic/contextual.

Examples:

```text
LIGHT
- Factual/global when it comes from the card's Attribute.

Fiend
- Factual/global when it comes from the card's race/type.

Spellcaster
- Factual/global when it comes from the card's race/type.

GY_focused
- Usually strategic/contextual unless defined by a specific mechanical rule.

engine_bridge
- Strategic/contextual. It only makes sense when the connected engines are named.
```

### 4.4 Database Implication

The local card database should separate global tags from contextual tags.

Suggested structure:

```text
card_global_tags:
- card_id
- tag
- tag_family
- source
- confidence
- verification_status

card_contextual_tags:
- card_id
- tag
- tag_family
- context_type
- context_name
- deck_file
- source
- confidence
- verification_status
- notes
```

### 4.5 Recommendation Implication

When recommending cards, use global tags to find candidates, then assign contextual role and risk tags only after evaluating the specific deck plan.

Example:

A card may globally have:

```text
discard
special_summon
LIGHT
Fiend
```

But only contextually have:

```text
extender in White Forest Fiend build
brick risk in low-discard builds
engine_bridge in builds using X and Y engines
```

## 5. Role Tags

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

Role tags are usually contextual and should normally be deck-specific, archetype-specific, build-specific, or format-specific.

## 6. Function Tags

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

Function tags may often be global because they describe what the card text mechanically does.

Function tags may be proposed by database text search, but trusted assignment requires review where wording, timing, cost/effect distinction, or practical use is ambiguous.

## 7. Risk Tags

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

Risk tags are usually contextual. A card can be risky in one deck and excellent in another.

## 8. Synergy Tags

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
- Factual/global when it comes from the card's Attribute. Contextual when describing why a deck values LIGHT cards.

Fiend
- Factual/global when it comes from the card's race/type. Contextual when describing why a deck values Fiend cards.

GY_focused
- Usually strategic/contextual. Relevant when a card loads, uses, revives, banishes from, or gains value from the graveyard in a meaningful deck context.

engine_bridge
- Strategic/contextual. The connected engines must be named.
```

Some synergy tags come directly from card facts, such as LIGHT or Fiend. Others require strategic interpretation, such as engine_bridge or GY_focused.

## 9. How Tags Should Be Assigned

Use this workflow:

1. Retrieve exact card facts from the local card database.
2. Identify candidate global tags from factual fields and mechanical text search.
3. Identify candidate contextual tags from known deck, archetype, build, matchup, or format context.
4. Separate database-derived tags from strategic interpretation tags.
5. Separate global tags from contextual tags.
6. For contextual tags, assign context type and context name.
7. Assign confidence.
8. Record source and reasoning.
9. Mark Admin verification status.
10. Use tags for discovery or recommendation only within their approved context.

Do not assign trusted strategic tags from model memory alone.

## 10. Context Scope

Every strategic tag should have a context.

Use:

```text
global
- broadly true across decks and formats; usually factual or mechanical

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

Role and risk tags should generally not use `global` unless Admin explicitly verifies that the global scope is valid and not misleading.

## 11. Confidence Model

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

## 12. Admin Verification

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

## 13. Card Discovery Examples

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

Tag interpretation:

```text
LIGHT and Fiend are global/factual tags.
extender is contextual and must be scoped to a deck, archetype, build, or format.
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

Tag interpretation:

```text
discard may be global/mechanical.
discard_outlet may require review if usefulness depends on deck context.
bad_in_multiples is contextual.
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

Tag interpretation:

```text
search may be global/mechanical.
starter and starter subtype tags are contextual.
engine_bridge is contextual.
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

## 14. Failure Modes to Avoid

Avoid:

- treating database-derived text matches as verified strategic tags
- assigning global tags where the tag is deck-specific or build-specific
- tagging a card as starter without defining the deck/build/context
- saying "this card is a starter" without scope when the correct statement is contextual
- treating risk tags such as brick, garnet, bad_in_multiples, poor_going_first, or poor_going_second as globally true without context
- treating strategic synergy tags such as engine_bridge as globally true
- ignoring risk tags when recommending cards
- treating LOW confidence tags as established facts
- using tags without retrieving card facts
- using model memory to tag cards without database support
- letting tags override official rulings or legality

## 15. Relationship to Database Schema

The local card database should store raw facts separately from strategic tags.

Recommended separation:

```text
card_facts
- imported, database-backed fields

card_global_tags
- factual or mechanical tags that can be attached to the card itself

card_contextual_tags
- role, risk, and strategic synergy tags scoped to a deck, archetype, build, matchup, or format

card_tag_reviews
- Admin verification, review notes, confidence, source, date
```

Suggested contextual tag fields:

```text
card_id
tag
tag_family
context_type
context_name
deck_file
source
confidence
verification_status
notes
```

This module defines the strategic tagging logic, not physical implementation.

## 16. Change Log

```text
2026-06-06
Status: DRAFTED
Change: Created card tagging framework.
Reason: Admin requested a framework that lets AI discover cards by function rather than only by name.

2026-06-06
Status: DRAFTED
Change: Added global vs contextual tag rules.
Reason: Admin clarified that function and factual synergy tags can often be global, while role/risk/strategic synergy tags usually need explicit deck, archetype, build, matchup, or format context.
```
