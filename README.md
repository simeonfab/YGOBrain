# YGOBrain

YGOBrain is a GitHub-based markdown knowledge system for Yu-Gi-Oh TCG Advanced Format assistance.

It is designed to help with:

1. Deck building and deck criticism.
2. Analytics from deck lists, event results, matchup data, and testing logs.
3. Ruling accuracy, card interaction reasoning, PSCT, chains, timing, and legality analysis.

## Current Status

Status: Foundation build
Version: v0.1

The repository currently contains governance, templates, runtime context files, source tracking, and scaffold automation.

It does not yet contain full Yu-Gi-Oh rules logic, deck modules, or analytics modules.

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
```

## Core Principle

The assistant drafts. Simeon verifies.

Assistant inference alone is not final authority. Official sources, trusted sources, and Simeon's review determine what becomes accepted knowledge.

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
4. Source index.
5. Pilot modules.
6. Core rules foundation.
7. Deckbuilding theory.
8. Analytics modules.
9. Deck overlays.
10. Tests and validation expansion.

## Current Next Steps

Recommended next files:

```text
competitive/010_deckbuilding_principles.md
analytics/010_analytics_principles.md
core_rules/010_terminology.md
```

The first pilot module should be small and reviewable.
