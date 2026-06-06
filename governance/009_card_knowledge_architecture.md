# 009 Card Knowledge Architecture

Status: DRAFTED
Version: v0.1
Category: governance
Scope: Architecture for separating card facts, strategic reasoning, and rulings in YGOBrain
Owner: Admin
Last Updated: 2026-06-06
Applies To: Card lookup, card search, card recommendation, strategic analysis, ruling workflows, local card database workflows
Task Modes: deckbuilding, analytics, ruling, system-building
Keywords: card facts, card database, local database, card lookup, card search, card recommendations, rulings, strategic reasoning, cache, source hierarchy
Depends On:
- governance/000_system_operating_rules.md
- governance/002_source_hierarchy.md
- governance/008_retrieval_architecture.md
- sources/000_source_index.md
- sources/001_approved_source_families.md
Source Tier: Project governance
Verification Status: NEEDS_ADMIN_REVIEW
Retrieval Priority: HIGH
Related Modules:
- runtime/070_card_lookup_context.md
- runtime/080_card_recommendation_context.md
- runtime/090_retrieval_manifest.md

## 1. Purpose

This file defines YGOBrain's card knowledge architecture.

The goal is to separate:

1. Card facts.
2. Strategic reasoning.
3. Rulings.

This prevents the assistant from relying on model memory for card facts, prevents strategic markdown from becoming a card database, and prevents card database entries from being treated as complete ruling authority.

## 2. Core Principle

Card facts, strategic reasoning, and rulings are separate knowledge layers.

```text
Card facts = local card database.
Strategic reasoning = YGOBrain markdown modules using retrieved card facts as input.
Rulings = official/approved ruling sources and rules modules, separate from raw card database facts.
```

The assistant must not blur these layers.

## 3. Card Facts Layer

Card facts should come from a local card database, not markdown files and not model memory.

Card facts include:

- card name
- card type
- attribute
- level/rank/link rating
- monster type
- ATK/DEF where applicable
- Pendulum scale where applicable
- official card text where available
- legality metadata where available
- identifiers
- release or set metadata where available

YGOBrain markdown may reference cards, but markdown is not the card fact source of truth.

If the local card database is unavailable, the assistant should say so and avoid pretending to know exact card facts from memory.

## 4. Strategic Reasoning Layer

Strategic reasoning comes from YGOBrain markdown modules.

Strategic reasoning includes:

- role classification
- deckbuilding implications
- ratio analysis
- consistency reasoning
- matchup context
- side deck planning
- card recommendation logic
- testing hypotheses

Strategic reasoning should use retrieved card facts as input.

Example:

```text
1. Retrieve exact card facts from local card database.
2. Retrieve relevant YGOBrain strategic modules.
3. Apply strategic reasoning to those facts.
4. Label unverified strategic modules when used.
```

Strategic modules should not duplicate full card text or become mini card databases.

## 5. Rulings Layer

Rulings remain separate from raw card facts.

Ruling analysis may require exact card text, but exact card text alone is not always sufficient for ruling certainty.

Rulings may require:

- official TCG rulings
- official rulebook or policy material
- official or approved Q&A/ruling sources
- PSCT modules
- chain/timing modules
- source hierarchy checks

The assistant must not assume that a card database entry alone resolves every ruling question.

If ruling certainty depends on a ruling source, use ruling workflow rather than recommendation workflow.

## 6. Source Hierarchy for Card Workflows

Use this hierarchy for card-related work:

```text
1. Local card database for card facts.
2. Official rulings and official TCG policy/rule sources for rulings.
3. Verified YGOBrain modules for accepted strategic/rules framework.
4. DRAFTED or UNDER_REVIEW YGOBrain modules as unverified support only.
5. AI inference as lowest authority.
```

Notes:

- The local card database is authoritative for card facts only to the extent it is current and sourced.
- Official rulings override strategic assumptions.
- Verified YGOBrain modules override draft modules.
- AI inference never overrides database facts, official rulings, or verified modules.

