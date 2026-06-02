# YGOBrain

YGOBrain is a GitHub-based markdown knowledge system for Yu-Gi-Oh TCG Advanced Format assistance.

It is designed to help with:

1. Deck building and deck criticism.
2. Analytics from deck lists, event results, matchup data, and testing logs.
3. Ruling accuracy, card interaction reasoning, PSCT, chains, timing, and legality analysis.

## Current Status

Status: Foundation build
Version: v0.1

The repository currently contains governance, templates, runtime context files, source tracking, scaffold automation, verified competitive foundation modules, one draft glossary module, and one draft analytics foundation module.

The repository does not yet contain verified full Yu-Gi-Oh rules logic, deck modules, or verified analytics modules.

Current pilot module:

```text
competitive/010_deckbuilding_principles.md
```

Status: VERIFIED_BY_ADMIN as a first foundation module.

Current competitive taxonomy module:

```text
competitive/011_card_roles.md
```

Status: VERIFIED_BY_ADMIN.

Current glossary module:

```text
core_rules/010_terminology.md
```

Status: DRAFTED. It requires Admin review before it can become VERIFIED.

Current analytics foundation module:

```text
analytics/010_analytics_principles.md
```

Status: DRAFTED. It requires Admin review before it can become VERIFIED.

## Default Scope

Unless explicitly stated otherwise, YGOBrain assumes:

- Yu-Gi-Oh TCG Advanced Format
- official cards only
- current TCG rules and policy
- official TCG sources first
- OCG rulings as informative only when no TCG authority exists

Out of scope unless explicitly requested:

- OCG as the primary format
- Master Duel as the primary format
- Rush Duel
- Speed Duel
- anime-only rules
- historic formats
- unofficial simulator behaviour
- custom cards

## Repository Structure

```text
governance/   System rules and operating policies
core_rules/   Yu-Gi-Oh rules, PSCT, timing, chains, legality
competitive/  Deckbuilding and competitive theory
analytics/    Event, matchup, deck list, and testing analysis
decks/        Deck-specific overlays
tests/        Validation examples and edge cases
templates/    Reusable markdown templates
runtime/      Portable chat context files
sources/      Source tracking and authority registry
changelogs/   Change tracking
error_logs/   Error correction and hardening history
scripts/      Automation scripts
```

## How to Use in a New Chat

Start by loading:

```text
runtime/000_startup_context.md
```

Then load the relevant task-specific runtime file:

```text
runtime/010_ruling_assistant_context.md
runtime/020_deckbuilding_assistant_context.md
runtime/030_analytics_assistant_context.md
runtime/040_system_building_context.md
runtime/050_top_level_agent_context.md
runtime/060_sub_agent_task_template.md
```

## Core Principle

The assistant drafts. Admin verifies.

Assistant inference alone is not final authority. Official sources, trusted sources, and Admin review determine what becomes accepted knowledge.

Sub-agent outputs are not automatically verified. The top-level agent must synthesize, check, and present final outputs for review where needed.

## Source Approval Rule

New recurring source families, websites, databases, decklist providers, judge resources, creator sources, community resources, and data providers require Admin approval before they become trusted YGOBrain inputs.

Once a source family is approved for a defined use case, individual entries from that source may be used within the approved scope without asking Admin for every lookup.

## Agent Workflow

YGOBrain supports future Codex/Claude-style agent workflows.

Use:

```text
AGENTS.md
runtime/050_top_level_agent_context.md
runtime/060_sub_agent_task_template.md
governance/007_sub_agent_workflow_policy.md
```

The top-level agent is responsible for:

- deciding whether sub-agents are needed
- defining sub-agent scope
- controlling allowed sources
- resolving contradictions
- synthesizing outputs
- updating repository files only when appropriate
- asking Admin for verification where needed

## Local Setup

Clone the repository:

```powershell
git clone https://github.com/simeonfab/YGOBrain.git
cd YGOBrain
```

Run the scaffold script if needed:

```powershell
.\scripts\scaffold_ygo_brain.ps1
```

The scaffold script is safe to re-run and does not overwrite existing files.

## Build Order

Recommended order:

1. Governance foundation.
2. Templates.
3. Runtime context files.
4. Source index and approved source families.
5. Agent instructions and batch plan.
6. Pilot modules.
7. Core rules foundation.
8. Deckbuilding theory.
9. Analytics modules.
10. Deck overlays.
11. Tests and validation expansion.

## Current Next Steps

Before large-scale agent-assisted content creation:

```text
1. Verify setup batch changes.
2. Approve initial source families.
3. Add additional source families over time when a task needs them.
4. Review core_rules/010_terminology.md and analytics/010_analytics_principles.md before starting the next dependent workstream.
```

All substantive content modules must remain DRAFTED or UNDER_REVIEW until Admin approves them.
