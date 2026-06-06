# 010 Card Database Schema

Status: DRAFTED
Version: v0.1
Category: governance
Scope: Architecture for the local YGOBrain card knowledge database schema
Owner: Admin
Last Updated: 2026-06-06
Applies To: Local card database design, card lookup, fuzzy lookup, card discovery, card recommendations, analytics
Task Modes: deckbuilding, analytics, ruling, system-building
Keywords: card database, schema, local database, card facts, strategic tags, confidence, source, admin verified, fuzzy lookup
Depends On:
- governance/009_card_knowledge_architecture.md
- runtime/070_card_lookup_context.md
- runtime/080_card_recommendation_context.md
- sources/000_source_index.md
- sources/001_approved_source_families.md
Source Tier: Project governance
Verification Status: NEEDS_ADMIN_REVIEW
Retrieval Priority: HIGH
Related Modules:
- governance/008_retrieval_architecture.md
- runtime/090_retrieval_manifest.md

## 1. Purpose

This file defines the architecture for YGOBrain's local card knowledge database.

The database should support:

- exact card lookup
- fuzzy card lookup
- deckbuilding recommendations
- card discovery
- analytics

This is architecture only. It does not define implementation code.

## 2. Core Principle

Card facts and YGOBrain strategic interpretation must be separated.

```text
Card facts come from the local card database.
Strategic tags come from YGOBrain reasoning and review.
Rulings remain separate and must not be inferred from database fields alone.
```

## 3. Data Layers

The schema should separate three layers:

### 3.1 Card Facts Layer

Source:

- local card database populated from approved card database/API sources

Purpose:

- store factual card information
- support exact lookup
- support fuzzy lookup
- support card search and filtering
- support analytics joins

### 3.2 YGOBrain Strategic Layer

Source:

- YGOBrain markdown modules
- deck-specific analysis
- Admin-reviewed strategic tagging
- testing or analytics outputs where applicable

Purpose:

- classify how a card functions strategically
- support deckbuilding recommendations
- support discovery queries such as "find discard outlets" or "find starter candidates"

### 3.3 Review and Metadata Layer

Source:

- Admin review
- approved source references
- update scripts or import metadata
- confidence scoring

Purpose:

- identify source, confidence, freshness, and review status
- prevent unreviewed strategic tags from becoming trusted silently

## 4. Core Card Fact Fields

These fields should come from the local card database or its approved upstream source.

```text
card_id
- Stable local or upstream identifier.
- Source: Database.
- Human Review: Not usually required unless identifier conflict occurs.

card_name
- Official card name.
- Source: Database.
- Human Review: Not usually required.

card_text
- Current available card text/effect text.
- Source: Database / official source where available.
- Human Review: Required for wording-sensitive rulings or suspected stale text.

card_type
- Full card type description where available.
- Source: Database.
- Human Review: Not usually required.

primary_card_category
- Monster / Spell / Trap.
- Source: Database-derived.
- Human Review: Not usually required.

monster_type_or_subtype
- Normal, Effect, Fusion, Synchro, Xyz, Link, Ritual, Pendulum, Tuner, etc. where applicable.
- Source: Database.
- Human Review: Not usually required.

spell_trap_subtype
- Normal, Quick-Play, Continuous, Field, Equip, Counter, etc. where applicable.
- Source: Database.
- Human Review: Not usually required.

attribute
- Monster attribute where applicable.
- Source: Database.
- Human Review: Not usually required.

race
- Monster race/type such as Warrior, Fiend, Dragon, etc. where applicable.
- Source: Database.
- Human Review: Not usually required.

level_rank_link
- Level, Rank, or Link Rating where applicable.
- Source: Database.
- Human Review: Not usually required.

atk
- ATK value where applicable.
- Source: Database.
- Human Review: Not usually required.

def
- DEF value where applicable.
- Source: Database.
- Human Review: Not usually required.

link_arrows
- Link arrows where applicable.
- Source: Database where available.
- Human Review: Not usually required unless missing or malformed.

pendulum_scale
- Pendulum scale where applicable.
- Source: Database where available.
- Human Review: Not usually required.

archetype
- Archetype or series tags where available.
- Source: Database-derived and/or YGOResources/YGO database metadata.
- Human Review: Sometimes required because archetype membership can be ambiguous or strategically broader than official string matching.

set_information
- Set codes, set names, rarities, print data where available.
- Source: Database.
- Human Review: Not usually required unless analytics depends on release/print history.

release_information
- Release date, region, product, or availability metadata where available.
- Source: Database.
- Human Review: Required if used for time-sensitive legality or format-history analysis.

legality
- Format legality where available.
- Source: Database / official legality source.
- Human Review: Required when time-sensitive or when conflict exists.

banlist_status
- Forbidden, Limited, Semi-Limited, Unlimited where applicable.
- Source: Official TCG banlist or approved database source.
- Human Review: Required for current competitive deckbuilding if cache freshness is uncertain.
```

