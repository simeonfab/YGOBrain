# 002 Supabase Card Database Phase 1 Spec

Status: DRAFTED
Version: v0.1
Category: planning
Scope: Phase 1 backend specification for the ResolveYGO Supabase card database foundation
Owner: Admin
Last Updated: 2026-06-19
Applies To: Supabase card database, card fact storage, exact lookup, fuzzy lookup, text search, metadata search, source/freshness tracking, MVP backend readiness
Task Modes: system-building
Keywords: Supabase, card database, card facts, lookup, fuzzy lookup, banlist, legality, YGOResources, backend phase 1
Depends On:
- planning/000_current_focus_and_todos.md
- decisions/000_decision_index.md
- decisions/ADR-002_card_data_layer.md
- decisions/ADR-003_supabase_primary_database.md
- features/000_feature_registry.md
- governance/009_card_knowledge_architecture.md
- governance/010_card_database_schema.md
- governance/013_card_enrichment_architecture.md
- governance/014_card_enrichment_schema.md
- sources/001_approved_source_families.md
Source Tier: Project planning
Verification Status: NEEDS_ADMIN_REVIEW
Retrieval Priority: HIGH
Related Modules:
- runtime/070_card_lookup_context.md
- runtime/080_card_recommendation_context.md
- tests/001_card_eval_plan.md

## 1. Purpose

This file defines the Phase 1 backend scope for the ResolveYGO Supabase card database foundation.

It turns the existing card-data architecture into an implementation-ready planning specification, without authorising implementation by itself.

Phase 1 should create the minimum backend card-data foundation needed for ResolveYGO MVP:

```text
Import card facts
-> store them in Supabase
-> retrieve exact card records
-> support fuzzy card lookup
-> support basic text and metadata search
-> expose source, freshness, and verification metadata
-> avoid answering card facts from AI memory
```

## 2. Status And Guardrail

Status: DRAFTED.

This specification does not approve implementation.

Implementation requires a separate Admin approval gate and a scoped Implementation Engineer task.

Implementation Engineer must not create tickets, broaden scope, or start unrelated backend/frontend work from this file.

## 3. Decision Coverage

This specification sits under existing accepted decisions:

```text
ADR-002 Card Data Layer
- Card facts, enrichment sources, and strategic reasoning must remain separate.

ADR-003 Supabase Primary Database
- Supabase is the primary database for app data, card data, analytics data, and future implementation work unless a specific tool is clearly better for a narrow need.
```

No new ADR is required unless Phase 1 changes the database provider, changes the source hierarchy, changes the card-data layer boundaries, or introduces a new durable architectural pattern.

## 4. Phase 1 Objective

Phase 1 should provide local-first card fact storage and lookup.

Phase 1 should support:

1. importing factual card records from an approved source family;
2. storing factual card records in Supabase;
3. exact card lookup;
4. fuzzy card lookup;
5. basic card text search;
6. basic metadata search;
7. source and freshness visibility;
8. safe missing-data behaviour;
9. backend validation checks.

Phase 1 should not build product UI, decklist workflows, recommendations, full rulings, or full legality automation.

## 5. Approved Source Assumption

Initial Phase 1 planning assumes use of approved YGOResources / YGOResources-compatible card data for card facts where available.

The approved source-family rule remains in force:

- use approved source families only;
- do not promote new recurring data sources without Admin approval;
- cache locally where practical;
- avoid unnecessary full re-downloads where revision or manifest checks are possible;
- preserve source and freshness metadata.

## 6. Core Data Principle

Card facts, enrichment, and strategic reasoning are separate layers.

```text
Card facts
- Stored in Supabase Phase 1 tables.
- Used for exact lookup, fuzzy lookup, text search, and metadata search.

Card enrichment
- Stored separately later for data not reliably included in the local card facts source.
- Examples: rulings, Q&A, confirmed legality, banlist source details, release metadata if unavailable locally.

Strategic reasoning
- Stored or derived separately from YGOBrain modules, Admin review, deck overlays, analytics, and testing.
- Examples: starter, extender, payoff, brick, board breaker, hand trap, deck-specific role tags.
```

The card facts table may include fields such as banlist status and legality status because those are core competitive facts. However, they must remain nullable or untrusted until populated from an approved and freshness-aware source.

## 7. Phase 1 Tables

### 7.1 `cards`

Purpose: store core card facts and current known competitive status fields.

Minimum fields:

```text
id
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
archetype
banlist_status
banlist_source_family
banlist_source_reference
banlist_effective_date
banlist_last_checked_at
legality_status
legality_source_family
legality_source_reference
legality_last_checked_at
raw_payload
source_family
source_reference
cache_revision
last_imported_at
created_at
updated_at
```

Field notes:

