# 015 Decision Record Policy

Status: DRAFTED
Version: v0.1
Category: governance
Scope: Rules for creating, checking, updating, and superseding ResolveYGO/YGOBrain decision records
Owner: Admin
Last Updated: 2026-06-13
Applies To: Feature implementation, roles, skills, runtime files, database capabilities, architecture changes
Task Modes: system-building
Keywords: decision records, ADR, architecture decisions, feature conflicts, implementation checks
Depends On:
- governance/000_system_operating_rules.md
- governance/001_knowledge_architecture.md
- governance/006_module_creation_and_review_policy.md
- governance/008_retrieval_architecture.md
- runtime/000_startup_context.md
- decisions/000_decision_index.md
Source Tier: Project governance
Verification Status: NEEDS_ADMIN_REVIEW
Retrieval Priority: HIGH
Related Modules:
- templates/decision_record_template.md
- runtime/040_system_building_context.md
- AGENTS.md

## 1. Purpose

This policy defines the Master Decision Record system for ResolveYGO/YGOBrain.

Decision records preserve durable architectural, runtime, database, role, skill, and implementation decisions so future agents can add features safely without duplicating or contradicting existing architecture.

## 2. Decision Record Purpose

A decision record captures:

- what was decided
- why it was decided
- alternatives considered
- affected files or systems
- consequences
- status
- superseded decisions
- follow-up work

## 3. Decision Index Purpose

`decisions/000_decision_index.md` is the first place an implementation agent checks before changing architecture or adding features.

The index should list active accepted decisions, proposed decisions, superseded decisions, rejected decisions, and deprecated decisions.

## 4. Decision Statuses

Use only these decision statuses:

```text
PROPOSED
ACCEPTED
SUPERSEDED
REJECTED
DEPRECATED
```

Status meanings:

- PROPOSED: A draft decision that Admin has not accepted.
- ACCEPTED: An Admin-confirmed decision that agents must respect.
- SUPERSEDED: A previous decision replaced by a newer decision.
- REJECTED: A proposed decision that Admin declined.
- DEPRECATED: A decision no longer recommended, but not yet replaced by a specific superseding decision.

## 5. Required Decision Record Fields

Every decision record must include:

- Decision ID
- Title
- Status
- Date
- Owner
- Context
- Decision
- Rationale
- Alternatives Considered
- Consequences
- Affected Areas
- Related Files
- Supersedes
- Superseded By
- Follow-Up Work
- Review Notes

## 6. Decision Check Rule

Before implementing any feature, agent must:

1. Read `decisions/000_decision_index.md`.
2. Read any relevant ADRs.
3. Check for conflict with accepted decisions.
4. If no conflict exists, proceed with focused implementation.
5. If conflict exists, stop and ask Admin.
6. If implementation creates a new durable architectural decision, add or update an ADR.

## 7. Conflict Rule

If a proposed feature conflicts with an ACCEPTED decision:

1. Do not implement immediately.
2. Explain the conflict.
3. Suggest either revising the feature or creating a new ADR to supersede the old decision.
4. Wait for Admin direction.

## 8. Feature Classification Rule

When Admin raises a casual feature idea, classify it before implementation:

```text
minor content update
new capability
architecture decision
implementation task
```

Minor content updates usually do not need an ADR.

New capabilities, architecture decisions, database changes, reusable roles, reusable skills, and new runtime patterns usually require decision-log awareness and may require an ADR.

## 9. Creation Rule

When creating a new ADR:

- use `templates/decision_record_template.md`
- assign the next available ADR number
- keep the file focused on one decision
- set status to PROPOSED unless Admin has clearly accepted the decision
- update `decisions/000_decision_index.md`
- include related files and follow-up work

## 10. Supersession Rule

When one decision replaces another:

1. Create or update the new ADR.
2. Set the old ADR status to SUPERSEDED.
3. Set the old ADR `Superseded By` field to the new ADR.
4. Set the new ADR `Supersedes` field to the old ADR.
5. Update `decisions/000_decision_index.md`.

Do not silently contradict an ACCEPTED decision without this process.

## 11. Review And Verification

The assistant drafts. Admin verifies.

Decision records should remain PROPOSED unless Admin has confirmed the decision.

Decision policy and templates remain DRAFTED until Admin reviews them.

## 12. Change Log

```text
2026-06-13
Status: DRAFTED
Change: Created decision record policy.
Reason: Admin requested a Master Decision Record system for safe feature and architecture changes.
```