## 5. YGOBrain Strategic Tag Fields

These fields come from YGOBrain analysis, not raw card database facts.

Strategic tags should be context-aware. A card may be a starter in one deck and not in another.

Recommended model:

```text
strategic_tags_global
- General tags that are broadly true across many decks.

strategic_tags_deck_specific
- Tags that apply only within a named deck, archetype, build, or format context.
```

Strategic tag options:

```text
starter
one_card_starter
one_point_five_card_starter
two_card_starter
extender
payoff
engine_requirement
brick
garnet
searcher
discard_outlet
board_breaker
hand_trap
floodgate
follow_up
consistency_card
```

Field guidance:

```text
starter
- Means the card can begin meaningful engine progress in a defined context.
- Source: YGOBrain strategic analysis.
- Human Review: Required before trusted use.

one_card_starter
- Starts a line by itself without needing another card in hand beyond normal game assumptions.
- Source: YGOBrain strategic analysis.
- Human Review: Required.

one_point_five_card_starter
- Starts only with a generic additional resource, such as any discard.
- Source: YGOBrain strategic analysis.
- Human Review: Required.

two_card_starter
- Requires a specific or defined category of paired card.
- Source: YGOBrain strategic analysis.
- Human Review: Required.

extender
- Continues or strengthens play after a starter or partial line.
- Source: YGOBrain strategic analysis.
- Human Review: Required.

payoff
- Card that rewards engine progression or converts resources into advantage, board state, disruption, or win pressure.
- Source: YGOBrain strategic analysis.
- Human Review: Required.

engine_requirement
- Card required by the engine or combo structure but not necessarily desirable to draw.
- Source: YGOBrain strategic analysis.
- Human Review: Required.

brick
- Broad tag for a card or hand-state contributor that is dead, weak, or non-functional in many contexts.
- Source: YGOBrain strategic analysis.
- Human Review: Required.

garnet
- Specific required card that is bad to draw but needed in deck for another card or line to function.
- Source: YGOBrain strategic analysis.
- Human Review: Required.

searcher
- Card that accesses another card or category of cards.
- Source: Database text search may propose; YGOBrain review should confirm strategic meaning.
- Human Review: Required for trusted strategic tag.

discard_outlet
- Card that can discard, send, or convert cards from hand in a useful way.
- Source: Database text search may propose; YGOBrain review should confirm cost/effect and usefulness.
- Human Review: Required.

board_breaker
- Card used primarily to break established opponent boards.
- Source: YGOBrain strategic analysis.
- Human Review: Required.

hand_trap
- Card that can interact from hand during opponent's turn or under relevant conditions.
- Source: Database text search may propose; YGOBrain review should confirm practical classification.
- Human Review: Required.

floodgate
- Card that restricts actions, mechanics, summons, effects, attacks, or game states broadly.
- Source: YGOBrain strategic analysis.
- Human Review: Required.

follow_up
- Card that provides continuation or next-turn pressure after initial play.
- Source: YGOBrain strategic analysis.
- Human Review: Required.

consistency_card
- Card that improves access, filtering, draw, search, or hand quality.
- Source: YGOBrain strategic analysis.
- Human Review: Required.
```

## 6. Review and Metadata Fields

These fields track confidence, source, freshness, and verification.

