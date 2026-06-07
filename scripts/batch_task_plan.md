# Batch Task Plan

Status: DRAFTED
Version: v0.6
Category: scripts
Scope: Checklist for completing ResolveYGO setup before large-scale agent-assisted content creation
Owner: Admin
Last Updated: 2026-06-07

## 1. Purpose

This file lists the setup batch tasks that should be completed before using Codex or other multi-agent workflows to create substantial ResolveYGO content modules.

Project naming rule:

- ResolveYGO is the product/project name moving forward.
- YGOBrain is legacy naming and should be migrated gradually.
- Until the repository/folder migration is complete, avoid creating new permanent references to YGOBrain unless referring to legacy files, paths, or repository history.

## 2. Naming Migration Tasks

- [x] Admin confirmed new project/product name: ResolveYGO.
- [ ] Decide whether the GitHub repository should be renamed from `YGOBrain` to `ResolveYGO`.
- [ ] Decide whether the local canonical folder should become `C:\Users\simeo\Documents\ResolveYGO`.
- [ ] Resolve the current split where implementation files exist in `ResolveYGO` but architecture/tracker files exist in `YGOBrain`.
- [ ] Create a controlled rename plan before bulk replacing naming across docs/code.
- [ ] Update README and startup/runtime files to use ResolveYGO as the current name.
- [ ] Update governance docs to use ResolveYGO as the current name where appropriate.
- [ ] Preserve legacy references only where they refer to old repo/folder history.
- [ ] After rename/migration, verify all Codex prompts point to the correct canonical path.

## 3. Completed Setup Batch Items

- [x] Update `runtime/000_startup_context.md` with module review and sub-agent policies.
- [x] Update `README.md` with agent workflow and current foundation status.
- [x] Update `templates/source_entry_template.md` with source family approval fields.
- [x] Update `templates/deck_template.md` with review gate and source approval gate.
- [x] Update `templates/test_case_template.md` with source approval and sub-agent fields.
- [x] Update `templates/changelog_entry_template.md` with agent-assisted change fields.
- [x] Update `templates/error_log_entry_template.md` with sub-agent and unapproved-source error handling.
- [x] Create `AGENTS.md`.
- [x] Create `runtime/050_top_level_agent_context.md`.
- [x] Create `runtime/060_sub_agent_task_template.md`.
- [x] Create `sources/001_approved_source_families.md`.
- [x] Create this batch task plan.

## 4. Required Human Verification Before Large-Scale Agent Work

- [x] Admin reviews and accepts the setup batch.
- [x] Admin confirms no currently listed candidate source families require decision before continuing.
- [x] Admin reviews and accepts `competitive/010_deckbuilding_principles.md`.

## 5. Source Approval Tasks

- [x] Record Yugipedia as LIMITED_USE.
- [x] Record YGOrganization as LIMITED_USE.
- [x] Record Yu-Gi-Oh Meta as APPROVED for decklists, tournament results, metagame trends, tournament statistics, and Yu-Gi-Oh news.
- [x] Record YGOResources Database/API as APPROVED for card database lookup, card text research, metadata, Q&A/rulings lookup, and API-backed querying.
- [ ] Identify whether additional decklist source families are needed beyond Yu-Gi-Oh Meta.
- [ ] Identify whether additional tournament result source families are needed beyond Yu-Gi-Oh Meta.
- [ ] Identify whether additional judge/ruling source families are needed beyond YGOResources Database/API.
- [ ] Identify whether additional metagame/statistics source families are needed beyond Yu-Gi-Oh Meta.
- [ ] Identify whether creator/channel sources are allowed and under what scope.

Current Proceed Rule:
- Agent-assisted content work may proceed when an approved or limited-use source family covers the task's required source category.
- If a task needs a source category not yet covered, pause and ask Admin for approval before treating the new source as trusted.
- Admin may provide additional source families over time.

## 6. Retrieval-First Architecture Tasks

