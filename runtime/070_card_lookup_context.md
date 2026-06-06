# 070 Card Lookup Context

Status: DRAFTED
Version: v0.1
Category: runtime
Scope: Runtime instructions for card lookup, card search, local card database use, and cache/update behaviour
Owner: Admin
Last Updated: 2026-06-06
Applies To: Card fact lookup, card search, local card database workflows, card metadata checks
Task Modes: deckbuilding, analytics, ruling, system-building
Keywords: card lookup, card search, local card database, card facts, cache, YGOResources, card metadata
Depends On:
- governance/009_card_knowledge_architecture.md
- governance/002_source_hierarchy.md
- sources/000_source_index.md
- sources/001_approved_source_families.md
Source Tier: Project runtime
Verification Status: NEEDS_ADMIN_REVIEW
Retrieval Priority: HIGH
Related Modules:
- runtime/080_card_recommendation_context.md
- runtime/010_ruling_assistant_context.md
- runtime/090_retrieval_manifest.md

## 1. Purpose

This runtime file tells the assistant how to handle card facts and card search.

The goal is to ensure card facts come from a local card database or approved database/API workflow, not markdown files and not model memory.

## 2. Core Rule

Card facts must come from the card database layer.

Do not use model memory as authority for exact card text, card type, stats, attribute, legality, or card metadata.

Do not use YGOBrain strategic markdown as the source of card facts.

## 3. When to Use This Context

Use this context when the user asks for:

- exact card text
- card type
- monster stats
- attribute/type/level/rank/link rating
- whether a card contains certain wording
- cards matching a search condition
- card metadata
- local card database update or cache status

If the user asks whether an interaction works, switch to ruling workflow.

If the user asks whether a card should be played, switch to recommendation workflow after retrieving card facts.

## 4. Card Lookup Workflow

Use this workflow for exact card lookup:

1. Identify the card name or candidate names.
2. Query the local card database.
3. Resolve ambiguity if multiple cards match.
4. Return only the facts relevant to the request.
5. Include database/cache/source status where practical.
6. If the local database is unavailable, say so.
7. Do not answer from memory.

Output structure:

```text
CARD LOOKUP
- Card:
- Database result:
- Relevant facts:
- Cache/source status:
- Uncertainty:
```

## 5. Card Search Workflow

Use this workflow when searching for matching cards:

1. Convert the request into filters, text search, or fuzzy search criteria.
2. Query the local card database.
3. Separate exact matches from fuzzy or semantic matches.
4. Return relevant candidates with minimal fields.
5. If the search is broad, provide a shortlist and state the limit.
6. If strategic ranking is requested, move to `runtime/080_card_recommendation_context.md`.
7. If ruling implications are requested, move to `runtime/010_ruling_assistant_context.md`.

Output structure:

```text
CARD SEARCH
- Search criteria:
- Exact matches:
- Possible/fuzzy matches:
- Exclusions or limitations:
- Next step:
```

## 6. Cache and Update Workflow

Use this workflow when local data may be stale or missing:

1. Check whether local cache exists.
2. Check cache metadata, date, version, or revision.
3. Use local cache if current enough for the task.
4. If stale or missing, update from approved database/API source where available.
5. Avoid downloading unnecessary full datasets.
6. Prefer incremental or revision-based updates.
7. Record update date/version where practical.

For YGOResources Database/API:

- Do not request more data than needed.
- Do not query the entire database unnecessarily.
- Cache requested data locally where practical.
- Respect X-Cache-Revision where applicable.
- Use manifest/revision-style update checks where practical.
- Request only relevant card, Q&A, metadata, or index endpoints for the task.

## 7. Source Hierarchy for Card Facts

Use this hierarchy:

```text
1. Local card database for card facts.
2. Approved source/API used to update or verify local card database.
3. Official TCG source where direct confirmation is required.
4. YGOBrain markdown only as strategic or process context, not card fact authority.
5. AI inference never as card fact authority.
```

## 8. Ruling Boundary

Exact card text may support ruling analysis, but card lookup is not ruling analysis.

Switch to ruling workflow when:

- timing matters
- activation legality matters
- resolution legality matters
- PSCT interpretation matters
- official ruling or policy may affect the answer
- user asks whether an interaction works

## 9. Recommendation Boundary

Card lookup may support recommendations, but lookup alone should not recommend cards.

Switch to recommendation workflow when the user asks:

- should I play this card?
- what should I cut?
- what cards fit this deck?
- what are good options for this role?
- what should I side?

## 10. Failure Modes to Avoid

Avoid:

- answering exact card facts from memory
- using markdown as a card database
- copying full card text into strategic modules unnecessarily
- treating card text alone as a ruling answer
- ignoring ambiguous card names
- failing to label stale or unavailable local data
- running broad database updates when a targeted query is enough

## 11. Change Log

```text
2026-06-06
Status: DRAFTED
Change: Created card lookup runtime context.
Reason: Admin requested separation of card facts from strategic reasoning and rulings.
```