```text
confidence
- HIGH / MEDIUM / LOW / UNKNOWN.
- Applies to strategic tags or derived metadata.
- Source: YGOBrain review process.
- Human Review: Required for HIGH.

source
- Where the field or tag came from.
- Examples: local database, YGOResources API, official source, YGOBrain module, Admin review, test result, analytics result.
- Human Review: Required where source is ambiguous.

last_reviewed
- Date the field/tag was last reviewed.
- Source: YGOBrain process metadata.
- Human Review: Required for Admin-reviewed strategic tags.

admin_verified
- Boolean or status value showing whether Admin accepted the field/tag.
- Source: Admin review.
- Human Review: Required by definition.

review_notes
- Optional notes explaining uncertainty, deck context, or reason for tag.
- Source: YGOBrain review process.
- Human Review: Required when tag is non-obvious or disputed.

applicable_context
- Defines where the strategic tag applies.
- Examples: global, deck-specific, archetype-specific, format-specific, build-specific.
- Source: YGOBrain strategic analysis.
- Human Review: Required.

retrieved_from
- Upstream source/API/cache used for database facts.
- Source: importer/update process.
- Human Review: Not usually required.

cache_revision
- Cache revision, API revision, or import batch identifier.
- Source: importer/update process.
- Human Review: Not usually required.

last_imported
- Date the database fact was last imported or updated.
- Source: importer/update process.
- Human Review: Not usually required.
```

## 7. Field Source Classification

### 7.1 Fields From Database

These should come from local card database/upstream source:

```text
card_id
card_name
card_text
card_type
primary_card_category
monster_type_or_subtype
spell_trap_subtype
attribute
race
level_rank_link
atk
def
link_arrows
pendulum_scale
set_information
release_information
legality
banlist_status
retrieved_from
cache_revision
last_imported
```

### 7.2 Fields From YGOBrain

These should come from YGOBrain strategic reasoning, analytics, deck overlays, or Admin review:

```text
strategic_tags_global
strategic_tags_deck_specific
starter
one_card_starter
one_point_five_card_starter
two_card_starter
extender
payoff
engine_requirement
brick
garnet
searcher
discard_outlet
board_breaker
hand_trap
floodgate
follow_up
consistency_card
confidence
source
last_reviewed
admin_verified
review_notes
applicable_context
```

### 7.3 Hybrid or Review-Sensitive Fields

These may be proposed by database-derived data but require YGOBrain or Admin review for strategic use:

```text
archetype
searcher
discard_outlet
hand_trap
floodgate
consistency_card
legality
banlist_status
release_information
```

## 8. Human Review Requirements

Human review is required for:

- all trusted strategic tags
- HIGH confidence strategic classifications
- admin_verified fields
- disputed or ambiguous archetype tags
- deck-specific role classifications
- card recommendation logic
- legality or banlist status if cache freshness is uncertain
- ruling-sensitive interpretations of card text

Human review is not usually required for basic imported card facts unless there is conflict, ambiguity, or suspected stale data.

## 9. Lookup and Discovery Support

The schema should support:

```text
Exact lookup
- by official card name
- by card ID
- by known alias where available

Fuzzy lookup
- partial name
- common typo
- alternate punctuation
- approximate search

Text search
- effect text contains phrase
- cost/effect wording search
- search for words like discard, add, send, target, negate, destroy

Filter search
- monster/spell/trap
- attribute
- race
- level/rank/link
- archetype
- legality
- banlist status

Strategic discovery
- find starters in a deck/archetype context
- find discard outlets
- find board breakers
- find hand traps
- find consistency cards
- find likely bricks/garnets
```

## 10. Analytics Support

The schema should support analytics by allowing joins between:

- card facts
- deck lists
- strategic tags
- archetypes
- events
- banlist status
- card frequency
- matchup data
- testing logs

Analytics should distinguish:

```text
raw card facts
strategic classification
observed deck usage
recommendation/inference
```

## 11. Ruling Boundary

The card database may provide exact card text, but it is not by itself a ruling engine.

Ruling answers may require:

- official rulings
- official rulebook or policy
- approved Q&A/ruling sources
- PSCT modules
- timing/chain modules
- source hierarchy checks

Do not treat database facts as sufficient for ruling certainty when the question depends on interpretation.

## 12. Future Implementation Notes

Future implementation should define:

- physical storage format
- import/update script
- query API
- cache/update mechanism
- fuzzy search approach
- strategic tag storage model
- Admin review workflow
- analytics join model

This document intentionally does not include implementation code.

## 13. Change Log

```text
2026-06-06
Status: DRAFTED
Change: Created local card database schema architecture.
Reason: Admin requested architecture for exact lookup, fuzzy lookup, deckbuilding recommendations, card discovery, and analytics without implementation code.
```