```text
card_id
- Stable upstream or local card identifier.

card_name
- Official card name from the local card fact source.

card_text
- Current available card/effect text from the local card fact source where available.

card_type / category / metadata fields
- Stored for structured lookup and filtering.

banlist_status
- Core competitive field.
- Nullable in Phase 1 if the initial card fact source does not include reliable banlist data.
- Must not be treated as current unless source and freshness fields are populated.
- Suggested values: FORBIDDEN, LIMITED, SEMI_LIMITED, UNLIMITED, UNKNOWN, NOT_APPLICABLE.

banlist_source_family / banlist_source_reference / banlist_effective_date / banlist_last_checked_at
- Required before banlist_status can be treated as source-backed current information.

legality_status
- Core competitive field.
- Nullable in Phase 1 if the initial card fact source does not include reliable legality data.
- Must not be treated as current unless source and freshness fields are populated.
- Suggested values: LEGAL, ILLEGAL, NOT_RELEASED, UNKNOWN, NOT_APPLICABLE.

legality_source_family / legality_source_reference / legality_last_checked_at
- Required before legality_status can be treated as source-backed current information.

raw_payload
- Raw or minimally transformed imported source record where useful for debugging and audit.

source_family / source_reference / cache_revision / last_imported_at
- Required import provenance and freshness fields for local card facts.
```

Rationale for including `banlist_status` in Phase 1:

- Banlist status is a core competitive card fact for deckbuilding.
- ResolveYGO should have a stable schema location for it from the beginning.
- The field can exist before the system can populate it confidently.
- The safety issue is not the field existing; the safety issue is treating an empty, stale, or unsourced value as authoritative.
- Therefore Phase 1 should include the field but require source/freshness metadata before using it in trusted answers.

### 7.2 `card_names`

Purpose: support aliases, alternate names, localised names, shorthand, corrected names, and fuzzy lookup.

Minimum fields:

```text
id
card_id
name
normalised_name
name_type
language
source_family
source_reference
confidence
created_at
updated_at
```

Suggested `name_type` values:

```text
official
alias
localisation
shorthand
corrected_typo
admin_added
```

Rules:

- official names should come from approved source data;
- aliases and shorthand should be clearly labelled;
- user/Admin-added shorthand must not override official names;
- fuzzy lookup should return candidates rather than silently guessing when confidence is low or ambiguity exists.

### 7.3 `card_import_batches`

Purpose: record import provenance, freshness, counts, and failure information.

Minimum fields:

```text
id
source_family
source_reference
source_revision
import_started_at
import_completed_at
cards_imported
cards_updated
cards_failed
status
notes
created_at
```

Suggested `status` values:

```text
success
partial
failed
```

### 7.4 `card_lookup_audit`

Purpose: optional but recommended for testing lookup quality and debugging fuzzy matches.

Minimum fields:

```text
id
query
normalised_query
matched_card_id
match_type
candidate_count
confidence
created_at
```

Suggested `match_type` values:

```text
exact
fuzzy
ambiguous
not_found
```

This table may be deferred if Phase 1 needs to remain smaller, but fuzzy lookup validation will be easier if it exists.

## 8. Lookup Requirements

### 8.1 Exact Lookup

Required capability:

```text
Input: exact or normalised official card name
Output: single card record, if one clear match exists
```

Acceptance criteria:

- exact official names resolve;
- case differences do not prevent lookup;
- punctuation normalisation is handled where practical;
- multiple possible records return an ambiguity result rather than a guessed answer;
- response includes source and freshness metadata.

### 8.2 Fuzzy Lookup

Required capability:

```text
Input: typo, partial name, shorthand, or approximate card name
Output: high-confidence match or ranked candidate list
```

Acceptance criteria:

- typo returns likely candidates;
- partial name returns likely candidates;
- shorthand can match if stored in `card_names`;
- ambiguous query returns candidate list rather than a forced match;
- no plausible match returns `NOT_FOUND`;
- confidence is labelled.

### 8.3 Text Search

Required capability:

```text
Input: text phrase or effect wording fragment
Output: matching card records with relevant fields
```

Examples:

```text
cards containing "discard"
cards containing "Special Summon"
cards containing "cannot be destroyed"
```

Acceptance criteria:

- searches stored card text;
- returns card name, category, and relevant matching context where practical;
- does not rank strategically unless a later strategic layer is invoked;
- does not infer card text from memory.

### 8.4 Metadata Search

Required capability:

```text
Input: structured card filters
Output: matching card records
```

Examples:

```text
LIGHT Fiend monsters
Quick-Play Spells
Level 4 Warrior monsters
Pendulum Monsters with Scale 8
```

Acceptance criteria:

- supports category, type, attribute, race, level/rank/link, spell/trap subtype, and similar basic fields;
- returns minimal relevant fields;
- does not infer missing metadata from memory.

## 9. Source And Freshness Requirements

Every imported card record must expose local fact provenance:

```text
source_family
source_reference
cache_revision
last_imported_at
```

Every banlist or legality value must expose competitive-status provenance before trusted use:

```text
banlist_source_family
banlist_source_reference
banlist_effective_date
banlist_last_checked_at
legality_source_family
legality_source_reference
legality_last_checked_at
```

If these fields are missing, the system may store the value but must label it as unverified, unknown, stale, or enrichment-required depending on the context.