## 7. Card Lookup Workflow

Use card lookup when the user asks what a card is, what it says, what type it is, or for exact card facts.

Workflow:

1. Identify the card name or search terms.
2. Query the local card database.
3. Resolve ambiguity if multiple cards match.
4. Return only the relevant facts needed for the task.
5. State if the card was not found or if the database is unavailable.
6. Do not add strategic claims unless the user asks for evaluation or recommendation.
7. Do not answer rulings from card text alone if ruling certainty requires more.

Output should identify:

- database source used
- card record found
- date/version/cache information where available
- uncertainty or ambiguity

## 8. Card Search Workflow

Use card search when the user wants cards matching conditions.

Examples:

- LIGHT Fiend monsters
- cards that discard for cost
- cards that search a field spell
- hand traps that interact with graveyard effects
- cards with a specific phrase in text

Workflow:

1. Translate the request into database-searchable filters or text search.
2. Query the local card database.
3. Return candidates with relevant fields only.
4. Distinguish exact filter matches from fuzzy/semantic matches.
5. If strategic ranking is requested, move to card recommendation workflow.
6. If ruling implications are requested, move to ruling workflow.

Do not rely on memory for card search results.

## 9. Card Recommendation Workflow

Use card recommendation when the user asks what cards to play, cut, test, side, or consider.

Workflow:

1. Clarify deck/context only if necessary.
2. Retrieve card facts from the local card database.
3. Retrieve relevant YGOBrain strategic modules.
4. Retrieve deck-specific overlays if available.
5. Apply strategic reasoning to the card facts and deck context.
6. Separate fact from recommendation.
7. Label whether recommendation is verified, source-backed, tested, or theory.
8. Provide testable next steps.

The recommendation should not invent card text, legality, or card functions.

## 10. Ruling Workflow Boundary

Switch to ruling workflow when:

- exact timing matters
- activation legality matters
- resolution legality matters
- PSCT wording matters
- official ruling or policy may affect the answer
- the user asks whether an interaction works

Ruling workflow should retrieve:

- runtime/010_ruling_assistant_context.md
- relevant core_rules modules where available
- sources/000_source_index.md
- sources/001_approved_source_families.md
- local card facts for exact card text
- official or approved ruling sources where needed

Do not treat card recommendation workflow as a substitute for ruling workflow.

## 11. Cache and Update Workflow

The local card database should be cacheable and updateable.

Workflow:

1. Check whether local cache exists.
2. Check cache metadata/version/revision/date.
3. Use local cache if current enough for the task.
4. If stale or missing, update from the approved database/API source where available.
5. Avoid downloading more data than needed.
6. Prefer incremental or revision-based updates where supported.
7. Record update date/version where practical.

For YGOResources Database/API, follow existing API use rules:

- Do not request more data than needed.
- Do not query the entire database unnecessarily.
- Cache requested data locally where practical.
- Respect X-Cache-Revision where applicable.
- Use manifest/revision-style update checks where practical.
- Request only relevant card, Q&A, metadata, or index endpoints for the task.

## 12. Local Card Database Requirement

A future implementation should define:

- local database format
- local storage path
- update script
- source/API adapter
- cache metadata
- query interface
- fuzzy search behaviour
- exact-card lookup behaviour
- text-search behaviour

Until that exists, agents should not pretend that local card facts are available.

## 13. Failure Modes to Avoid

Avoid:

- using model memory as card text authority
- copying full card text into strategic markdown unnecessarily
- treating strategic markdown as a card database
- treating card database facts as complete ruling authority
- recommending cards without retrieving current facts
- searching cards from memory
- ignoring ambiguous card names
- mixing TCG, OCG, or Master Duel facts without qualification
- using stale local cache without warning

## 14. Change Log

```text
2026-06-06
Status: DRAFTED
Change: Created card knowledge architecture.
Reason: Admin requested separation of card facts, strategic reasoning, and rulings for retrieval-first YGOBrain.
```
