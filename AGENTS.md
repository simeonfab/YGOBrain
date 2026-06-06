# AGENTS.md

Status: DRAFTED
Version: v0.1
Scope: Top-level instructions for Codex, Claude-style agents, and other coding or research agents working in YGOBrain
Owner: Admin
Last Updated: 2026-06-02

## 1. Purpose

This file tells agents how to work inside the YGOBrain repository.

YGOBrain is a markdown knowledge system for Yu-Gi-Oh TCG Advanced Format deckbuilding, analytics, and rulings assistance.

Agents must preserve the repository's governance, source approval, review, and verification rules.

## 2. Required Reading Before Work

Before making substantive changes, agents should read:

```text
runtime/000_startup_context.md
governance/000_system_operating_rules.md
governance/001_knowledge_architecture.md
governance/002_source_hierarchy.md
governance/003_response_methodology.md
governance/004_update_and_changelog_policy.md
governance/005_error_correction_and_hardening.md
governance/006_module_creation_and_review_policy.md
governance/007_sub_agent_workflow_policy.md
sources/000_source_index.md
sources/001_approved_source_families.md
```

For task-specific work, also read the relevant runtime file:

```text
runtime/010_ruling_assistant_context.md
runtime/020_deckbuilding_assistant_context.md
runtime/030_analytics_assistant_context.md
runtime/040_system_building_context.md
runtime/050_top_level_agent_context.md
runtime/060_sub_agent_task_template.md
```

## 3. Default Scope

Unless Admin explicitly says otherwise, assume:

- Yu-Gi-Oh TCG Advanced Format
- official cards only
- current TCG rules and policy
- official TCG sources first
- OCG rulings as informative only when no TCG authority exists

Out of scope unless explicitly requested:

- OCG as primary format
- Master Duel as primary format
- Rush Duel
- Speed Duel
- anime-only rules
- historic formats
- unofficial simulator behaviour
- custom cards

## 4. Core Working Principle

The assistant drafts. Admin verifies.

Agents may draft, research, test, extract data, and propose changes, but substantive YGOBrain knowledge must not be marked VERIFIED unless Admin approves it.

## 5. Source Family Approval Rule

Agents must not independently promote new recurring sources to trusted status.

New source families, websites, databases, decklist providers, tournament result sources, judge resources, community resources, creator sources, spreadsheets, and data providers require Admin approval before becoming trusted YGOBrain inputs.

Once a source family is approved for a defined use case, individual entries from that approved source may be used within scope without asking Admin for each lookup.

## 6. Sub-Agent Rule

Use sub-agents only when parallel work will improve speed, coverage, checking, or synthesis.

Good sub-agent tasks include:

- source research using approved sources
- data extraction from approved sources
- consistency review against repository files
- test case generation
- analytics calculations
- deckbuilding role classification
- rules edge case review

Sub-agents must have:

- narrow scope
- allowed sources
- forbidden actions
- expected output
- uncertainty handling

The top-level agent remains responsible for synthesis and final output.

## 7. Repository Update Rules

When changing files:

- fetch/read current content first where practical
- make the smallest useful change
- avoid broad rewrites unless necessary
- preserve file naming conventions
- keep modules reviewable
- include metadata in new files
- keep content modules as DRAFTED unless Admin verifies them

## 8. Required Change Summary

After meaningful durable changes, report:

```text
CHANGE SUMMARY
- Added:
- Removed:
- Clarified:
- Corrected:
- Refactored:

REASON
- Why the change was necessary.

AFFECTED FILES
- File list.

PRIORITY
- Immediate / Next Task / When Convenient / Optional.

DEPENDENCIES
- Follow-up work required.
```

## 9. Module Creation Rules

Every substantive module should:

- use the relevant template
- include status metadata
- include assumptions
- include dependencies
- include source status
- include verification gate
- remain DRAFTED or UNDER_REVIEW until Admin verifies it

## 10. Do Not Do

Do not:

- mark content VERIFIED without Admin approval
- use unapproved recurring sources as trusted
- silently rewrite established files
- create giant unreviewable modules
- mix TCG with OCG/Master Duel unless explicitly requested
- treat assistant inference as final authority
- merge sub-agent outputs without top-level synthesis
- ignore contradictions between agents or sources

## 11. Recommended Batch Flow

For setup or maintenance batches:

1. Read startup and relevant runtime context.
2. Identify files to update.
3. Apply small, focused changes.
4. Create missing foundation files.
5. Summarize changes.
6. List remaining work.
7. Ask Admin for verification where needed.

## 12. Current Foundation State

YGOBrain has governance, templates, runtime files, source tracking, scaffold automation, verified competitive foundation modules, verified glossary modules, several draft competitive foundation modules, and one draft analytics foundation module.

Current pilot content module:

```text
competitive/010_deckbuilding_principles.md
```

This module is VERIFIED_BY_ADMIN as a first foundation module.

Current competitive taxonomy module:

```text
competitive/011_card_roles.md
```

This module is VERIFIED_BY_ADMIN.

Current glossary modules:

```text
glossary/000_official_rules_terms.md
glossary/010_deckbuilding_terms.md
```

These modules are VERIFIED_BY_ADMIN.

Current competitive draft modules:

```text
competitive/012_engine_vs_non_engine.md
competitive/013_ratios_and_consistency.md
competitive/014_starters_extenders_payoffs.md
competitive/015_chokepoints.md
competitive/016_interruption_layering.md
competitive/017_going_first_vs_second.md
competitive/018_side_deck_theory.md
```

These modules are DRAFTED and need Admin review.

Current analytics foundation module:

```text
analytics/010_analytics_principles.md
```

This module is DRAFTED and needs Admin review.