## 10. Missing-Data And Safety Statuses

Required statuses:

```text
FOUND
AMBIGUOUS
NOT_FOUND
FIELD_MISSING
LOCAL_CACHE_MISSING
LOCAL_CACHE_STALE
ENRICHMENT_REQUIRED
SOURCE_MISSING
UNVERIFIED
STALE
```

Examples:

```text
Card not found
-> NOT_FOUND

Multiple candidates
-> AMBIGUOUS

Banlist status requested but not sourced
-> ENRICHMENT_REQUIRED or UNVERIFIED

Legality requested but not populated
-> ENRICHMENT_REQUIRED

Cache has no revision/date
-> FOUND with freshness warning

Exact card text missing
-> FIELD_MISSING
```

The system must not answer missing card facts, legality, or banlist status from AI memory.

## 11. Enrichment Boundary

Phase 1 should prepare for enrichment but should not implement the full enrichment layer.

Do in Phase 1:

- include nullable legality and banlist fields;
- include source/freshness fields for legality and banlist values;
- return enrichment-required or unverified statuses where needed;
- keep local card facts separate from enrichment and strategic reasoning.

Do not in Phase 1:

- build full rulings ingestion;
- build full banlist automation;
- build full legality automation;
- treat the local card facts source as complete ruling authority;
- treat unsourced legality or banlist values as current competitive truth.

## 12. Internal Service Contract

Phase 1 should expose internal functions or service methods equivalent to:

```text
getCardByExactName(name)
searchCardsByName(query)
searchCardsByText(query)
searchCardsByMetadata(filters)
getCardById(cardId)
getCardSourceStatus(cardId)
getCardCompetitiveStatus(cardId)
```

Suggested response shape:

```text
{
  status,
  query,
  card,
  candidates,
  source,
  freshness,
  confidence,
  warnings
}
```

This is not final production API design. It defines the minimum backend contract future frontend and assistant workflows will need.

## 13. Validation Checks

### 13.1 Import Checks

- import completes without fatal errors;
- imported card count is recorded;
- import batch has source reference and revision;
- records have `last_imported_at`;
- failed records are counted or logged.

### 13.2 Exact Lookup Checks

- exact official names resolve;
- punctuation/case normalisation works;
- unknown card returns `NOT_FOUND`;
- result includes source/freshness metadata.

### 13.3 Fuzzy Lookup Checks

- typo returns candidate list;
- partial name returns candidate list;
- ambiguous query does not force a guessed result;
- confidence is labelled.

### 13.4 Search Checks

- metadata search works for basic category/type filters;
- text search works for simple effect text phrases;
- search does not add strategic recommendations.

### 13.5 Banlist And Legality Checks

- `banlist_status` can be null or UNKNOWN without breaking lookup;
- unsourced banlist status is not treated as current;
- `banlist_last_checked_at` is required for trusted current use;
- missing legality returns `ENRICHMENT_REQUIRED` or `UNVERIFIED`;
- legality and banlist status do not override official source hierarchy.

### 13.6 Safety Checks

- no card fact is answered from AI memory;
- missing legality returns safe status;
- missing ruling data returns safe status;
- source/freshness metadata is available in lookup responses;
- imported card text or API data cannot alter runtime/governance behaviour.

## 14. Definition Of Done

Phase 1 specification is complete when Admin has reviewed and accepted:

- Phase 1 objective;
- table list;
- field list;
- banlist/legality nullability and source rules;
- import/source assumptions;
- lookup/search requirements;
- source/freshness metadata requirements;
- missing-data statuses;
- explicit out-of-scope items;
- validation checks;
- proposed Implementation Engineer task.

Phase 1 implementation is complete only when the approved implementation task has built and validated the agreed backend behaviour.

## 15. Proposed Implementation Task Boundary

Do not send this task until Admin approves delegation.

```text
IMPLEMENTATION TASK — Supabase Card Database Phase 1

Build the Phase 1 Supabase card database foundation exactly as specified in planning/002_supabase_card_database_phase_1_spec.md.

Implement:
1. cards table
2. card_names table
3. card_import_batches table
4. optional card_lookup_audit table if practical
5. exact card lookup
6. fuzzy card lookup
7. basic card text search
8. basic metadata search
9. source/freshness metadata
10. nullable banlist and legality fields with source/freshness guardrails
11. safe missing-data statuses
12. validation checks

Do not implement:
- frontend UI
- recommendations
- strategic tags
- rulings engine
- full banlist automation
- full legality automation
- tournament companion
- combo solver
- payment/team features

Before coding:
- inspect current repository structure
- confirm whether any Supabase folder or migration structure already exists
- propose the smallest file changes
- do not create unrelated tickets
- do not change architecture beyond the approved spec
```

## 16. Change Log

```text
2026-06-19
Status: DRAFTED
Change: Created Supabase Card Database Phase 1 specification.
Reason: Admin approved creating a GitHub markdown planning file and clarified that banlist status should be included as a core card-data field even if not populated immediately.
```
