# ADR-004 Tournament Companion Capability

Status: ACCEPTED
Version: v0.1
Category: decisions
Scope: Tournament support role, context, templates, and skills
Owner: Admin
Last Updated: 2026-06-13
Applies To: Tournament support, roles, runtime files, templates, skills, deckbuilding and analytics workflows
Task Modes: system-building, deckbuilding, analytics
Keywords: tournament companion, tournament support, role, runtime context, templates, skills
Depends On:
- decisions/000_decision_index.md
- runtime/000_startup_context.md
- runtime/040_system_building_context.md
Source Tier: Project governance
Verification Status: ADMIN_CONFIRMED
Retrieval Priority: HIGH
Related Modules:
- runtime/020_deckbuilding_assistant_context.md
- runtime/030_analytics_assistant_context.md
- templates/

## Decision ID

ADR-004

## Title

Tournament Companion Capability

## Status

ACCEPTED

## Date

2026-06-13

## Owner

Admin

## Context

Tournament support can include deck registration, matchup notes, side deck plans, event logging, testing notes, round-by-round decisions, and post-event analytics.

Bundling all tournament support into one large skill would make the feature hard to review, reuse, test, or maintain.

## Decision

Tournament support should be implemented as a Tournament Companion role/context plus smaller reusable templates/skills, not as one giant skill.

## Rationale

A role/context can coordinate tournament workflows while smaller templates and skills keep each capability focused and reusable.

This matches ResolveYGO/YGOBrain's retrieval-first architecture and avoids creating an oversized, hard-to-review module.

## Alternatives Considered

- Create one giant tournament skill.
- Add tournament support only as ad hoc chat prompts.
- Split every tournament action into unrelated standalone files without a coordinating role.

## Consequences

- Tournament support should have a coordinating role or runtime context.
- Individual workflows should be split into reviewable templates or skills.
- Future tournament features should check this ADR before implementation.
- Agents should avoid creating a single oversized tournament module.

## Affected Areas

- runtime/
- templates/
- future skills
- deckbuilding workflows
- analytics workflows
- tournament support features

## Related Files

- runtime/020_deckbuilding_assistant_context.md
- runtime/030_analytics_assistant_context.md
- runtime/040_system_building_context.md
- templates/

## Supersedes

None

## Superseded By

None

## Follow-Up Work

- Decide whether the Tournament Companion needs its own runtime file.
- Create focused templates for tournament notes, match logs, side plans, and post-event review if needed.
- Add ADRs for durable tournament data storage decisions if needed.

## Review Notes

- Initial decision supplied by Admin in the Master Decision Record system task.

## Change Log

```text
2026-06-13
Status: ACCEPTED
Change: Created initial accepted decision record.
Reason: Admin confirmed Tournament Companion as a role/context plus reusable templates/skills.
```
