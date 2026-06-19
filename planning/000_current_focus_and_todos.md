# 000 Current Focus And TODOs

Status: DRAFTED
Version: v0.3
Category: planning
Scope: Current ResolveYGO/YGOBrain continuation state and near-term implementation queue
Owner: Admin
Last Updated: 2026-06-19
Applies To: Continue Existing Project mode, implementation planning, reconciliation, and system-building
Task Modes: system-building
Keywords: current focus, todos, continuation, YGOBrain, ResolveYGO, ResolveOS, planning, Supabase, card database, backend phase 1
Depends On:
- AGENTS.md
- runtime/000_startup_context.md
- runtime/040_system_building_context.md
- decisions/000_decision_index.md
- features/000_feature_registry.md
- planning/001_project_identity_and_chat_model.md
- planning/002_supabase_card_database_phase_1_spec.md
- planning/003_supabase_card_database_phase_1_implementation_task.md
Source Tier: Project runtime
Verification Status: NEEDS_ADMIN_REVIEW
Retrieval Priority: HIGH
Related Modules:
- governance/015_decision_record_policy.md
- governance/016_feature_registry_policy.md
- templates/decision_record_template.md
- templates/feature_record_template.md
- planning/001_project_identity_and_chat_model.md
- planning/002_supabase_card_database_phase_1_spec.md
- planning/003_supabase_card_database_phase_1_implementation_task.md

## 1. Current Mode

ResolveYGO is operating under ResolveOS in Continue Existing Project mode.

Project operating name:

```text
ResolveYGO
```

Current GitHub repository:

```text
simeonfab/YGOBrain
```

YGOBrain remains the current repository and legacy name unless Admin separately approves a repository rename.

Agents should continue from repository context, not chat memory, whenever the relevant repository file exists.

## 2. Active Decisions

The current decision index lists these accepted decisions:

```text
ADR-001 Retrieval-First Architecture
ADR-002 Card Data Layer
ADR-003 Supabase Primary Database
ADR-004 Tournament Companion Capability
ADR-005 Project Identity And Chat Consolidation
```

The initial ADRs record Admin-confirmed decisions. The decision policy, index, and templates remain DRAFTED and need Admin review.

Recommended next ADR after Phase 1 implementation setup:

```text
ADR-006 Knowledge Source Hierarchy
```

Suggested hierarchy:

```text
Official Card Facts
-> Approved API Sources
-> Verified ResolveYGO Knowledge
-> Draft Knowledge
-> Community Sources
-> AI Inference
```

## 3. Active Features

The feature registry currently tracks:

```text
FEATURE-001 Retrieval First Architecture
FEATURE-002 Card Data Layer
FEATURE-003 Card Enrichment Layer
FEATURE-004 Tournament Companion
FEATURE-005 Decision Record System
FEATURE-006 Feature Registry
FEATURE-007 Project Identity And Chat Consolidation
```

Feature registry files are DRAFTED and need Admin review.

## 4. Current Guardrails

- Supabase Card Database Phase 1 scope is approved in `planning/002_supabase_card_database_phase_1_spec.md`.
- The narrow prepared implementation task is `planning/003_supabase_card_database_phase_1_implementation_task.md`.
- Implementation must follow the prepared task boundary exactly.
- Do not start Tournament Companion implementation until Admin explicitly requests it.
- Do not create duplicate ADRs or feature records when existing records cover the work.
- Before implementation, check current focus, decision index, relevant ADRs, feature registry, `planning/002_supabase_card_database_phase_1_spec.md`, and `planning/003_supabase_card_database_phase_1_implementation_task.md` where card database work is involved.
- Stop and ask Admin if a requested implementation conflicts with an accepted decision.
- Use ResolveYGO as the operating/project name.
- Treat YGOBrain as the current GitHub repository and legacy name until Admin approves a separate repository rename.
- Consolidate implementation and Git work into one canonical Implementation Engineer / Git chat.
- Deprecated or duplicate implementation chats should not continue implementation after useful context is captured.
- Implementation Engineer must not create tickets, broaden scope, or start unrelated backend/frontend work from the Phase 1 task.

## 5. Reconciled State

Decision system files exist in the working tree:

```text
decisions/000_decision_index.md
decisions/ADR-001_retrieval_first_architecture.md
decisions/ADR-002_card_data_layer.md
decisions/ADR-003_supabase_primary_database.md
decisions/ADR-004_tournament_companion_capability.md
decisions/ADR-005_project_identity_and_chat_consolidation.md
templates/decision_record_template.md
governance/015_decision_record_policy.md
```

Feature registry foundation files now exist:

```text
features/000_feature_registry.md
templates/feature_record_template.md
governance/016_feature_registry_policy.md
```

Decision, feature, and Phase 1 backend awareness is represented in:

