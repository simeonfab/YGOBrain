# 003 Supabase Card Database Phase 1 Implementation Task

Status: DRAFTED
Version: v0.1
Category: planning
Scope: Narrow Implementation Engineer task for the approved ResolveYGO Supabase Card Database Phase 1 backend scope
Owner: Admin
Last Updated: 2026-06-19
Applies To: Implementation Engineer, Supabase card database, card fact storage, exact lookup, fuzzy lookup, text search, metadata search, source/freshness tracking, MVP backend readiness
Task Modes: system-building
Keywords: Implementation Engineer, Supabase, card database, card facts, lookup, fuzzy lookup, banlist, legality, backend phase 1
Depends On:
- planning/000_current_focus_and_todos.md
- planning/002_supabase_card_database_phase_1_spec.md
- decisions/ADR-002_card_data_layer.md
- decisions/ADR-003_supabase_primary_database.md
- features/000_feature_registry.md
- runtime/040_system_building_context.md
Source Tier: Project planning
Verification Status: NEEDS_ADMIN_REVIEW
Retrieval Priority: HIGH
Related Modules:
- governance/009_card_knowledge_architecture.md
- governance/010_card_database_schema.md
- governance/013_card_enrichment_architecture.md
- governance/014_card_enrichment_schema.md
- runtime/070_card_lookup_context.md
- tests/001_card_eval_plan.md

## 1. Purpose

This file prepares a narrow Implementation Engineer task for Supabase Card Database Phase 1.

It exists because Admin approved the Phase 1 planning scope in `planning/002_supabase_card_database_phase_1_spec.md` and asked the Technical Strategy Lead to prepare the implementation task.

This file is not permission to broaden scope, create unrelated tickets, start frontend work, or change architecture.

## 2. Implementation Task

```text
IMPLEMENTATION TASK — Supabase Card Database Phase 1

Build the Phase 1 Supabase card database foundation exactly as specified in:

planning/002_supabase_card_database_phase_1_spec.md
```

## 3. Required Reading Before Coding

Implementation Engineer must read these files before making changes:

```text
AGENTS.md
runtime/000_startup_context.md
runtime/040_system_building_context.md
planning/000_current_focus_and_todos.md
planning/002_supabase_card_database_phase_1_spec.md
decisions/000_decision_index.md
decisions/ADR-002_card_data_layer.md
decisions/ADR-003_supabase_primary_database.md
features/000_feature_registry.md
governance/009_card_knowledge_architecture.md
governance/010_card_database_schema.md
governance/013_card_enrichment_architecture.md
governance/014_card_enrichment_schema.md
sources/001_approved_source_families.md
tests/001_card_eval_plan.md
```

## 4. Required Pre-Coding Check

Before coding, Implementation Engineer must inspect the repository and report:

1. whether any `supabase/` folder already exists;
2. whether any migration pattern already exists;
3. whether any app/backend code structure already exists;
4. whether any package/dependency files already exist;
5. the smallest proposed file changes needed to implement Phase 1;
6. any blockers or missing assumptions.

If repository structure is missing, propose the smallest conventional structure rather than creating a broad app scaffold.

## 5. In Scope

Implement only the Phase 1 backend foundation.

### 5.1 Database Tables

Implement migrations or schema definitions for:

```text
cards
card_names
card_import_batches
```

Optional if practical and small:

```text
card_lookup_audit
```

### 5.2 `cards` Table

Must support the fields defined in `planning/002_supabase_card_database_phase_1_spec.md`, including:

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

`banlist_status` and `legality_status` must be nullable or safely default to `UNKNOWN`.

They must not be treated as trusted/current unless their source and freshness fields are populated.

### 5.3 `card_names` Table

Must support:

```text
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

`card_names` must support official names, aliases, localisations, shorthand, corrected typo records, and Admin-added names without allowing shorthand/user records to override official names.

### 5.4 `card_import_batches` Table

Must support:

```text
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

### 5.5 Lookup/Search Functions

Implement internal service functions or equivalent backend utilities for:

