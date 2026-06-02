# Batch Task Plan

Status: DRAFTED
Version: v0.1
Category: scripts
Scope: Checklist for completing YGOBrain setup before large-scale agent-assisted content creation
Owner: Admin
Last Updated: 2026-06-02

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

- [ ] Admin reviews and accepts the setup batch.
- [ ] Admin approves or rejects candidate source families.
- [ ] Admin reviews `competitive/010_deckbuilding_principles.md`.

## 4. Source Approval Tasks

- [ ] Decide whether Yugipedia is approved, limited-use, or candidate only.
- [ ] Decide whether YGOrganization is approved, limited-use, or candidate only.
- [ ] Identify and approve decklist source families.
- [ ] Identify and approve tournament result source families.
- [ ] Identify and approve judge/ruling source families.
- [ ] Identify and approve metagame/statistics source families.
- [ ] Identify whether creator/channel sources are allowed and under what scope.

## 5. Next Content Modules After Setup Verification

Recommended first content modules:

```text
analytics/010_analytics_principles.md
core_rules/010_terminology.md
competitive/011_card_roles.md
competitive/012_engine_vs_non_engine.md
competitive/013_ratios_and_consistency.md
analytics/016_probability_and_consistency.md
```

All substantive content modules should remain DRAFTED or UNDER_REVIEW until Admin verifies them.

## 6. Agent Batch Rules

When using agents for future batches:

- read `AGENTS.md` first
- read `runtime/000_startup_context.md`
- read `runtime/050_top_level_agent_context.md`
- use `runtime/060_sub_agent_task_template.md` for sub-agent work
- use only approved source families as trusted inputs
- mark candidate sources clearly
- keep modules small and reviewable
- provide a change summary after durable changes

## 7. Change Log

```text
2026-06-02
Status: DRAFTED
Change: Created batch task plan.
Reason: Admin requested a complete setup checklist before using agents in Codex for content generation.
```
