# 001 Project Identity And Chat Model

Status: DRAFTED
Version: v0.1
Category: planning
Scope: Canonical project naming and chat operating model for ResolveYGO
Owner: Admin
Last Updated: 2026-06-14
Applies To: Project identity, repository references, chat handoffs, implementation continuity
Task Modes: system-building
Keywords: project identity, ResolveYGO, YGOBrain, implementation chat, Git chat, deprecated chat, handoff
Depends On:
- planning/000_current_focus_and_todos.md
- decisions/000_decision_index.md
- features/000_feature_registry.md
Source Tier: Project runtime
Verification Status: NEEDS_ADMIN_REVIEW
Retrieval Priority: HIGH
Related Modules:
- decisions/ADR-005_project_identity_and_chat_consolidation.md
- AGENTS.md
- runtime/000_startup_context.md
- runtime/040_system_building_context.md

## 1. Purpose

This note defines the canonical project identity and chat operating model for ResolveYGO.

It prevents duplicate implementation chats, ambiguous project names, and chat-memory-only continuation.

## 2. Canonical Project Identity

Final project name:

```text
ResolveYGO
```

Current GitHub repository:

```text
simeonfab/YGOBrain
```

Repository rename status:

```text
The repository currently remains simeonfab/YGOBrain unless Admin separately approves a GitHub repository rename.
```

Naming interpretation:

- ResolveYGO is the product and project operating name.
- YGOBrain is the legacy name and current GitHub repository name.
- Do not bulk rename every instance of YGOBrain only to change naming.
- Use targeted updates where naming affects current operating context, governance, planning, or handoff clarity.

## 3. Canonical Chat Roles

Use one canonical chat per operating role going forward:

- Technical Strategy / Governance chat
- Implementation Engineer / Git chat
- QA / Validation chat
- Domain Knowledge / Deckbuilding chat
- Tournament Companion chat, future

The Implementation Engineer / Git chat is the canonical place for repository edits, commits, pushes, branch work, and implementation continuity.

## 4. Chat Deprecation Rule

If two chats cover the same role or purpose:

1. Keep the chat with the newest confirmed current context.
2. Mark the other chat deprecated in conversation or handoff notes.
3. Do not continue implementation in deprecated chats.
4. Use deprecated chats only to recover historical information.
5. Hand useful recovered context into the canonical chat and repository files.

All implementation should resume from repository context, not chat memory.

## 5. Handoff Rule

When historical information is recovered from an older chat, record it in the appropriate repository file before using it as a future operating assumption.

Preferred destinations:

- durable architecture decisions: `decisions/`
- durable features: `features/000_feature_registry.md`
- current queue and guardrails: `planning/000_current_focus_and_todos.md`
- runtime instructions: `runtime/`
- governance policy: `governance/`

## 6. Out Of Scope

This note does not:

- rename the GitHub repository
- delete old chats
- delete files
- bulk rename project content
- rewrite product or domain modules for naming alone

## 7. Review Notes

- Admin has stated the final project name is ResolveYGO.
- Admin has not approved a GitHub repository rename as part of this task.
- Existing YGOBrain references should be treated as legacy or repository-name references unless updated in targeted operating-context files.

## 8. Change Log

```text
2026-06-14
Status: DRAFTED
Change: Created canonical project identity and chat model note.
Reason: Admin requested consolidation around ResolveYGO as the final project name while preserving the current YGOBrain GitHub repository name.
```