```text
getCardByExactName(name)
searchCardsByName(query)
searchCardsByText(query)
searchCardsByMetadata(filters)
getCardById(cardId)
getCardSourceStatus(cardId)
getCardCompetitiveStatus(cardId)
```

Exact naming may vary by codebase convention, but equivalent capability must exist.

### 5.6 Safe Return Shape

Lookup/search responses should include equivalent fields:

```text
status
query
card
candidates
source
freshness
confidence
warnings
```

### 5.7 Required Statuses

Implement or document safe statuses equivalent to:

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

## 6. Out Of Scope

Do not implement:

- frontend UI;
- decklist saving;
- recommendation engine;
- strategic tags;
- ruling engine;
- full banlist automation;
- full legality automation;
- automated meta ingestion;
- Tournament Companion;
- combo solver;
- payment or team features;
- unrelated app scaffolding;
- unrelated tickets or backlog generation.

## 7. Source And Data Rules

Phase 1 must preserve source discipline.

- Use only approved source-family assumptions already recorded in the repository.
- Do not introduce a new recurring card data source without Admin approval.
- Do not answer card facts from model memory.
- Do not treat unsourced banlist or legality values as current competitive truth.
- Do not treat card text as a complete ruling authority.
- Store source/freshness metadata wherever card fact or competitive status values are imported.

## 8. Acceptance Criteria

### AC1 — Repository Inspection

Given the task begins,
When Implementation Engineer inspects the repository,
Then they report the current app/Supabase/backend structure and smallest proposed file changes before coding.

### AC2 — Schema Exists

Given Phase 1 is implemented,
When the database migrations/schema are inspected,
Then the `cards`, `card_names`, and `card_import_batches` structures exist with the required Phase 1 fields.

### AC3 — Banlist and Legality Guardrails

Given `banlist_status` and `legality_status` exist,
When their source/freshness fields are missing,
Then the system must return a safe warning/status and must not treat them as current trusted values.

### AC4 — Exact Lookup

Given a known official card name exists in the local database,
When exact lookup is called,
Then it returns the matching card with source/freshness metadata.

### AC5 — Fuzzy Lookup

Given a typo, partial name, shorthand, or approximate name is searched,
When fuzzy lookup is called,
Then it returns a high-confidence match or a ranked candidate list without silently guessing ambiguous results.

### AC6 — Text Search

Given card text is stored locally,
When a card-text phrase is searched,
Then matching card records are returned without adding strategic recommendations.

### AC7 — Metadata Search

Given metadata fields are populated,
When structured filters are used,
Then matching records are returned for basic filters such as category, type, attribute, race, level/rank/link, and spell/trap subtype.

### AC8 — Missing Data Safety

Given a requested card fact, legality field, banlist field, or ruling-related field is missing,
When the relevant lookup/search is called,
Then the system returns a safe missing-data status rather than inferring from memory.

### AC9 — Validation Evidence

Given implementation is complete,
When reporting back,
Then Implementation Engineer must provide validation evidence covering import/schema checks, exact lookup, fuzzy lookup, text search, metadata search, banlist/legality guardrails, and missing-data behaviour.

## 9. Expected Output From Implementation Engineer

Implementation Engineer should return:

```text
CHANGE SUMMARY
- Added:
- Changed:
- Not changed:

FILES CHANGED
- path list

VALIDATION
- commands/tests run
- results
- any gaps

SCOPE CHECK
- confirmation that no frontend, recommendations, strategic tags, full rulings, full banlist automation, full legality automation, Tournament Companion, combo solver, payment/team features, or unrelated tickets were created

BLOCKERS / FOLLOW-UP
- only blockers or follow-up tasks directly arising from Phase 1
```

## 10. Delegation Status

Prepared by Technical Strategy Lead after Admin approved the Phase 1 scope.

This task is ready for Admin to copy/send to the canonical Implementation Engineer / Git chat, or for Admin to explicitly authorise direct implementation work in that canonical channel.

## 11. Change Log

```text
2026-06-19
Status: DRAFTED
Change: Created narrow Implementation Engineer task for Supabase Card Database Phase 1.
Reason: Admin approved the Phase 1 backend planning scope and requested preparation of the implementation task.
```
