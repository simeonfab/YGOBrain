# 008 Retrieval Architecture

Status: DRAFTED
Version: v0.1
Category: governance
Scope: Retrieval-first operating model for YGOBrain
Owner: Admin
Last Updated: 2026-06-06
Applies To: All YGOBrain runtime, agent, module, and evaluation workflows
Task Modes: ruling, deckbuilding, analytics, system-building
Keywords: retrieval-first, context minimisation, canonical markdown, runtime, manifest, indexing, evals
Depends On:
- governance/000_system_operating_rules.md
- governance/001_knowledge_architecture.md
- governance/002_source_hierarchy.md
- governance/003_response_methodology.md
- governance/006_module_creation_and_review_policy.md
- governance/007_sub_agent_workflow_policy.md
Source Tier: Project governance
Verification Status: NEEDS_ADMIN_REVIEW
Retrieval Priority: HIGH
Related Modules:
- runtime/000_startup_context.md
- runtime/090_retrieval_manifest.md
- tests/000_eval_plan.md

## 1. Purpose

This file defines the retrieval-first architecture for YGOBrain.

The goal is to stop YGOBrain from relying on loading a large nested markdown or skill tree into context. The system should instead use a small runtime prompt, classify the task, retrieve only relevant canonical modules, and answer with clear source discipline.

## 2. Core Principle

YGOBrain should be retrieval-first, not context-dump-first.

The GitHub markdown repository remains the canonical source of truth, but an assistant or agent should not load the whole repository by default.

Use this sequence:

1. Load minimal startup context.
2. Classify the task mode.
3. Load the relevant task runtime file.
4. Use the retrieval manifest to identify likely canonical modules.
5. Retrieve only the smallest useful set of files or chunks.
6. Answer with file/source awareness.
7. Recommend durable updates only when needed.

## 3. Canonical Source of Truth

Canonical knowledge lives in the markdown repository.

Canonical folders include:

- governance/
- core_rules/
- competitive/
- analytics/
- glossary/
- decks/
- sources/
- tests/
- templates/

Runtime files are not full knowledge dumps. They are lightweight operating instructions and retrieval guides.

## 4. Runtime File Role

Runtime files should:

- define assistant behaviour for a task mode
- summarise key operating rules
- point to relevant canonical modules
- stay small enough to load quickly
- avoid duplicating full module content

Runtime files should not become large omnibus guides.

If a runtime file grows because it is carrying too much knowledge, move the knowledge into canonical modules and let runtime point to those modules.

## 5. Task Mode Classification

Before retrieving content, classify the user request as one or more task modes:

```text
ruling
- card interactions
- timing
- chains
- activation legality
- resolution legality
- PSCT
- official rules

deckbuilding
- deck lists
- ratios
- starters/extenders/payoffs
- engine vs non-engine
- side deck plans
- chokepoints

analytics
- decklist data
- event results
- matchup data
- probability
- conversion rates
- testing logs

system-building
- repository structure
- governance
- templates
- runtime files
- scripts
- source management
- evals
```

If a task spans multiple modes, retrieve the smallest set of modules needed for each relevant mode.

## 6. Retrieval Manifest

Use `runtime/090_retrieval_manifest.md` as the first routing layer after task classification.

The manifest should map task types to likely files and folders.

The manifest is not the source of truth for module content. It is a navigation aid.

## 7. Retrieval Rules

Retrieve only what is needed.

Preferred retrieval order:

1. startup context
2. relevant task runtime file
3. retrieval manifest
4. high-priority verified modules for the task
5. relevant draft modules if no verified module covers the point
6. source files when source authority matters
7. tests/evals when checking behaviour or regression risk

Do not recursively load every file under a folder unless the task is explicitly repository-wide.

## 8. Verified vs Drafted Modules

Verified modules should be prioritised over DRAFTED or UNDER_REVIEW modules.

Use status as follows:

```text
VERIFIED or VERIFIED_BY_ADMIN
- may be treated as accepted YGOBrain knowledge, subject to source hierarchy and freshness.

DRAFTED or UNDER_REVIEW
- may be used for assistance, but must be labelled as unverified.
- should not override verified modules or higher-tier sources.

PLANNED
- should not be used as substantive knowledge.

DEPRECATED or SUPERSEDED
- should not be used unless the task asks for history or comparison.
```

## 9. Source Hierarchy Still Applies

Retrieved content is not automatically correct.

If retrieved content conflicts with source hierarchy, official TCG sources, approved source families, or a verified module, the assistant must flag the conflict rather than blindly follow the retrieved text.

Assistant inference remains the lowest authority.

## 10. Answer Source Discipline

When answering based on repository content, identify which repo files informed the answer.

For short answers, this can be concise:

```text
Informed by:
- competitive/011_card_roles.md
- competitive/013_ratios_and_consistency.md
```

For larger answers or repository edits, include a fuller affected/informed file list.

If a module used is DRAFTED or UNDER_REVIEW, state that it is unverified.

## 11. Chunking Principle

Modules should be chunkable.

A module should use clear headings, metadata, keywords, task modes, and related modules so retrieval can target only useful sections later.

Avoid hiding multiple unrelated concepts inside one long file.

## 12. Metadata Principle

Every knowledge module should include metadata that supports retrieval.

Required metadata should include:

- Status
- Version
- Category
- Scope
- Owner
- Last Updated
- Applies To
- Task Modes
- Keywords
- Depends On
- Source Tier
- Verification Status
- Retrieval Priority
- Related Modules

## 13. Evaluation Principle

YGOBrain should include evals/tests that check retrieval behaviour, source discipline, and answer quality.

Eval tests should specify:

- question
- task mode
- required retrieval files
- expected answer points
- forbidden errors
- source discipline checks
- gold answer or Admin notes

## 14. Agent Workflow Rule

Agents must not recursively load the full repository by default.

Agents should:

1. inspect `runtime/090_retrieval_manifest.md`
2. identify task mode
3. fetch only relevant files
4. preserve canonical-vs-runtime distinction
5. maintain metadata when creating or updating modules
6. label draft/unverified content correctly

## 15. When Full-Repo Review Is Allowed

Full-repo or broad-folder review is allowed only when the task is explicitly about:

- repository readiness
- migration/refactor
- consistency checking
- naming cleanup
- validation scans
- source inventory
- structural audits

Even then, the agent should prefer file lists, metadata scans, or targeted grep/search before reading every file in full.

## 16. Change Log

```text
2026-06-06
Status: DRAFTED
Change: Created retrieval-first architecture governance.
Reason: Admin requested YGOBrain refactor away from context-heavy nested markdown loading and toward retrieval-first operation.
```
