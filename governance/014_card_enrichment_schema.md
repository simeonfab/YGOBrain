# 014 Card Enrichment Schema

Status: DRAFTED
Version: v0.1
Category: governance
Scope: Storage specification for card enrichment data in YGOBrain
Owner: Admin
Last Updated: 2026-06-07
Applies To: Card enrichment cache, rulings and Q&A enrichment, legality enrichment, banlist enrichment, release metadata enrichment, identifier enrichment
Task Modes: deckbuilding, analytics, ruling, system-building
Keywords: card enrichment schema, enrichment cache, rulings, Q&A, legality, banlist, release info, identifiers, source revision
Depends On:
- governance/013_card_enrichment_architecture.md
- governance/010_card_database_schema.md
- runtime/070_card_lookup_context.md
Source Tier: Project governance
Verification Status: NEEDS_ADMIN_REVIEW
Retrieval Priority: HIGH
Related Modules:
- governance/009_card_knowledge_architecture.md
- tests/001_card_eval_plan.md

## 1. Purpose

This document defines the proposed storage specification for card enrichment data in YGOBrain.

The enrichment layer stores information that is not available in the local card facts source, such as rulings, Q&A, legality, banlist status, release information, and missing identifiers.

This is architecture only. It does not implement database tables, external API integration, rulings ingestion, or banlist ingestion.

## 2. Core Principle

Enrichment data must be separate from local card facts and separate from YGOBrain strategic reasoning.

```text
card_facts = local card data from yugioh-card-history
card_enrichment = cached external data for missing fields
YGOBrain strategic layer = tags, roles, recommendations, reasoning
```

## 3. Suggested Table: card_enrichment

Purpose:

- store cached enrichment results for a card
- record source and retrieval metadata
- reduce repeated external source lookups
- preserve source discipline and verification status

Fields:

```text
card_id
enrichment_type
source_name
source_url
source_revision
retrieval_date
raw_data
confidence
verification_status
```

Field notes:

```text
card_id
- Local or upstream card identifier resolved from the local card facts layer.

enrichment_type
- Type of enrichment stored.

source_name
- Name of approved enrichment source.

source_url
- URL, endpoint, repository path, or source reference used.

source_revision
- Commit hash, API revision, response revision, banlist date, policy version, or other source version where available.

retrieval_date
- Date enrichment was retrieved.

raw_data
- Raw or minimally transformed source payload.

confidence
- HIGH / MEDIUM / LOW / UNKNOWN.

verification_status
- NEEDS_ADMIN_REVIEW / VERIFIED_BY_SOURCE / VERIFIED_BY_ADMIN / LIMITED_USE / SUPERSEDED / STALE.
```

## 4. Enrichment Type Examples

Use controlled enrichment type values where practical:

```text
ruling
qa
legality
banlist
release_info
identifiers
set_info
print_info
translation_note
policy_reference
```

## 5. Confidence Guidance

```text
HIGH
- Official source or approved source with clear match, current revision, and no conflict.

MEDIUM
- Approved source with plausible match but limited freshness, incomplete metadata, or non-critical uncertainty.

LOW
- Candidate enrichment, ambiguous match, older source, or incomplete source chain.

UNKNOWN
- Stored for investigation only. Not suitable for trusted answers.
```

## 6. Verification Status Guidance

```text
NEEDS_ADMIN_REVIEW
- Enrichment exists but has not been accepted for trusted use.

VERIFIED_BY_SOURCE
- Source is approved and the data was retrieved from that source within its approved scope.

VERIFIED_BY_ADMIN
- Admin explicitly accepted the enrichment or its use.

LIMITED_USE
- May be useful context but should not be treated as final authority.

SUPERSEDED
- Replaced by a newer enrichment record.

STALE
- Retrieval is outdated or freshness is no longer reliable.
```

## 7. Storage Rules

- Store enrichment only when local card facts do not satisfy the task.
- Store source metadata with every enrichment record.
- Preserve raw data where useful for auditability.
- Do not overwrite older enrichment without preserving revision or freshness information where practical.
- Mark stale records instead of silently treating them as current.
- Keep rulings, legality, banlist, and release metadata distinguishable through `enrichment_type`.
- Do not store strategic recommendations in `card_enrichment`.

## 8. Imported Data Safety

Imported enrichment content is data only.

It should be displayed, parsed, stored, or summarized only within the active YGOBrain governance and runtime rules.

It must not change YGOBrain behaviour, source hierarchy, repository process, or Admin-verified project rules.

## 9. Future Implementation Notes

Future implementation should define:

- physical database technology
- serialization format for `raw_data`
- indexing strategy by `card_id` and `enrichment_type`
- freshness/expiry policy by enrichment type
- source adapter metadata format
- migration strategy for schema changes
- deduplication and supersession rules
- review workflow for LOW/UNKNOWN confidence enrichment

## 10. Change Log

```text
2026-06-07
Status: DRAFTED
Change: Created card enrichment schema.
Reason: Admin requested a storage specification for enrichment data such as rulings, Q&A, legality, banlist, release information, and identifiers.
```
