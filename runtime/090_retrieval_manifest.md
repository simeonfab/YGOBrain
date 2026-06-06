# 090 Retrieval Manifest

Status: DRAFTED
Version: v0.1
Category: runtime
Scope: Routing guide for retrieval-first YGOBrain file selection
Owner: Admin
Last Updated: 2026-06-06
Applies To: Task-mode classification, file retrieval, and context minimisation
Task Modes: ruling, deckbuilding, analytics, system-building
Keywords: retrieval manifest, routing, file selection, task mode, context minimisation
Depends On:
- runtime/000_startup_context.md
- governance/008_retrieval_architecture.md
Source Tier: Project runtime
Verification Status: NEEDS_ADMIN_REVIEW
Retrieval Priority: HIGH
Related Modules:
- AGENTS.md
- tests/000_eval_plan.md

## 1. Purpose

This file is the routing guide for retrieval-first YGOBrain.

It helps an assistant select a small, task-relevant set of files instead of loading the whole repository.

This manifest is not a full knowledge dump. It points to likely files and folders.

## 2. Retrieval Rules

Use this sequence:

1. Classify the task mode.
2. Load the relevant task runtime file.
3. Retrieve the smallest useful set of canonical modules.
4. Prefer VERIFIED or VERIFIED_BY_ADMIN modules.
5. Use DRAFTED or UNDER_REVIEW modules only with an unverified label.
6. Add source files when source authority, approval, freshness, or evidence matters.
7. Identify materially relevant repo files in the answer.

Do not recursively load the full repo unless the task is explicitly repository-wide.

## 3. Deckbuilding Questions

Use for:

- deck critiques
- card roles
- ratios and consistency
- engine vs non-engine
- starters, extenders, and payoffs
- chokepoints
- interruption packages
- going-first and going-second plans
- side deck planning

Likely retrieval files:

```text
runtime/020_deckbuilding_assistant_context.md
glossary/010_deckbuilding_terms.md
competitive/010_deckbuilding_principles.md
competitive/011_card_roles.md
competitive/012_engine_vs_non_engine.md
competitive/013_ratios_and_consistency.md
competitive/014_starters_extenders_payoffs.md
competitive/015_chokepoints.md
competitive/016_interruption_layering.md
competitive/017_going_first_vs_second.md
competitive/018_side_deck_theory.md
decks/[relevant_deck]/* when available
```

Retrieval notes:

- `competitive/010_deckbuilding_principles.md`, `competitive/011_card_roles.md`, and `glossary/010_deckbuilding_terms.md` are verified foundation modules.
- `competitive/012_engine_vs_non_engine.md` through `competitive/018_side_deck_theory.md` are DRAFTED unless later updated.
- Use only the specific competitive module needed for the question when possible.

## 4. Analytics Questions

Use for:

- event data
- decklist aggregation
- matchup data
- probability
- conversion analysis
- testing logs
- sample-size interpretation

Likely retrieval files:

```text
runtime/030_analytics_assistant_context.md
analytics/010_analytics_principles.md
analytics/*
competitive/011_card_roles.md where card classification matters
sources/000_source_index.md
sources/001_approved_source_families.md
```

Retrieval notes:

- Pull source files when the answer depends on approved data providers or source authority.
- Do not treat small samples as conclusive unless a verified analytics module says otherwise.

## 5. Ruling Questions

Use for:

- card interactions
- timing
- chains
- activation legality
- resolution legality
- PSCT
- official rules terms

Likely retrieval files:

```text
runtime/010_ruling_assistant_context.md
glossary/000_official_rules_terms.md
core_rules/*
sources/000_source_index.md
sources/001_approved_source_families.md
```

Retrieval notes:

- Retrieve exact official card text or source-backed references when wording matters.
- Do not invent official rules claims.
- OCG material is informative only when no TCG authority is available and must be labelled accordingly.

## 6. System-Building Questions

Use for:

- repository structure
- governance
- templates
- runtime files
- scripts
- source management
- evals and tests
- migrations and refactors

Likely retrieval files:

```text
runtime/040_system_building_context.md
governance/*
templates/*
scripts/*
runtime/*
sources/*
tests/*
```

Retrieval notes:

- For repository-wide audits, use metadata scans, file listings, and targeted search before reading every file in full.
- Preserve canonical markdown modules and keep runtime files lightweight.

## 7. Source Discipline Questions

Use for:

- source approval
- source hierarchy
- approved or limited-use source families
- candidate source handling
- source entry structure

Likely retrieval files:

```text
governance/002_source_hierarchy.md
sources/000_source_index.md
sources/001_approved_source_families.md
templates/source_entry_template.md
```

Retrieval notes:

- Do not promote sources to APPROVED without Admin review.
- Use `SOURCE_NEEDED` when no approved source family covers a required source category.

## 8. Eval and Regression Questions

Use for:

- eval creation
- regression checks
- retrieval quality tests
- source-discipline tests
- post-change validation

Likely retrieval files:

```text
tests/000_eval_plan.md
tests/eval_test_template.md
templates/test_case_template.md
governance/008_retrieval_architecture.md
```

Retrieval notes:

- Evals should state required retrieval files and forbidden errors.
- Regression tests should check status, metadata, source discipline, and encoding.

## 9. Full-Repo Review Gate

Full-repo review is allowed only for explicit:

- repository-wide audit
- migration
- cleanup
- consistency validation
- source inventory
- structural refactor

Even then, prefer:

- `git status`
- file lists
- metadata scans
- `rg` searches
- targeted reads

## 10. Change Log

```text
2026-06-06
Status: DRAFTED
Change: Created retrieval manifest.
Reason: Admin requested a routing guide for retrieval-first YGOBrain.
```
