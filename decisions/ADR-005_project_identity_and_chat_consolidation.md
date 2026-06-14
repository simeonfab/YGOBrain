# ADR-005 Project Identity And Chat Consolidation

Status: ACCEPTED
Version: v0.1
Category: decisions
Scope: Project naming, repository identity, and canonical implementation chat model
Owner: Admin
Last Updated: 2026-06-14
Applies To: Project identity, repository references, implementation chats, Git chats, handoffs
Task Modes: system-building
Keywords: ResolveYGO, YGOBrain, project identity, implementation chat, Git chat, deprecated chat, handoff
Depends On:
- decisions/000_decision_index.md
- planning/001_project_identity_and_chat_model.md
Source Tier: Project governance
Verification Status: ADMIN_CONFIRMED
Retrieval Priority: HIGH
Related Modules:
- planning/000_current_focus_and_todos.md
- planning/001_project_identity_and_chat_model.md
- features/000_feature_registry.md
- AGENTS.md
- runtime/000_startup_context.md
- runtime/040_system_building_context.md

## Decision ID

ADR-005

## Title

Project Identity And Chat Consolidation

## Status

ACCEPTED

## Date

2026-06-14

## Owner

Admin

## Context

The project has used YGOBrain as the repository and legacy project name, while Admin has selected ResolveYGO as the final project operating name.

There may also be multiple Git or implementation chats with overlapping responsibilities. Continuing implementation from multiple chats creates risk of conflicting instructions, stale context, duplicate work, and commits against the wrong repository state.

## Decision

ResolveYGO is the final operating and project name.

YGOBrain remains the current GitHub repository name unless Admin separately approves a repository rename.

One canonical Implementation Engineer / Git chat should be used going forward.

Duplicate implementation or Git chats should be deprecated after useful historical context is captured into the repository.

## Rationale

Separating product/project identity from current GitHub repository identity lets the project consolidate around ResolveYGO without forcing an immediate repository rename.

Using one canonical implementation chat reduces drift and ensures future work resumes from repository context rather than chat memory.

## Alternatives Considered

- Immediately rename the GitHub repository.
- Continue using YGOBrain as both product name and repository name.
- Keep multiple implementation chats active.
- Bulk rename every existing project reference in one pass.

## Consequences

- Current operating docs should refer to ResolveYGO as the project name.
- Repository references may still use YGOBrain when referring to the current GitHub repository.
- Older chats should not continue implementation after a canonical implementation chat is selected.
- Historical context from older chats should be captured into repository files before it becomes an operating assumption.
- A future repository rename can be handled as a separate Admin-approved action.

## Affected Areas

- planning/
- decisions/
- features/
- runtime/
- AGENTS.md
- implementation and Git chat workflow
- handoff workflow

## Related Files

- planning/000_current_focus_and_todos.md
- planning/001_project_identity_and_chat_model.md
- decisions/000_decision_index.md
- features/000_feature_registry.md
- AGENTS.md
- runtime/000_startup_context.md
- runtime/040_system_building_context.md

## Supersedes

None

## Superseded By

None

## Follow-Up Work

- Admin should identify the canonical Implementation Engineer / Git chat.
- Deprecated implementation chats should be used only for historical context recovery.
- Consider a separate ADR if Admin later approves renaming the GitHub repository.
- Use ADR-006 for Knowledge Source Hierarchy unless Admin explicitly reserves a different number.

## Review Notes

- Initial decision supplied by Admin in the project naming and chat consolidation task.
- This ADR does not rename the GitHub repository.

## Change Log

```text
2026-06-14
Status: ACCEPTED
Change: Created project identity and chat consolidation decision.
Reason: Admin confirmed ResolveYGO as the final project name and requested one canonical implementation/Git chat going forward.
```
