# ADR-002 Card Data Layer

Status: ACCEPTED
Version: v0.1
Category: decisions
Scope: Card facts, enrichment sources, and strategic reasoning boundaries
Owner: Admin
Last Updated: 2026-06-13
Applies To: Card data storage, card APIs, enrichment sources, analytics, deckbuilding, rulings support
Task Modes: system-building, ruling, deckbuilding, analytics
Keywords: card data, card facts, enrichment, strategic reasoning, API, local database
Depends On:
- decisions/000_decision_index.md
- governance/009_card_knowledge_architecture.md
- governance/010_card_database_schema.md
- governance/013_card_enrichment_architecture.md
Source Tier: Project governance
Verification Status: ADMIN_CONFIRMED
Retrieval Priority: HIGH
Related Modules:
- governance/009_card_knowledge_architecture.md
- governance/010_card_database_schema.md
- governance/011_card_data_import_pipeline.md
- governance/012_card_data_tables.md
- governance/013_card_enrichment_architecture.md
- governance/014_card_enrichment_schema.md

## Decision ID

ADR-002

## Title

Card Data Layer

## Status

ACCEPTED

## Date

2026-06-13

## Owner

Admin

## Context

YGOBrain needs card facts, rulings support, deckbuilding reasoning, analytics, and potential enrichment from external APIs or sources.

Without a clear separation, agents may mix official card facts, third-party enrichment, and strategic interpretation into one authority layer.

## Decision

YGOBrain separates card facts, enrichment sources, and strategic reasoning. Local card facts are used first; API enrichment is only used when needed.

## Rationale

Local card facts provide a stable baseline for card identity, text, legality, and structured lookups.

Enrichment sources can add value, but they should not override local facts or be treated as the same authority level as official or locally verified card data.

Strategic reasoning should remain clearly separate from factual card data.

## Alternatives Considered

- Query external APIs for all card-related work.
- Store card facts, enrichment, and strategic tags in one undifferentiated table or module.
- Treat community enrichment as equivalent to card facts.

## Consequences

- Card data architecture must distinguish local facts from enrichment.
- API calls should be targeted instead of default.
- Strategic labels and deckbuilding interpretation need their own layer and source status.
- Future database work must preserve these boundaries.

## Affected Areas

- card database schema
- enrichment pipeline
- source approval
- deckbuilding analytics
- rulings support
- Supabase tables

## Related Files

- governance/009_card_knowledge_architecture.md
- governance/010_card_database_schema.md
- governance/011_card_data_import_pipeline.md
- governance/012_card_data_tables.md
- governance/013_card_enrichment_architecture.md
- governance/014_card_enrichment_schema.md
- sources/000_source_index.md
- sources/001_approved_source_families.md

## Supersedes

None

## Superseded By

None

## Follow-Up Work

- Ensure future card import and enrichment scripts preserve source boundaries.
- Add evals for distinguishing card facts from strategic inference.
- Keep source approval status visible for enrichment providers.

## Review Notes

- Initial decision supplied by Admin in the Master Decision Record system task.

## Change Log

```text
2026-06-13
Status: ACCEPTED
Change: Created initial accepted decision record.
Reason: Admin confirmed the card data layer boundary as a durable YGOBrain decision.
```
