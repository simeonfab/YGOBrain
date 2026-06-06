# 001 Knowledge Architecture

Status: DRAFTED
Version: v0.1
Scope: Repository structure, module architecture, dependency rules, and build order
Owner: Admin
Last Updated: 2026-05-28

## 1. Purpose

This file defines how YGOBrain knowledge is organized.

The goal is to make the project:

- modular
- reviewable
- portable across chats and devices
- easy to update
- easy to compile into runtime context files
- resistant to contradictions and repeated mistakes

YGOBrain should not be one large Yu-Gi-Oh guide. It should be a structured knowledge system made from smaller verified modules.

## 2. Repository Structure

The repository uses the following top-level folders:

```text
YGOBrain/
|-- governance/
|-- core_rules/
|-- competitive/
|-- decks/
|-- analytics/
|-- glossary/
|-- tests/
|-- templates/
|-- runtime/
|-- changelogs/
|-- error_logs/
|-- sources/
`-- scripts/
```

## 3. Folder Responsibilities

### governance/

Contains system-level operating rules.

Examples:

- operating rules
- knowledge architecture
- source hierarchy
- response methodology
- maintenance policies

Governance files control how the project is built and maintained.

### core_rules/

Contains Yu-Gi-Oh rules interpretation modules.

Examples:

- PSCT
- chains
- spell speeds
- timing
- activation legality
- resolution legality
- summoning mechanics
- battle phase rules

This folder supports ruling accuracy and interaction analysis.

### competitive/

Contains strategic theory modules.

Examples:

- deckbuilding theory
- ratios
- consistency
- card advantage
- tempo
- chokepoints
- side decking
- going first vs going second

This folder supports coaching, deck criticism, and strategic recommendations.

### decks/

Contains deck-specific overlays.

Examples:

- deck identity
- engine cards
- starters
- extenders
- non-engine slots
- combo lines
- end boards
- chokepoints
- matchup notes

Each deck should have its own file or folder when the deck becomes complex enough.

### analytics/

Contains statistical and analytical frameworks.

Examples:

- event result analysis
- deck list aggregation
- card frequency analysis
- matchup spread analysis
- conversion analysis
- hand probability analysis

This folder supports turning deck, event, and performance data into decisions.

### glossary/

Contains shared terminology files split by domain.

Examples:

- official rules terminology
- strategic deckbuilding terminology
- analytics terminology when needed

Glossary files should point back to their source modules and should not replace canonical rules, competitive, or analytics modules.

### tests/

Contains validation examples and edge cases.

Examples:

- ruling tests
- PSCT tests
- chain resolution tests
- deckbuilding scenario tests
- analytics interpretation tests

Tests exist to prevent repeated mistakes and knowledge drift.

### templates/

Contains reusable markdown templates.

Examples:

- module template
- deck template
- test template
- source template
- error log template
- changelog template

Templates keep future files consistent.

### runtime/

Contains compiled context files intended for use in chats.

Examples:

- startup context
- ruling assistant context
- deckbuilding assistant context
- analytics assistant context

Runtime files are generated or compiled from canonical files. They are not the primary source of truth.

### changelogs/

Contains records of meaningful project changes.

Changelogs should explain what changed, why it changed, affected files, priority, and dependencies.

### error_logs/

Contains records of material mistakes and the prevention steps created from them.

This folder supports error-driven system hardening.

### sources/

Contains source tracking and source evaluation.

Examples:

- official source index
- trusted community source index
- rulings source notes
- source confidence policy

### scripts/

Contains automation scripts.

Examples:

- PowerShell scaffolding scripts
- export scripts
- validation helpers
- runtime compilation helpers

## 4. Canonical Knowledge vs Derived Artifacts

Canonical knowledge belongs in:

- governance/
- core_rules/
- competitive/
- decks/
- analytics/
- glossary/
- sources/
- tests/

Derived artifacts belong in:

- runtime/
- generated summaries
- temporary exports

Derived artifacts should not be edited as the source of truth unless explicitly promoted into canonical files.

## 5. Module Granularity Rule

Modules should be small enough to review, but not so small that the repo becomes unmanageable.

Use medium-atomic files by default.

Good examples:

```text
core_rules/020_psct_overview.md
core_rules/021_psct_punctuation.md
core_rules/022_psct_conjunctions.md
core_rules/030_chain_building.md
competitive/070_deckbuilding_ratios.md
analytics/010_event_result_analysis.md
```

Avoid giant omnibus files such as:

```text
all_yugioh_rules.md
complete_deckbuilding_guide.md
```

## 6. File Naming Rule

Use:

- numeric prefixes where order matters
- lowercase snake_case
- `.md` extension
- stable names

Example:

```text
021_psct_punctuation.md
```

Do not use unstable names such as:

```text
PSCT Notes Final Updated.md
```

## 7. Dependency Rule

Each module should declare its dependencies when relevant.

A module should depend only on:

- governance rules
- source hierarchy rules
- lower-level foundational modules
- explicitly named peer modules

Example:

```text
Depends On:
- governance/000_system_operating_rules.md
- core_rules/030_chain_building.md
- core_rules/031_chain_resolution.md
```

Dependencies should be used to prevent circular logic and unclear authority.

## 8. Recommended Build Order

The recommended project build order is:

1. Governance foundation.
2. Source hierarchy.
3. Templates.
4. Core rules foundation.
5. PSCT modules.
6. Chain and timing modules.
7. Game state logic modules.
8. Deck construction and competitive theory.
9. Analytics frameworks.
10. Deck overlays.
11. Tests and validation expansion.
12. Runtime context compilation.

## 9. Initial Governance Files

The initial governance layer should contain:

```text
governance/000_system_operating_rules.md
governance/001_knowledge_architecture.md
governance/002_source_hierarchy.md
governance/003_response_methodology.md
governance/004_update_and_changelog_policy.md
governance/005_error_correction_and_hardening.md
```

## 10. Initial Templates

The initial templates should contain:

```text
templates/module_template.md
templates/deck_template.md
templates/test_case_template.md
templates/source_entry_template.md
templates/changelog_entry_template.md
templates/error_log_entry_template.md
```

## 11. Initial Core Rules Backlog

The initial core rules backlog should begin with:

```text
core_rules/011_zones.md
core_rules/012_card_types.md
core_rules/013_turn_structure.md
core_rules/020_psct_overview.md
core_rules/021_psct_punctuation.md
core_rules/022_psct_conjunctions.md
core_rules/023_psct_costs.md
core_rules/024_psct_targeting.md
core_rules/025_activation_vs_resolution.md
core_rules/030_spell_speeds.md
core_rules/031_chain_building.md
core_rules/032_chain_resolution.md
core_rules/033_fast_effect_timing.md
core_rules/034_segoc.md
core_rules/035_activation_legality.md
core_rules/036_resolution_legality.md
```

## 12. Initial Competitive Backlog

The initial competitive backlog should begin with:

```text
competitive/010_deckbuilding_principles.md
competitive/011_card_roles.md
competitive/012_engine_vs_non_engine.md
competitive/013_ratios_and_consistency.md
competitive/014_starters_extenders_payoffs.md
competitive/015_chokepoints.md
competitive/016_interruption_layering.md
competitive/017_going_first_vs_second.md
competitive/018_side_deck_theory.md
```

## 13. Initial Analytics Backlog

The initial analytics backlog should begin with:

```text
analytics/010_analytics_principles.md
analytics/011_decklist_analysis.md
analytics/012_event_result_analysis.md
analytics/013_card_frequency_analysis.md
analytics/014_matchup_spread_analysis.md
analytics/015_conversion_analysis.md
analytics/016_probability_and_consistency.md
```

## 14. Deck Overlay Structure

Deck-specific files should usually live in:

```text
decks/[deck_name]/
```

Example:

```text
decks/branded/
|-- 000_deck_overview.md
|-- 010_core_engine.md
|-- 020_standard_builds.md
|-- 030_combo_lines.md
|-- 040_chokepoints.md
|-- 050_matchups.md
`-- 060_tests.md
```

