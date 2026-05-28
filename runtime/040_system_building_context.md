# 040 System Building Context

Status: DRAFTED
Version: v0.1
Category: runtime
Scope: Runtime instructions for building and maintaining the YGOBrain repository
Owner: Simeon Fabowale-Makinde
Last Updated: 2026-05-28

## 1. Purpose

This file is the task-specific runtime context for system-building work in YGOBrain.

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

## 4. Default Workflow

Use this workflow for system-building tasks:

1. Identify the next required file or change.
2. Create or update the smallest useful file.
3. Commit directly to GitHub when access is available and appropriate.
4. Provide a change summary.
5. Assign priority.
6. Identify dependencies and next recommended file.

## 5. Question Discipline

Ask one question at a time by default.

Do not ask Simeon long setup lists.

Use established repository defaults unless the decision is genuinely blocked.

## 6. PowerShell First Rule

If Simeon needs to do local work, provide PowerShell commands first.

Manual steps are secondary.

Example:

```powershell
git clone https://github.com/simeonfab/YGOBrain.git
cd YGOBrain
git pull
```

## 7. GitHub Direct Update Rule

When GitHub access is available and Simeon has approved the action, prefer direct repository updates for simple file creation and edits.

After any direct GitHub update, report:

```text
CHANGE SUMMARY
REASON
AFFECTED FILES
PRIORITY
DEPENDENCIES
```

## 8. File Creation Rule

When creating a new file:

- use the correct folder
- use lowercase snake_case
- use numeric prefixes where ordering matters
- include metadata
- include scope
- include dependencies where useful
- include a change log section where useful

## 9. Update Rule

When updating an existing file:

- fetch the current file first where practical
- avoid overwriting unrelated content
- make the smallest useful change
- explain what changed
- check whether related files need updates

## 10. Governance Priority

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

## 11. Current Established Structure

Top-level folders:

```text
governance/
core_rules/
competitive/
decks/
analytics/
tests/
templates/
runtime/
changelogs/
error_logs/
sources/
scripts/
```

## 12. Standard Change Summary

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

## 13. Error Handling

If a system-building mistake occurs, apply the error correction and hardening policy.

Examples:

- wrong folder
- bad file name
- missing metadata
- ignored existing governance rule
- created too-large module
- asked too many questions
- skipped change summary

Material errors should create either a correction, a preventative rule, a template update, a runtime update, or an error log entry.

## 14. Do Not Start Content Too Early

Do not create large Yu-Gi-Oh rules, deckbuilding, or analytics content until the relevant template and source rules exist.

A small pilot module is acceptable once the module template and source index exist.

## 15. Next Recommended System Files

After this file, useful next files include:

```text
runtime/020_deckbuilding_assistant_context.md
runtime/030_analytics_assistant_context.md
runtime/010_ruling_assistant_context.md
scripts/scaffold_ygo_brain.ps1
```

## 16. Completion Criteria for System Foundation v0.1

System foundation v0.1 is complete when the repository has:

- core governance files
- core templates
- startup runtime file
- system-building runtime file
- source index
- at least one task-specific runtime file
- a clear next-module backlog

After this, YGOBrain can start creating pilot content modules.
