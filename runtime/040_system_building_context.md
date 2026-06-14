# 040 System Building Context

Status: DRAFTED
Version: v0.1
Category: runtime
Scope: Runtime instructions for building and maintaining the ResolveYGO project in the current YGOBrain repository
Owner: Admin
Last Updated: 2026-06-14

## 1. Purpose

This file is the task-specific runtime context for system-building work in ResolveYGO.

Use this file when creating, updating, organizing, or maintaining governance files, templates, source files, runtime files, tests, scripts, and repository structure.

## 2. Required Context

Before using this file, load:

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
governance/015_decision_record_policy.md
governance/016_feature_registry_policy.md
planning/000_current_focus_and_todos.md
decisions/000_decision_index.md
features/000_feature_registry.md
```

## 3. System-Building Role

When working in this mode, the assistant should act as an engineer.

Primary goals:

- create durable markdown files
- keep structure consistent
- reduce future repeated explanation
- automate file operations where practical
- keep changes small and reviewable
- preserve source-of-truth discipline
- avoid starting content modules before governance and templates are ready
- use sub-agents only when parallel work will clearly improve speed, coverage, or review quality

## 4. Default Workflow

Use this workflow for system-building tasks:

1. Identify the next required file or change.
2. Check `planning/000_current_focus_and_todos.md`.
3. Check `decisions/000_decision_index.md` before implementing features or architecture changes.
4. Read any relevant ADRs and identify conflicts with ACCEPTED decisions.
5. Check `features/000_feature_registry.md`.
6. State whether the task implements an existing decision, extends an existing decision, requires a new decision, or conflicts with an accepted decision.
7. Create or update the smallest useful file.
8. Check whether sub-agents are useful for the task.
9. Check whether any new source family, website, database, or recurring data provider needs Admin approval.
10. Commit directly to GitHub when access is available and appropriate.
11. Provide a change summary.
12. Assign priority.
13. Identify dependencies and next recommended file.

## 5. Decision And Feature Awareness

System-building work must check the current focus, decision index, relevant ADRs, and feature registry before implementation.

New roles, skills, runtime files, database sources, database capabilities, schemas, APIs, major features, and architecture changes require decision-log awareness.

Agents must not continue from chat memory where repository context exists. Retrieve current repository files instead.

Use the feature registry to identify whether a request implements an existing feature, extends an existing feature, or creates a new capability.

If adding a feature from a casual idea, first classify whether it is:

- minor content update
- new capability
- architecture decision
- implementation task

If the feature conflicts with an ACCEPTED decision, do not implement immediately. Explain the conflict and suggest either revising the feature or creating a new ADR to supersede the old decision.

## 6. Question Discipline

Ask one question at a time by default.

Do not ask Admin long setup lists.

Use established repository defaults unless the decision is genuinely blocked.

## 7. PowerShell First Rule

If Admin needs to do local work, provide PowerShell commands first.

Manual steps are secondary.

Example:

```powershell
git clone https://github.com/simeonfab/YGOBrain.git
cd YGOBrain
git pull
```

## 8. GitHub Direct Update Rule

When GitHub access is available and Admin has approved the action, prefer direct repository updates for simple file creation and edits.

After any direct GitHub update, report:

```text
CHANGE SUMMARY
REASON
AFFECTED FILES
PRIORITY
DEPENDENCIES
```

## 9. File Creation Rule

When creating a new file:

- use the correct folder
- use lowercase snake_case
- use numeric prefixes where ordering matters
- include metadata
- include scope
- include dependencies where useful
- include a change log section where useful
- include verification gates for substantive modules

## 10. Update Rule

When updating an existing file:

- fetch the current file first where practical
- avoid overwriting unrelated content
- make the smallest useful change
- explain what changed
- check whether related files need updates

## 11. Sub-Agent Use Rule

Use `governance/007_sub_agent_workflow_policy.md` before deploying or designing sub-agent workflows.

Sub-agents are appropriate when the work can be split into useful parallel tasks such as:

- source research
- consistency review
- test generation
- data extraction
- analytics interpretation
- deckbuilding critique
- module review

The top-level agent remains responsible for synthesis, contradiction handling, repository updates, and Admin verification.

## 12. Source Approval Gate

Before trusting a new source family, website, database, decklist provider, judge resource, or recurring data provider, ask Admin for approval.

Once a source is approved for a category, agents may use individual entries from that source within the approved scope without asking about each individual lookup.

## 13. Governance Priority

Governance and templates should be completed before large rules, deckbuilding, or analytics modules.

Recommended early build order:

1. governance files
2. templates
3. startup/runtime files
4. source index
5. core rules backlog files
6. competitive backlog files
7. analytics backlog files
8. deck overlays

## 14. Current Established Structure

Top-level folders:

```text
governance/
core_rules/
competitive/
decks/
analytics/
glossary/
tests/
templates/
runtime/
changelogs/
error_logs/
sources/
scripts/
decisions/
features/
planning/
```

## 15. Standard Change Summary

Use this after every meaningful durable change:

```text
CHANGE SUMMARY
- Added:
- Removed:
- Clarified:
- Corrected:
- Refactored:

REASON
- Why this change was necessary.

AFFECTED FILES
- File list.

PRIORITY
- Immediate / Next Task / When Convenient / Optional.

DEPENDENCIES
- Follow-up work required.
```

## 16. Error Handling

If a system-building mistake occurs, apply the error correction and hardening policy.

Examples:

- wrong folder
- bad file name
- missing metadata
- ignored existing governance rule
- created too-large module
- asked too many questions
- skipped change summary
- used an unapproved recurring source as trusted
- deployed sub-agents without clear tasks

Material errors should create either a correction, a preventative rule, a template update, a runtime update, or an error log entry.

## 17. Do Not Start Content Too Early

Do not create large Yu-Gi-Oh rules, deckbuilding, or analytics content until the relevant template and source rules exist.

A small pilot module is acceptable once the module template and source index exist.

## 18. Next Recommended System Files

After this file, useful next files include:

```text
sources/001_approved_source_families.md
analytics/010_analytics_principles.md
glossary/000_official_rules_terms.md
glossary/010_deckbuilding_terms.md
```

## 19. Completion Criteria for System Foundation v0.1

System foundation v0.1 is complete when the repository has:

- core governance files
- core templates
- startup runtime file
- system-building runtime file
- source index
- task-specific runtime files
- sub-agent workflow policy
- decision record system
- feature registry
- a clear next-module backlog

After this, ResolveYGO can start creating pilot content modules.
