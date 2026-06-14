# 016 Feature Registry Policy

Status: DRAFTED
Version: v0.1
Category: governance
Scope: Rules for tracking durable ResolveYGO/YGOBrain features and capabilities
Owner: Admin
Last Updated: 2026-06-14
Applies To: Feature planning, implementation, runtime contexts, roles, skills, schemas, APIs, and governance updates
Task Modes: system-building
Keywords: feature registry, feature records, capability tracking, implementation planning
Depends On:
- governance/000_system_operating_rules.md
- governance/001_knowledge_architecture.md
- governance/015_decision_record_policy.md
- decisions/000_decision_index.md
Source Tier: Project governance
Verification Status: NEEDS_ADMIN_REVIEW
Retrieval Priority: HIGH
Related Modules:
- features/000_feature_registry.md
- templates/feature_record_template.md
- runtime/040_system_building_context.md
- AGENTS.md

## 1. Purpose

This policy defines how ResolveYGO/YGOBrain tracks durable features and capabilities.

The feature registry helps agents continue existing project work without relying on chat memory, duplicating capabilities, or starting implementation that conflicts with accepted decisions.

## 2. Relationship To Decision Records

Decision records answer what architectural or durable implementation choice has been accepted.

Feature records answer what capability exists, is planned, is in progress, or has been retired.

A feature may be covered by one or more ADRs. If a new feature creates a durable architecture, source, database, runtime, role, skill, schema, or API decision, agents must also check whether a new ADR is required.

## 3. Registry File

`features/000_feature_registry.md` is the master registry.

Agents should consult it before implementing or materially changing major features, roles, skills, runtime files, governance files, schemas, APIs, or database-backed capabilities.

## 4. Feature Statuses

Use only these statuses:

```text
PLANNED
IN_PROGRESS
IMPLEMENTED
BLOCKED
DEFERRED
RETIRED
```

Status meanings:

- PLANNED: The feature is known but implementation has not started.
- IN_PROGRESS: Foundational or partial implementation exists.
- IMPLEMENTED: The feature has been implemented and is ready for Admin review or use according to its verification gate.
- BLOCKED: The feature cannot proceed until a dependency or Admin decision is resolved.
- DEFERRED: The feature is intentionally postponed.
- RETIRED: The feature should no longer be used or extended.

## 5. Feature Awareness Rule

Before implementing or materially changing a durable feature, agents must:

1. Read `planning/000_current_focus_and_todos.md`.
2. Read `decisions/000_decision_index.md`.
3. Read relevant ADRs.
4. Read `features/000_feature_registry.md`.
5. State whether the task implements an existing decision, extends an existing decision, requires a new decision, or conflicts with an accepted decision.
6. Stop and ask Admin if there is a conflict.

## 6. Creation Rule

When creating a new standalone feature record:

- use `templates/feature_record_template.md`
- assign the next available feature ID
- keep the record focused on one capability
- link related ADRs and implementation files
- update `features/000_feature_registry.md`
- keep feature content DRAFTED or NEEDS_ADMIN_REVIEW unless Admin verifies it

## 7. Review And Verification

The assistant drafts. Admin verifies.

Feature registry policy, feature templates, and feature records remain DRAFTED until Admin reviews them.

## 8. Change Log

```text
2026-06-14
Status: DRAFTED
Change: Created feature registry policy.
Reason: Admin requested feature-awareness checks before implementation continues.
```