A single markdown file may be used for a deck while it is still small or experimental.

## 15. Runtime Architecture

Runtime files should be modular.

Recommended runtime files:

```text
runtime/000_startup_context.md
runtime/010_ruling_assistant_context.md
runtime/020_deckbuilding_assistant_context.md
runtime/030_analytics_assistant_context.md
runtime/040_deck_overlay_context.md
```

A new chat should usually start with `runtime/000_startup_context.md`, then load the task-specific runtime file.

## 16. Review Lifecycle

Each module should move through this lifecycle:

```text
PLANNED -> DRAFTED -> UNDER_REVIEW -> VERIFIED
```

If a module becomes incorrect or outdated:

```text
VERIFIED -> SUPERSEDED
```

or

```text
VERIFIED -> DEPRECATED
```

Only Admin can approve VERIFIED status unless verification is explicitly delegated for a defined source category.

## 17. Expansion Rule

Do not create large amounts of content before the architecture and templates are stable.

The preferred sequence is:

1. Create governance file.
2. Create template.
3. Create one module.
4. Review module.
5. Patch template if needed.
6. Continue.

## 18. Maintenance Rule

If a new need appears repeatedly, it should become one of:

- a governance rule
- a template section
- a test case
- a source note
- a runtime instruction
- a module backlog item

Repeated friction should become system design, not repeated manual explanation.
