# 000 Eval Plan

Status: DRAFTED
Version: v0.1
Category: tests
Scope: Initial evaluation plan for retrieval-first YGOBrain
Owner: Admin
Last Updated: 2026-06-06
Applies To: YGOBrain answer quality, retrieval quality, source discipline, and regression testing
Task Modes: ruling, deckbuilding, analytics, system-building
Keywords: eval plan, regression, retrieval, source discipline, rulings, deckbuilding, analytics
Depends On:
- governance/008_retrieval_architecture.md
- runtime/090_retrieval_manifest.md
- tests/eval_test_template.md
Source Tier: Project test framework
Verification Status: NEEDS_ADMIN_REVIEW
Retrieval Priority: HIGH
Related Modules:
- templates/test_case_template.md

## 1. Purpose

This file defines the initial evaluation plan for YGOBrain.

The goal is to test whether YGOBrain answers use the right retrieved files, respect source authority, avoid overclaiming, and remain useful across rulings, deckbuilding, analytics, and system-building tasks.

## 2. Eval Principles

YGOBrain evals should test:

- whether the correct task mode is selected
- whether the correct files are retrieved
- whether verified modules are prioritised
- whether DRAFTED modules are labelled as unverified
- whether source hierarchy is respected
- whether the answer is useful and not generic
- whether the assistant avoids invented rulings, card text, or data
- whether regressions occur after markdown changes

## 3. Test Categories

### Rulings

Purpose:

- test card interaction reasoning
- test PSCT discipline
- test activation vs resolution handling
- test exact card text requirements
- test official-source preference

Example test themes:

- targeting vs non-targeting
- cost vs effect
- once per turn wording
- chain construction
- activation legality
- resolution legality
- OCG source used as informative only

Required retrieval usually includes:

```text
runtime/010_ruling_assistant_context.md
glossary/000_official_rules_terms.md
sources/000_source_index.md
sources/001_approved_source_families.md
core_rules/[relevant_module].md when available
```

### Deckbuilding

Purpose:

- test card-role classification
- test ratios and consistency reasoning
- test engine vs non-engine distinctions
- test starter/extender/payoff language
- test side deck and chokepoint reasoning

Example test themes:

- one-card vs 1.5-card vs two-card starters
- brick vs garnet
- non-engine overload
- engine requirement risk
- going-first vs going-second card valuation
- over-siding

Required retrieval usually includes:

```text
runtime/020_deckbuilding_assistant_context.md
glossary/010_deckbuilding_terms.md
competitive/010_deckbuilding_principles.md
competitive/011_card_roles.md
competitive/[relevant_module].md
```

### Analytics / Probability

Purpose:

- test sample-size warnings
- test probability interpretation
- test event result interpretation
- test conversion analysis
- test decklist aggregation reasoning

Example test themes:

- small sample is not conclusive
- representation vs conversion
- starter probability
- brick probability
- going-first vs going-second win rates
- card frequency vs card quality

Required retrieval usually includes:

```text
runtime/030_analytics_assistant_context.md
analytics/010_analytics_principles.md
analytics/[relevant_module].md
sources/000_source_index.md
sources/001_approved_source_families.md
```

### Source Discipline

Purpose:

- test whether the assistant respects source hierarchy
- test approved source family handling
- test community vs official distinction
- test unknown-source refusal or qualification

Example test themes:

- source is CANDIDATE or unapproved
- source is LIMITED_USE
- OCG ruling applied to TCG incorrectly
- community source conflicts with official source
- source is outdated or format-confused

Required retrieval usually includes:

```text
governance/002_source_hierarchy.md
sources/000_source_index.md
sources/001_approved_source_families.md
governance/008_retrieval_architecture.md
```

### Unknown / Needs Verification Traps

Purpose:

- test whether the assistant admits uncertainty
- test whether draft modules are labelled as unverified
- test whether missing exact card text is requested
- test whether source gaps are marked clearly

Example test themes:

- no exact card text supplied
- module exists but is DRAFTED
- no approved source family covers the requested source category
- user asks for current legality without checking banlist
- conflicting sources exist

Expected behaviour:

- say what is known
- mark what is unverified
- ask for exact text or source where needed
- avoid inventing final answers

### Regression Tests After Markdown Changes

Purpose:

- ensure repository updates do not break expected behaviour
- ensure naming conventions remain stable
- ensure metadata remains present
- ensure retrieval routes remain valid

Example checks:

- new module has metadata block
- no personal names where Admin should be used
- no mojibake or broken characters
- no accidental VERIFIED status
- retrieval manifest references valid files where available
- runtime files do not become giant knowledge dumps

## 4. Eval File Structure

Future evals may be organised as:

```text
tests/evals/rulings/
tests/evals/deckbuilding/
tests/evals/analytics/
tests/evals/source_discipline/
tests/evals/regression/
```

Small initial evals may also be stored in a single markdown file until volume justifies splitting.

## 5. Pass Criteria

A response should usually pass if it:

- identifies the correct task mode
- retrieves or cites the relevant repo files
- gives a direct useful answer
- respects source hierarchy
- labels unverified material
- avoids forbidden errors
- provides appropriate next action or uncertainty note

## 6. Fail Criteria

A response should fail if it:

- invents card text, rulings, sources, or statistics
- treats DRAFTED modules as verified
- treats community sources as official
- ignores retrieval manifest where relevant
- loads unrelated large file sets by default
- gives generic advice despite relevant verified modules
- ignores source approval rules
- fails to acknowledge uncertainty where needed

## 7. Initial Eval Backlog

```text
RULING-PSCT-001 - exact card text needed for wording-sensitive ruling
RULING-SOURCE-001 - OCG source is informative only
DECK-ROLE-001 - 1.5-card starter with generic discard
DECK-BRICK-001 - brick vs garnet distinction
DECK-RATIO-001 - 40 vs 60 card consistency tradeoff
ANALYTICS-SAMPLE-001 - small sample warning
ANALYTICS-CONVERSION-001 - representation vs conversion
SOURCE-APPROVAL-001 - unapproved source cannot be trusted
UNKNOWN-001 - missing source should produce SOURCE_NEEDED
REGRESSION-META-001 - new module includes retrieval metadata
REGRESSION-STATUS-001 - new substantive module is not accidentally VERIFIED
```

## 8. Change Log

```text
2026-06-06
Status: DRAFTED
Change: Created initial eval plan.
Reason: Admin requested eval/test set as part of retrieval-first YGOBrain architecture.
```
