# 000 Decision Index

Status: DRAFTED
Version: v0.1
Category: decisions
Scope: Master index for ResolveYGO/YGOBrain architectural and implementation decisions
Owner: Admin
Last Updated: 2026-06-14
Applies To: Feature implementation, roles, skills, runtime files, database capabilities, architecture changes
Task Modes: system-building
Keywords: decisions, ADR, architecture, feature gate, implementation, conflict check
Depends On:
- governance/015_decision_record_policy.md
- templates/decision_record_template.md
Source Tier: Project governance
Verification Status: NEEDS_ADMIN_REVIEW
Retrieval Priority: HIGH
Related Modules:
- AGENTS.md
- runtime/000_startup_context.md
- runtime/040_system_building_context.md

## 1. Purpose

This index is the first place an implementation agent checks before changing architecture or adding durable features to ResolveYGO/YGOBrain.

It prevents duplicate architecture, conflicting feature additions, and silent contradictions of accepted project decisions.

## 2. Decision Check Rule

Before implementing any feature, role, skill, runtime file, database capability, integration, or durable architecture change:

1. Read this decision index.
2. Read any relevant decision records.
3. Check for conflict with ACCEPTED decisions.
4. If no conflict exists, proceed with focused implementation.
5. If a conflict exists, stop and ask Admin.
6. If the implementation creates a new durable architectural decision, add or update a decision record.

## 3. Decision Statuses

```text
PROPOSED
ACCEPTED
SUPERSEDED
REJECTED
DEPRECATED
```

## 4. Active Accepted Decisions

| Decision ID | Title | Status | Date | Summary | File |
| --- | --- | --- | --- | --- | --- |
| ADR-001 | Retrieval-First Architecture | ACCEPTED | 2026-06-13 | YGOBrain uses canonical markdown modules plus retrieval-first runtime loading instead of loading all markdown files into context. | decisions/ADR-001_retrieval_first_architecture.md |
| ADR-002 | Card Data Layer | ACCEPTED | 2026-06-13 | YGOBrain separates card facts, enrichment sources, and strategic reasoning. Local card facts are used first; API enrichment is only used when needed. | decisions/ADR-002_card_data_layer.md |
| ADR-003 | Supabase Primary Database | ACCEPTED | 2026-06-13 | Supabase is the primary database for YGOBrain app data unless a specific tool is clearly better for a narrow implementation need. | decisions/ADR-003_supabase_primary_database.md |
| ADR-004 | Tournament Companion Capability | ACCEPTED | 2026-06-13 | Tournament support should be implemented as a Tournament Companion role/context plus smaller reusable templates/skills, not as one giant skill. | decisions/ADR-004_tournament_companion_capability.md |
| ADR-005 | Project Identity And Chat Consolidation | ACCEPTED | 2026-06-14 | ResolveYGO is the final operating/project name; YGOBrain remains the current GitHub repository name unless separately renamed; one canonical Implementation Engineer / Git chat should be used going forward. | decisions/ADR-005_project_identity_and_chat_consolidation.md |

## 5. Proposed Decisions

No proposed decisions currently listed.

## 6. Superseded Decisions

No superseded decisions currently listed.

## 7. Rejected Decisions

No rejected decisions currently listed.

## 8. Deprecated Decisions

No deprecated decisions currently listed.

## 9. When To Add A Decision Record

Add or update a decision record when a change establishes a durable rule about:

- repository architecture
- runtime loading
- app data storage
- card data handling
- source or enrichment strategy
- roles, skills, or agent capabilities
- reusable templates or workflows
- integration boundaries
- database ownership
- implementation approach that future agents must preserve

Minor content updates do not require a decision record unless they create a reusable architectural rule.

## 10. Conflict Handling

If a proposed feature conflicts with an ACCEPTED decision:

1. Do not implement immediately.
2. Explain the conflict clearly.
3. Suggest either revising the feature or creating a new decision record that supersedes the old decision.
4. Wait for Admin direction.

## 11. Change Log

```text
2026-06-13
Status: DRAFTED
Change: Created master decision index and initial accepted decision list.
Reason: Admin requested a decision record system to prevent conflicting or duplicate architecture.

2026-06-14
Status: DRAFTED
Change: Added ADR-005 for project identity and chat consolidation.
Reason: Admin confirmed ResolveYGO as the final operating name and requested one canonical implementation/Git chat model.
```
