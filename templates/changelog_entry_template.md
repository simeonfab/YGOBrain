# Changelog Entry Template

Status: PLANNED
Version: v0.1
Category: changelogs
Scope: Standard structure for logging YGOBrain changes
Owner: Simeon Fabowale-Makinde
Last Updated: YYYY-MM-DD

## 1. Purpose

This template defines how meaningful YGOBrain changes should be recorded.

Changelogs should make it easy to understand what changed, why it changed, which files were affected, and what follow-up work remains.

## 2. Monthly Changelog File Naming

Use monthly changelog files:

```text
changelogs/YYYY-MM.md
```

Example:

```text
changelogs/2026-05.md
```

## 3. Changelog Entry Format

```text
## YYYY-MM-DD — [Short Title]

Type:
- Added / Removed / Clarified / Corrected / Refactored / Deprecated / Superseded

Priority:
- Immediate / Next Task / When Convenient / Optional

Status:
- Proposed / Drafted / Applied / Verified / Superseded

Change Summary:
- Added:
- Removed:
- Clarified:
- Corrected:
- Refactored:

Reason:
- [Why the change was necessary]

Affected Files:
- [path/to/file.md]

Dependencies:
- [Follow-up work required]

Verification:
- [Who or what verified the change]

Notes:
- [Optional context]
```

## 4. Change Type Definitions

### Added

New content, files, examples, tests, sources, or workflows.

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

## 5. Priority Definitions

### Immediate

Must be handled before continuing because it affects correctness, governance, source authority, or core runtime behaviour.

### Next Task

Should be handled soon and may affect nearby work, but does not block the current step.

### When Convenient

Useful improvement, not blocking.

### Optional

Enhancement, polish, or convenience improvement.

## 6. Review Checklist

Before finalizing a changelog entry, check:

- [ ] The change is described clearly.
- [ ] The reason is included.
- [ ] Affected files are listed.
- [ ] Priority is assigned.
- [ ] Dependencies or follow-up work are listed.
- [ ] Verification status is clear.

## 7. Example Entry

```text
## 2026-05-28 — Add Source Hierarchy Governance

Type:
- Added

Priority:
- Next Task

Status:
- Applied

Change Summary:
- Added source authority tiers.
- Added source confidence levels.
- Added OCG handling rule.

Reason:
- The project needs a consistent way to decide which sources are authoritative before creating rules modules.

Affected Files:
- governance/002_source_hierarchy.md

Dependencies:
- Create source entry template.
- Create source index.

Verification:
- Needs Simeon review.

Notes:
- OCG sources are informative only unless confirmed by TCG authority or explicitly approved for a specific use case.
```