```text
AGENTS.md
runtime/000_startup_context.md
runtime/040_system_building_context.md
planning/000_current_focus_and_todos.md
planning/001_project_identity_and_chat_model.md
planning/002_supabase_card_database_phase_1_spec.md
planning/003_supabase_card_database_phase_1_implementation_task.md
```

Current approved backend planning artifact:

```text
planning/002_supabase_card_database_phase_1_spec.md
```

Current prepared implementation task:

```text
planning/003_supabase_card_database_phase_1_implementation_task.md
```

## 6. Current Card Data Architecture

The YGOResources card-history repository is suitable as an offline source for:

- card IDs
- card names
- card text
- monster/spell/trap metadata
- attributes
- properties
- localisation

It is not sufficient by itself for:

- rulings
- Q&A
- confirmed current banlist status without approved freshness/source handling
- confirmed current legality without approved freshness/source handling
- set/release data

Current intended flow:

```text
Local Card Repository
-> Supabase Cache
-> On-Demand YGOResources API Enrichment
-> ResolveYGO Strategic Layer
```

Core rule:

- Use the local Supabase-backed card data first.
- Only call external APIs when required for a specific user request or when needed for correctness.
- Do not enrich out of curiosity.
- Do not enrich every candidate card during broad search.
- Narrow candidates first, then enrich selected cards if needed.
- Do not run background enrichment unless it is explicitly configured as a sync job.
- Banlist and legality fields may exist in the Phase 1 card schema, but must remain nullable/untrusted until populated from approved source/freshness metadata.

## 7. Immediate TODOs

Immediate:

- Admin should use or send `planning/003_supabase_card_database_phase_1_implementation_task.md` in the canonical Implementation Engineer / Git chat.
- Implementation Engineer should perform the required pre-coding repository inspection before making file changes.
- Admin review of decision policy, decision template, decision index, and initial ADRs remains outstanding.
- Admin review of feature registry policy, feature template, and initial feature registry remains outstanding.
- Deprecated or duplicate implementation chats should be used only to recover historical context, then hand off into the canonical chat and repository files.

Priority 1:

1. Run the narrow Supabase Card Database Phase 1 implementation task.
2. Validate schema, lookup, fuzzy lookup, text search, metadata search, source/freshness handling, banlist/legality guardrails, and missing-data behaviour.
3. Complete Feature Registry implementation/review.
4. Plan YGOResources enrichment layer after local-first card database boundaries are implemented and validated.

Priority 2:

5. Create ADR-006 Knowledge Source Hierarchy.

Priority 3:

6. Plan Tournament Companion capability.

Likely future files:

```text
runtime/090_tournament_companion_context.md
templates/event_prep_template.md
templates/round_log_template.md
templates/game_log_template.md
templates/post_event_review_template.md
analytics/020_tournament_tracking_principles.md
competitive/030_matchup_and_side_plan_tracking.md
```

Required future capabilities:

- event prep
- round logging
- match review
- matchup tracking
- side deck tracking
- mistake tracking
- tournament analytics
- post-event review

Priority 4:

7. Plan tournament storage.

Suggested entities:

```text
Event
Round
Game
Lesson
Matchup
Sideboard Observation
Focus Point
```

This storage should eventually support:

- matchup statistics
- mistake trends
- sideboarding effectiveness
- deck update recommendations

## 8. Recommended Resume Order

```text
1. Use planning/003_supabase_card_database_phase_1_implementation_task.md in the canonical Implementation Engineer / Git chat
2. Implementation Engineer pre-coding repository inspection
3. Supabase Card Database Phase 1 implementation within approved scope
4. Phase 1 validation evidence review
5. Feature Registry implementation/review
6. ADR-006 Knowledge Source Hierarchy
7. API Enrichment Layer planning
8. Tournament Companion planning
```

## 9. Change Log

```text
2026-06-13
Status: DRAFTED
Change: Created current focus and TODO record.
Reason: Preserve recent YGOBrain decisions and implementation priorities across chats and devices.

2026-06-14
Status: DRAFTED
Change: Added ResolveYGO project identity and canonical implementation/Git chat consolidation guidance.
Reason: Admin requested final project naming and chat operating model consolidation before further implementation.

2026-06-14
Status: DRAFTED
Change: Reconciled remote current-focus card-data priorities with local governance, decision, feature, and chat consolidation records.
Reason: Remote main added a current-focus file before the governance consolidation commit was pushed.

2026-06-19
Status: DRAFTED
Change: Updated current focus to reference the Supabase Card Database Phase 1 planning specification as the active backend planning artifact.
Reason: Admin approved creating a durable GitHub planning file for Phase 1 backend scope, including banlist status as a core but source-guarded field.

2026-06-19
Status: DRAFTED
Change: Updated current focus after Admin approved the Phase 1 spec and Technical Strategy Lead prepared the narrow implementation task.
Reason: Future sessions need to resume from the prepared implementation task rather than re-planning or broadening scope.
```
