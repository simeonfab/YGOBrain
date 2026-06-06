# Batch Task Plan

Status: DRAFTED
Version: v0.4
Category: scripts
Scope: Checklist for completing YGOBrain setup before large-scale agent-assisted content creation
Owner: Admin
Last Updated: 2026-06-06

## 1. Purpose

This file lists the setup batch tasks that should be completed before using Codex or other multi-agent workflows to create substantial YGOBrain content modules.

## 2. Completed Setup Batch Items

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

## 3. Required Human Verification Before Large-Scale Agent Work

- [x] Admin reviews and accepts the setup batch.
- [x] Admin confirms no currently listed candidate source families require decision before continuing.
- [x] Admin reviews and accepts `competitive/010_deckbuilding_principles.md`.

## 4. Source Approval Tasks

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

## 5. Retrieval-First Architecture Tasks

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

## 6. Card Knowledge Architecture Tasks

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
- [ ] Define local card database physical storage format.
- [ ] Define local card database storage path.
- [ ] Define update/cache script requirements.
- [ ] Define card database query interface.
- [ ] Define fuzzy lookup approach.
- [ ] Define strategic tag storage and review workflow.
- [ ] Add card lookup/recommendation routes to `runtime/090_retrieval_manifest.md` if needed.
- [ ] Create actual card lookup eval cases after local database implementation exists.
- [ ] Create actual card recommendation eval cases after local database implementation exists.
- [ ] Create actual card discovery eval cases after local database implementation exists.

## 7. Next Content Modules After Setup Verification

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

## 8. Agent Batch Rules

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

## 9. Change Log

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
```
