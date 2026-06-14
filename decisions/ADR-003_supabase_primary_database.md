# ADR-003 Supabase Primary Database

Status: ACCEPTED
Version: v0.1
Category: decisions
Scope: Primary database choice for YGOBrain app data
Owner: Admin
Last Updated: 2026-06-13
Applies To: App data, card data, analytics data, user workflows, implementation planning
Task Modes: system-building, analytics
Keywords: Supabase, database, Postgres, app data, primary database, storage
Depends On:
- decisions/000_decision_index.md
- governance/010_card_database_schema.md
- governance/012_card_data_tables.md
Source Tier: Project governance
Verification Status: ADMIN_CONFIRMED
Retrieval Priority: HIGH
Related Modules:
- governance/010_card_database_schema.md
- governance/012_card_data_tables.md
- governance/013_card_enrichment_architecture.md
- supabase/

## Decision ID

ADR-003

## Title

Supabase Primary Database

## Status

ACCEPTED

## Date

2026-06-13

## Owner

Admin

## Context

YGOBrain needs a primary database for app data, card data, analytics data, and future implementation work.

Without a default database decision, agents may propose duplicate storage layers or split data across tools without a clear ownership model.

## Decision

Supabase is the primary database for YGOBrain app data unless a specific tool is clearly better for a narrow implementation need.

## Rationale

Supabase provides Postgres-backed relational storage suitable for card data, structured app data, analytics, and future integrations.

Using it as the default avoids unnecessary fragmentation while still allowing narrow exceptions when another tool is clearly better for a specific job.

## Alternatives Considered

- Use flat markdown files as the only data store.
- Use a separate database per feature.
- Choose implementation-specific storage ad hoc.
- Use external APIs as the primary storage layer.

## Consequences

- New app data features should assume Supabase unless there is a clear reason not to.
- Database schema changes should be documented and reviewed.
- Narrow exceptions should be justified in an ADR or implementation note when durable.
- Markdown remains canonical for governance and knowledge modules, not necessarily app runtime data.

## Affected Areas

- supabase/
- app data storage
- card data schema
- analytics tables
- implementation planning
- future migrations

## Related Files

- governance/010_card_database_schema.md
- governance/012_card_data_tables.md
- governance/013_card_enrichment_architecture.md
- supabase/

## Supersedes

None

## Superseded By

None

## Follow-Up Work

- Keep database schema decisions aligned with Supabase as the primary store.
- Add ADRs for durable exceptions to Supabase when needed.
- Maintain migrations and schema documentation together.

## Review Notes

- Initial decision supplied by Admin in the Master Decision Record system task.

## Change Log

```text
2026-06-13
Status: ACCEPTED
Change: Created initial accepted decision record.
Reason: Admin confirmed Supabase as the primary YGOBrain app database.
```
