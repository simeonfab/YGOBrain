# [Deck Name] Deck Template

Status: PLANNED
Version: v0.2
Category: decks
Format: Yu-Gi-Oh TCG Advanced Format
Owner: Admin
Last Updated: YYYY-MM-DD

## 1. Purpose

This file defines the reusable structure for deck-specific YGOBrain overlays.

A deck overlay should help the assistant understand how to analyze, build, test, and improve a specific deck.

## 2. Deck Identity

Deck Name:

Primary Strategy:

Secondary Strategy:

Primary Win Condition:

Backup Win Condition:

Going First Plan:

Going Second Plan:

## 3. Scope

This deck file covers:

- main engine
- common builds
- ratios
- starters
- extenders
- payoffs
- non-engine choices
- combo lines
- chokepoints
- matchups
- testing notes

This deck file does not cover:

- OCG-first builds unless explicitly marked
- Master Duel builds unless explicitly marked
- historic format builds unless explicitly marked
- custom cards

## 4. Dependencies

Depends On:

- governance/000_system_operating_rules.md
- governance/001_knowledge_architecture.md
- governance/002_source_hierarchy.md
- governance/003_response_methodology.md
- governance/006_module_creation_and_review_policy.md
- governance/007_sub_agent_workflow_policy.md
- competitive/010_deckbuilding_principles.md
- competitive/011_card_roles.md
- competitive/013_ratios_and_consistency.md

Related Modules:

- [core rule module]
- [competitive module]
- [analytics module]

## 5. Source Approval Gate

Before using a new decklist website, tournament result database, creator source, spreadsheet, or recurring data provider as a trusted source for this deck, ask Admin for approval.

Approved Source Families:

- [Source family]

Candidate Source Families:

- [Source family]

Rejected or Out-of-Scope Source Families:

- [Source family]

## 6. Current Deck List

Use this section only when a specific list is being analyzed.

```text
Main Deck: [number]

Monsters:
- 

Spells:
- 

Traps:
- 

Extra Deck: [number]
- 

Side Deck: [number]
- 
```

## 7. Engine Overview

Core Engine Cards:

- 

Optional Engine Cards:

- 

Required Engine Cards:

- 

Potential Bricks or Garnets:

- 

Engine Payoffs:

- 

## 8. Card Roles

Starters:

- 

Extenders:

- 

Payoffs:

- 

Interaction:

- 

Board Breakers:

- 

Hand Traps:

- 

Flex Slots:

- 

Bricks or Garnets:

- 

## 9. Ratio Framework

Recommended Starter Count:

Recommended Extender Count:

Recommended Non-Engine Count:

Recommended Defensive Card Count:

Recommended Going-Second Card Count:

Known Ratio Tensions:

- 

## 10. Standard Builds

### Build A - [Name]

Purpose:

Strengths:

Weaknesses:

Best When:

Key Cards:

- 

### Build B - [Name]

Purpose:

Strengths:

Weaknesses:

Best When:

Key Cards:

- 

## 11. Combo Lines

### Combo 1 - [Name]

Required Cards:

- 

Line:

1. 
2. 
3. 

End Board:

- 

Resources Remaining:

- Hand:
- Graveyard:
- Banished:
- Follow-up:

Weaknesses:

- 

Source Status:

- [Tested / Admin Verified / Source-Backed / Needs Review]

## 12. Chokepoints

Common Interruption Points:

- 

Cards the Deck Struggles Against:

- 

Bait Sequencing:

- 

Recovery Lines:

- 

## 13. Matchups

### Matchup - [Deck Name]

Role:

- [Control / Aggressor / Combo / Midrange / Other]

Main Threats:

- 

Best Interruptions:

- 

Side Deck Plan:

- In:
- Out:

Notes:

- 

## 14. Side Deck Theory

Cards to Consider:

- 

Cards to Avoid:

- 

Going First Side Plan:

- 

Going Second Side Plan:

- 

## 15. Analytics Notes

Track useful data points:

- opening starter rate
- hands with starter plus extender
- non-engine count
- brick rate
- win rate going first
- win rate going second
- matchup win rates
- side deck card performance

## 16. Sub-Agent Workflow Notes

Sub-agents may be used for:

- role classification
- ratio review
- matchup review
- source extraction from approved sources
- test generation
- consistency checking

Allowed Sources:

- [Approved source family]

Do Not Use:

- unapproved recurring decklist or data sources as trusted inputs
- OCG or Master Duel sources unless explicitly requested

Top-Level Synthesis Required:

- [Yes]

## 17. Testing Plan

Current Hypotheses:

- 

Tests to Run:

- 

Success Criteria:

- 

Results:

- 

## 18. Common Mistakes

- 
- 
- 

## 19. Verification Gate

This deck file cannot be marked VERIFIED until Admin has reviewed or approved it.

Verification Status:

```text
NEEDS_ADMIN_REVIEW
```

Review Notes:

- 

## 20. Open Questions

- 
- 

## 21. Sources

```text
Source Name:
Source Family:
Source Type:
Tier:
URL or Reference:
Format:
Date Checked:
Relevant Claim:
Confidence:
Approval Status:
Approved Scope:
Notes:
```

## 22. Change Log

```text
YYYY-MM-DD
Status:
Change:
Reason:
```
