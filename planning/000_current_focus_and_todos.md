# 000 Current Focus and TODOs

Status: DRAFTED
Version: v0.1
Category: planning
Owner: Admin
Last Updated: 2026-06-13

## 1. Purpose

This file records the current YGOBrain workstream, recent decisions, and immediate follow-up tasks so future chats and implementation agents can resume without relying on conversation memory.

## 2. Recent Decisions and Direction

The following decisions are now active or already represented in the decision system:

- ADR-001: Retrieval-first architecture.
- ADR-002: Card data layer is separated from strategic reasoning.
- ADR-003: Supabase is the primary database unless another tool is specifically better for a narrow use case.
- ADR-004: Tournament Companion should be implemented as one role/runtime context supported by smaller reusable skills/templates, not as one giant skill.

Recommended next ADR:

- ADR-005: Knowledge Source Hierarchy.

Suggested hierarchy:

```text
Official Card Facts
↓
Approved API Sources
↓
Verified YGOBrain Knowledge
↓
Draft Knowledge
↓
Community Sources
↓
AI Inference
```

## 3. Current Card Data Architecture

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
- banlists
- legality
- set/release data

Current intended flow:

```text
Local Card Repository
↓
Supabase Cache
↓
On-Demand YGOResources API Enrichment
↓
YGOBrain Strategic Layer
```

Core rule:

- Use the local Supabase-backed card data first.
- Only call external APIs when required for a specific user request or when needed for correctness.
- Do not enrich out of curiosity.
- Do not enrich every candidate card during broad search.
- Narrow candidates first, then enrich selected cards if needed.
- Do not run background enrichment unless it is explicitly configured as a sync job.

## 4. Immediate TODOs

### Priority 1

1. Complete Feature Registry implementation.

Expected files:

```text
features/000_feature_registry.md
governance/016_feature_registry_policy.md
templates/feature_record_template.md
```

2. Complete Supabase card database implementation.

Required capabilities:

- importer
- schema
- exact lookup
- fuzzy lookup
- text search
- filtered search
- recommendation candidate search

3. Implement YGOResources enrichment layer.

Rules:

- local DB first
- API only when needed
- cache enrichment results
- no background enrichment by default

### Priority 2

4. Create ADR-005 Knowledge Source Hierarchy.

### Priority 3

5. Implement Tournament Companion capability.

Likely files:

```text
runtime/090_tournament_companion_context.md
templates/event_prep_template.md
templates/round_log_template.md
templates/game_log_template.md
templates/post_event_review_template.md
analytics/020_tournament_tracking_principles.md
competitive/030_matchup_and_side_plan_tracking.md
```

Required capabilities:

- event prep
- round logging
- match review
- matchup tracking
- side deck tracking
- mistake tracking
- tournament analytics
- post-event review

### Priority 4

6. Build tournament storage.

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

## 5. Recommended Resume Order

```text
1. Feature Registry
2. ADR-005 Knowledge Source Hierarchy
3. Supabase Card Database Implementation
4. API Enrichment Layer
5. Tournament Companion
```

## 6. Change Log

```text
2026-06-13
Status: DRAFTED
Change: Created current focus and TODO record.
Reason: Preserve recent YGOBrain decisions and implementation priorities across chats and devices.
```