- [x] Create `governance/008_retrieval_architecture.md`.
- [x] Create `runtime/090_retrieval_manifest.md`.
- [x] Update `runtime/000_startup_context.md` with retrieval-first rule.
- [x] Update `AGENTS.md` with retrieval-first agent guidance.
- [x] Update `templates/module_template.md` with retrieval metadata fields.
- [x] Create `tests/eval_test_template.md`.
- [x] Create `tests/000_eval_plan.md`.
- [x] Admin reviews and verifies retrieval-first architecture files.
- [ ] Gradually add retrieval metadata to high-priority existing modules.
- [ ] Create first small eval batch from `tests/000_eval_plan.md`.

## 7. Card Knowledge Architecture Tasks

- [x] Create `governance/009_card_knowledge_architecture.md`.
- [x] Create `runtime/070_card_lookup_context.md`.
- [x] Create `runtime/080_card_recommendation_context.md`.
- [x] Create `governance/010_card_database_schema.md`.
- [x] Create `competitive/020_card_tagging_framework.md`.
- [x] Create `templates/card_tag_template.md`.
- [x] Create `tests/card_lookup_eval_template.md`.
- [x] Create `tests/card_recommendation_eval_template.md`.
- [x] Create `tests/card_discovery_eval_template.md`.
- [x] Create `tests/001_card_eval_plan.md`.
- [x] Admin reviews and verifies card knowledge architecture files.
- [x] Admin reviews and verifies `governance/010_card_database_schema.md`.
- [x] Admin reviews and verifies `competitive/020_card_tagging_framework.md`.
- [x] Admin reviews and verifies `templates/card_tag_template.md`.
- [x] Admin reviews and verifies card eval framework files.
- [x] Create local card database physical storage format via Supabase migration.
- [x] Define local card database storage path via Supabase tables.
- [x] Define update/cache script requirements through card-history importer and enrichment service.
- [x] Define card database query interface through lookup/search service.
- [x] Define fuzzy lookup approach using pg_trgm and local full-text search.
- [x] Define strategic tag storage and review workflow through schema support.
- [ ] Add card lookup/recommendation routes to `runtime/090_retrieval_manifest.md` if needed.
- [ ] Create actual card lookup eval cases after local database implementation exists.
- [ ] Create actual card recommendation eval cases after local database implementation exists.
- [ ] Create actual card discovery eval cases after local database implementation exists.

## 8. Phase 2 Card Database Implementation Review

Phase 2 implementation was reported by Codex, but the implementation files are not present in this `YGOBrain` repository after pulling `origin/main` on 2026-06-07.

Implementation was later found in:

```text
C:\Users\simeo\Documents\ResolveYGO
```

Implementation still needs to be ported into the canonical repository/folder after the naming decision is settled.

Implementation not yet present in the current `YGOBrain` repository:

- [ ] Add TypeScript project setup and npm scripts.
- [ ] Add Supabase migration for `cards`, `card_localizations`, `card_stats`, `card_properties`, `card_enrichment`, and `card_import_logs`.
- [ ] Add RLS read policies for authenticated users and no client write policies.
- [ ] Add pg_trgm fuzzy lookup and local full-text search support.
- [ ] Add card-history importer with UTF-8 JSON parsing, ID validation, source metadata, property splitting, Link arrow storage, and import logging.
- [ ] Add local lookup/search service.
- [ ] Add on-demand YGOResources enrichment service with cache-first behaviour.
- [ ] Add prompt-injection data wrapper and source-discipline labels.
- [ ] Add Vitest test suite with mocked Supabase/API calls.
- [ ] Confirm `npm.cmd run build` passes in the canonical repository.
- [ ] Confirm `npm.cmd run test` passes in the canonical repository.

Current review result:

- [x] Ran `git status` before pull: clean on `main`.
- [x] Ran `git pull`: fast-forwarded to `origin/main`.
- [x] Ran `git status` after pull: clean on `main`.
- [x] Checked requested implementation file paths: implementation files are absent from `YGOBrain`.
- [x] Ran `npm.cmd run build`: failed because `package.json` is absent.
- [x] Ran `npm.cmd run test`: failed because `package.json` is absent.
- [x] Located implementation files in `C:\Users\simeo\Documents\ResolveYGO`.

Review still required before live use:

