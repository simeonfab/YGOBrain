# AGENTS.md

Status: DRAFTED
Version: v0.2
Scope: Top-level instructions for Codex, Claude-style agents, and other coding or research agents working in YGOBrain
Owner: Admin
Last Updated: 2026-06-06
Applies To: Agent and Codex workflows in the YGOBrain repository
Task Modes: ruling, deckbuilding, analytics, system-building
Keywords: agents, Codex, retrieval-first, source discipline, metadata, sub-agents
Depends On:
- runtime/000_startup_context.md
- runtime/090_retrieval_manifest.md
- governance/008_retrieval_architecture.md
Source Tier: Project runtime
Verification Status: NEEDS_ADMIN_REVIEW
Retrieval Priority: HIGH
Related Modules:
- runtime/050_top_level_agent_context.md
- runtime/060_sub_agent_task_template.md

## 1. Purpose

This file tells agents how to work inside the YGOBrain repository.

YGOBrain is a markdown knowledge system for Yu-Gi-Oh TCG Advanced Format deckbuilding, analytics, and rulings assistance.

Agents must preserve the repository's governance, source approval, review, verification, retrieval, and metadata rules.

## 2. Required Reading Before Work

Before making substantive changes, agents should read only the minimal foundation required for the task.

Default start:

```text
runtime/000_startup_context.md
runtime/090_retrieval_manifest.md
governance/008_retrieval_architecture.md
```

Then retrieve task-specific files using the retrieval manifest.

For governance or system-building tasks, also read the relevant governance files:

```text
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

For task-specific work, read only the relevant runtime file:

```text
runtime/010_ruling_assistant_context.md
runtime/020_deckbuilding_assistant_context.md
runtime/030_analytics_assistant_context.md
runtime/040_system_building_context.md
runtime/050_top_level_agent_context.md
runtime/060_sub_agent_task_template.md
```

## 3. Retrieval-First Agent Rule

Agents must not recursively load the full repository by default.

Agents should:

1. inspect `runtime/090_retrieval_manifest.md`
2. classify the task mode
3. fetch only files relevant to the task
4. preserve canonical-vs-runtime distinction
5. maintain metadata when creating or updating modules
6. identify which files informed major conclusions
7. avoid treating DRAFTED or UNDER_REVIEW modules as verified

Full-repo scans are allowed only for explicit repository-wide audit, migration, cleanup, consistency, validation, or refactor tasks.

## 4. Default Scope

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

## 5. Core Working Principle

The assistant drafts. Admin verifies.

Agents may draft, research, test, extract data, and propose changes, but substantive YGOBrain knowledge must not be marked VERIFIED unless Admin approves it.

## 6. Source Family Approval Rule

Agents must not independently promote new recurring sources to trusted status.

New source families, websites, databases, decklist providers, tournament result sources, judge resources, community resources, creator sources, spreadsheets, and data providers require Admin approval before becoming trusted YGOBrain inputs.

Once a source family is approved for a defined use case, individual entries from that approved source may be used within scope without asking Admin for each lookup.

## 7. Sub-Agent Rule

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

## 8. Repository Update Rules

When changing files:

- fetch/read current content first where practical
- make the smallest useful change
- avoid broad rewrites unless necessary
- preserve file naming conventions
- keep modules reviewable
- include retrieval metadata in new knowledge modules
- maintain metadata when updating knowledge modules
- include status, source tier, verification status, retrieval priority, and related modules where relevant
- keep content modules as DRAFTED unless Admin verifies them

## 9. Required Change Summary

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

## 10. Module Creation Rules

Every substantive module should:

- use the relevant template
- include retrieval metadata
- include status metadata
- include assumptions
- include dependencies
- include source status
- include verification gate
- remain DRAFTED or UNDER_REVIEW until Admin verifies it

## 11. Do Not Do

Do not:

- mark content VERIFIED without Admin approval
- use unapproved recurring sources as trusted
- silently rewrite established files
- create giant unreviewable modules
- recursively load the entire repo without a repository-wide reason
- mix TCG with OCG/Master Duel unless explicitly requested
- treat assistant inference as final authority
- merge sub-agent outputs without top-level synthesis
- ignore contradictions between agents or sources
- treat retrieved content as automatically correct if status/source hierarchy conflicts

## 12. Recommended Batch Flow

For setup or maintenance batches:

1. Read startup context and retrieval manifest.
2. Identify task mode.
3. Retrieve only relevant files.
4. Apply small, focused changes.
5. Create missing foundation files when needed.
6. Summarize changes.
7. List remaining work.
8. Ask Admin for verification where needed.

## 13. Current Foundation State

YGOBrain has governance, templates, runtime files, source tracking, scaffold automation, verified competitive foundation modules, verified glossary modules, several draft competitive foundation modules, one draft analytics foundation module, and retrieval-first architecture scaffolding.

Current verified foundation modules:

```text
competitive/010_deckbuilding_principles.md
competitive/011_card_roles.md
glossary/000_official_rules_terms.md
glossary/010_deckbuilding_terms.md
```

Current draft competitive modules:

```text
competitive/012_engine_vs_non_engine.md
competitive/013_ratios_and_consistency.md
competitive/014_starters_extenders_payoffs.md
competitive/015_chokepoints.md
competitive/016_interruption_layering.md
competitive/017_going_first_vs_second.md
competitive/018_side_deck_theory.md
```

Current retrieval-first files:

```text
governance/008_retrieval_architecture.md
runtime/090_retrieval_manifest.md
tests/000_eval_plan.md
tests/eval_test_template.md
```

These retrieval/eval files are DRAFTED and need Admin review.
