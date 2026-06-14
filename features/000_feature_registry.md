# 000 Feature Registry

Status: DRAFTED
Version: v0.1
Category: features
Scope: Master registry of ResolveYGO/YGOBrain durable features and capabilities
Owner: Admin
Last Updated: 2026-06-14
Applies To: Feature planning, implementation sequencing, runtime contexts, skills, schemas, APIs, and governance updates
Task Modes: system-building
Keywords: features, registry, capability, implementation, planning, YGOBrain
Depends On:
- governance/016_feature_registry_policy.md
- decisions/000_decision_index.md
Source Tier: Project governance
Verification Status: NEEDS_ADMIN_REVIEW
Retrieval Priority: HIGH
Related Modules:
- AGENTS.md
- runtime/000_startup_context.md
- runtime/040_system_building_context.md
- planning/000_current_focus_and_todos.md

## 1. Purpose

This registry lists durable ResolveYGO/YGOBrain capabilities so agents can distinguish existing planned features from new feature ideas.

It complements the decision index. ADRs record durable architectural decisions; this registry records feature awareness, implementation status, and related decision coverage.

## 2. Feature Statuses

```text
PLANNED
IN_PROGRESS
IMPLEMENTED
BLOCKED
DEFERRED
RETIRED
```

## 3. Initial Feature Registry

| Feature ID | Feature | Status | Decision Coverage | Summary | Related Files |
| --- | --- | --- | --- | --- | --- |
| FEATURE-001 | Retrieval First Architecture | IN_PROGRESS | ADR-001 | Runtime and repository workflows use retrieval-first loading instead of full-repo context loading. | governance/008_retrieval_architecture.md; runtime/090_retrieval_manifest.md |
| FEATURE-002 | Card Data Layer | PLANNED | ADR-002 | Card facts, enrichment sources, and strategic reasoning remain separated. | governance/009_card_knowledge_architecture.md; governance/010_card_database_schema.md |
| FEATURE-003 | Card Enrichment Layer | PLANNED | ADR-002 | External enrichment and strategic tags are layered on top of local card facts with source boundaries. | governance/013_card_enrichment_architecture.md; governance/014_card_enrichment_schema.md |
| FEATURE-004 | Tournament Companion | PLANNED | ADR-004 | Tournament support should be a coordinating role/context plus focused reusable templates or skills. | runtime/020_deckbuilding_assistant_context.md; runtime/030_analytics_assistant_context.md |
| FEATURE-005 | Decision Record System | IN_PROGRESS | ADR-001 | Decision index, ADR records, policy, and template guide durable architecture changes. | decisions/000_decision_index.md; governance/015_decision_record_policy.md; templates/decision_record_template.md |
| FEATURE-006 | Feature Registry | IN_PROGRESS | This registry | Feature registry, policy, and template track planned and active capabilities. | features/000_feature_registry.md; governance/016_feature_registry_policy.md; templates/feature_record_template.md |
| FEATURE-007 | Project Identity And Chat Consolidation | IN_PROGRESS | ADR-005 | ResolveYGO is the operating/project name, YGOBrain remains the current repository name, and implementation should consolidate into one canonical Git chat. | planning/001_project_identity_and_chat_model.md; decisions/ADR-005_project_identity_and_chat_consolidation.md |

## 4. Feature Awareness Rule

Before implementing or changing a durable feature, agents must:

1. Read this registry.
2. Check related ADRs in `decisions/000_decision_index.md`.
3. Identify whether the task implements, extends, supersedes, or conflicts with a listed feature.
4. Add or update a feature record when a durable capability is created, retired, or materially changed.

## 5. Verification Gate

This registry is DRAFTED and needs Admin review.

Agents may use it for planning and reconciliation, but must not treat feature status as Admin-verified unless the relevant feature or status is explicitly confirmed by Admin.

## 6. Change Log

```text
2026-06-14
Status: DRAFTED
Change: Created initial feature registry with six foundation features.
Reason: Reconciled YGOBrain continuation context with decision and feature awareness requirements.

2026-06-14
Status: DRAFTED
Change: Added FEATURE-007 for project identity and chat consolidation.
Reason: Admin requested canonical naming and chat operating model consolidation before further implementation.
```