- [ ] Land/port Phase 2 implementation files into the canonical repository/folder.
- [ ] Review Phase 2 implementation for architecture compliance after files exist in the canonical repository/folder.
- [ ] Review Supabase migration before applying to a live Supabase project.
- [ ] Confirm RLS policies allow authenticated read access only and no client writes.
- [ ] Review importer against the `yugioh-card-history` repository structure.
- [ ] Confirm lookup/search service uses local database first.
- [ ] Confirm enrichment service only calls YGOResources when local/enrichment cache data is missing.
- [ ] Confirm `/data/card/<id>` enrichment is not overclaimed as full ruling/Q&A coverage.
- [ ] Design Q&A-ID discovery flow before using `/data/qa/<id>`.
- [ ] Keep banlist, legality, and release_info as safe stubs until documented approved endpoints exist.
- [ ] Add actual eval cases after local database implementation exists.
- [ ] Review npm vulnerabilities manually after npm dependencies exist; do not run `npm audit fix --force` blindly.
- [ ] Apply Supabase migration to live project only after review.
- [ ] Run importer against live project only after migration review and application.

## 9. Next Content Modules After Setup Verification

Recommended first content modules:

```text
glossary/000_official_rules_terms.md
glossary/010_deckbuilding_terms.md
analytics/016_probability_and_consistency.md
```

Created first content modules:

```text
competitive/010_deckbuilding_principles.md - VERIFIED_BY_ADMIN
competitive/011_card_roles.md - VERIFIED_BY_ADMIN
glossary/000_official_rules_terms.md - VERIFIED_BY_ADMIN
glossary/010_deckbuilding_terms.md - VERIFIED_BY_ADMIN
competitive/012_engine_vs_non_engine.md - DRAFTED
competitive/013_ratios_and_consistency.md - DRAFTED
competitive/014_starters_extenders_payoffs.md - DRAFTED
competitive/015_chokepoints.md - DRAFTED
competitive/016_interruption_layering.md - DRAFTED
competitive/017_going_first_vs_second.md - DRAFTED
competitive/018_side_deck_theory.md - DRAFTED
competitive/020_card_tagging_framework.md - VERIFIED_BY_ADMIN
analytics/010_analytics_principles.md - DRAFTED
```

All substantive content modules should remain DRAFTED or UNDER_REVIEW until Admin verifies them.

## 10. Agent Batch Rules

When using agents for future batches:

- read `AGENTS.md` first
- read `runtime/000_startup_context.md`
- read `runtime/050_top_level_agent_context.md`
- use `runtime/060_sub_agent_task_template.md` for sub-agent work
- use `runtime/090_retrieval_manifest.md` to avoid context bloat
- use only approved source families as trusted inputs
- mark candidate sources clearly
- keep modules small and reviewable
- provide a change summary after durable changes
- automatically update this batch task plan after meaningful durable changes
- use ResolveYGO as the current project name in new work unless referring to legacy files/paths/history

## 11. Change Log

```text
2026-06-02
Status: DRAFTED
Change: Created batch task plan.
Reason: Admin requested a complete setup checklist before using agents in Codex for content generation.

2026-06-06
Status: DRAFTED
Change: Added retrieval-first architecture tasks and card knowledge architecture tasks.
Reason: Admin requested retrieval-first YGOBrain and separation of card facts, strategic reasoning, and rulings.

2026-06-06
Status: DRAFTED
Change: Added card database schema completion and implementation follow-ups.
Reason: Admin requested local card database schema architecture to support exact lookup, fuzzy lookup, recommendations, discovery, and analytics.

2026-06-06
Status: DRAFTED
Change: Added card tagging framework and card eval framework tasks.
Reason: Admin requested strategic card discovery by function and evaluation scaffolds for card lookup, recommendation, discovery, and source discipline.

2026-06-06
Status: VERIFIED_BY_ADMIN
Change: Marked reviewed retrieval-first, card knowledge, card database schema, card tagging, and card eval framework items as verified in the batch task plan.
Reason: Admin confirmed all surfaced review items were verified.

2026-06-07
Status: DRAFTED
Change: Added Phase 2 card database implementation completion and review tasks.
Reason: Admin requested automatic tracking of completed implementation work and remaining review/live integration tasks.

2026-06-07
Status: DRAFTED
Change: Added ResolveYGO naming migration tasks.
Reason: Admin confirmed ResolveYGO is the project/product name moving forward and YGOBrain naming caused implementation split across folders.
```
