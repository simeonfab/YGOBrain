# 004 Update and Changelog Policy

Status: DRAFTED
Version: v0.1
Scope: Update rules, changelog requirements, priority labels, and maintenance workflow
Owner: Admin
Last Updated: 2026-05-28

## 1. Purpose

This file defines how YGOBrain changes should be proposed, made, summarized, prioritized, and tracked.

The goal is to keep the system maintainable as it grows.

Every meaningful update should make the knowledge base clearer, more accurate, or easier to use.

## 2. Core Principle

Changes should be deliberate, reviewable, and easy to understand.

Prefer small focused updates over large rewrites.

## 3. Source of Truth Rule

Canonical markdown files are the source of truth.

Runtime files, summaries, and exports are derived artifacts unless explicitly promoted into canonical files.

When a canonical file and a derived runtime file conflict, the canonical file wins.

## 4. When an Update Is Required

An update should be made or recommended when:

- a rule, process, or source policy changes
- Admin identifies a mistake
- a recurring issue appears
- a module needs clarification
- a source becomes outdated or unreliable
- a new source is approved
- a deckbuilding or analytics workflow becomes repeatable
- a temporary assumption needs to be resolved
- runtime instructions need to reflect canonical changes

## 5. Update Types

Use these categories when describing updates:

### Added

New content, files, rules, examples, tests, sources, or workflows.

### Removed

Content intentionally deleted because it is wrong, duplicated, obsolete, or out of scope.

### Clarified

Existing content made clearer without changing its intended meaning.

### Corrected

Existing content changed because it was wrong or misleading.

### Refactored

Structure changed without materially changing meaning.

### Deprecated

Content retained for history but marked as no longer preferred.

### Superseded

Content replaced by newer content.

## 6. Mandatory Change Summary Rule

After every meaningful change, provide a summary using this structure:

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

If a field does not apply, it may be omitted.

## 7. Priority Labels

Use plain-English labels.

### Immediate

Use when the issue affects correctness, governance, source authority, file integrity, or core runtime behaviour.

Immediate updates should be handled before continuing adjacent work.

### Next Task

Use when the update should happen soon and affects nearby work, but does not block the current step.

### When Convenient

Use for improvements that are useful but not blocking.

### Optional

Use for enhancements, polish, or convenience improvements.

## 8. Update Recommendation Rule

If an update is advisable but not made immediately, the assistant should explicitly recommend it and assign a priority.

Example:

```text
Recommended update: Add this example to the targeting test file.
Priority: Next Task.
```

## 9. Atomic Update Rule

Each update should affect the smallest reasonable set of files.

Avoid bundling unrelated changes together.

Good:

```text
Update source hierarchy to clarify OCG handling.
```

Bad:

```text
Rewrite all governance files and add deckbuilding theory at the same time.
```

## 10. Reviewability Rule

Updates should be easy for Admin to verify.

Prefer:

- clear diffs
- focused files
- short sections
- explicit change summaries
- stable terminology

Avoid:

- broad rewrites
- mixed topics
- hidden assumptions
- unsourced rulings

## 11. Changelog File Policy

Important project changes should be logged in the `changelogs/` folder.

Recommended file structure:

```text
changelogs/YYYY-MM.md
```

Example:

```text
changelogs/2026-05.md
```

Small changes may be summarized in chat only unless they affect governance, source policy, verified rules, or runtime files.

## 12. Changelog Entry Format

Use this format:

```text
## YYYY-MM-DD — Short Title

Type:
Priority:
Status:

Changed:
- 

Reason:
- 

Affected Files:
- 

Follow-Up:
- 
```

## 13. Update Lifecycle

Recommended lifecycle:

```text
PROPOSED -> DRAFTED -> REVIEWED -> APPLIED -> VERIFIED
```

For simple changes, PROPOSED and DRAFTED may happen together.

Only Admin can mark a substantive knowledge update as VERIFIED unless verification is explicitly delegated.

## 14. Runtime Update Rule

When canonical files change, check whether runtime files need updating.

Runtime files should not drift from canonical files.

If runtime files are outdated, mark the update priority based on impact:

- Immediate: runtime now gives wrong instructions
- Next Task: runtime is missing useful new guidance
- When Convenient: runtime can be polished later
- Optional: runtime change is cosmetic

## 15. Source Update Rule

When a source changes status, update source tracking.

Examples:

- a source becomes approved
- a source is found unreliable
- a source is outdated
- a source is format-specific
- an official source supersedes a community source

## 16. Error-Driven Update Rule

If a mistake is discovered, check whether the correction requires:

- a file update
- a new rule
- a new test
- a new source note
- a new warning
- a runtime instruction
- an error log entry

Do not only correct the immediate answer if the mistake could recur.

## 17. No Silent Update Rule

Do not make durable changes without explaining them.

Every durable change should have a reason.

## 18. Dependency Check Rule

Before or after changing a file, check whether related files are affected.

Examples:

- updating source hierarchy may affect response methodology
- updating a rule module may affect tests
- updating a deck module may affect runtime deck overlay context
- updating analytics methodology may affect templates

## 19. Manual vs Automated Updates

When possible, use automation for file operations.

Preferred order:

1. Direct GitHub update when available and appropriate.
2. PowerShell commands for local repo work.
3. Manual steps only when needed.

## 20. Commit Message Rule

Commit messages should be short and descriptive.

Examples:

```text
Add source hierarchy governance
Update response methodology
Add module template
Correct OCG source handling
```

Avoid vague commit messages such as:

```text
Updates
Stuff
Changes
```
