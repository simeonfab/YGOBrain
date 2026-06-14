# ADR-001 Retrieval-First Architecture

Status: ACCEPTED
Version: v0.1
Category: decisions
Scope: Runtime loading and canonical markdown architecture
Owner: Admin
Last Updated: 2026-06-13
Applies To: Runtime files, retrieval manifest, canonical markdown modules, agent context loading
Task Modes: system-building
Keywords: retrieval-first, canonical markdown, runtime loading, context minimisation, architecture
Depends On:
- decisions/000_decision_index.md
- governance/008_retrieval_architecture.md
- runtime/000_startup_context.md
- runtime/090_retrieval_manifest.md
Source Tier: Project governance
Verification Status: ADMIN_CONFIRMED
Retrieval Priority: HIGH
Related Modules:
- AGENTS.md
- governance/008_retrieval_architecture.md
- runtime/000_startup_context.md
- runtime/090_retrieval_manifest.md

## Decision ID

ADR-001

## Title

Retrieval-First Architecture

## Status

ACCEPTED

## Date

2026-06-13

## Owner

Admin

## Context

YGOBrain needs to support large markdown knowledge, runtime files, governance, templates, and future app features without loading the full repository into every chat.

Loading all markdown files into context creates avoidable context bloat, slower operation, and higher risk that draft or irrelevant material is treated as authoritative.

## Decision

YGOBrain uses canonical markdown modules plus retrieval-first runtime loading instead of loading all markdown files into context.

## Rationale

Retrieval-first loading keeps runtime context small while preserving the markdown repository as the canonical source of truth.

It also makes task mode classification, source discipline, metadata, and Admin verification easier to enforce.

## Alternatives Considered

- Load all markdown files into every chat.
- Store all guidance in one large runtime prompt.
- Split the repository into isolated assistants with separate knowledge copies.

## Consequences

- Agents must classify task mode before retrieval.
- Runtime files must stay lightweight and point to canonical modules.
- Metadata and retrieval manifests become important operating infrastructure.
- Agents must not recursively load the whole repository unless the task is explicitly repository-wide.

## Affected Areas

- runtime/
- governance/
- templates/
- canonical markdown modules
- agent workflows
- retrieval and eval design

## Related Files

- AGENTS.md
- governance/008_retrieval_architecture.md
- runtime/000_startup_context.md
- runtime/090_retrieval_manifest.md
- tests/000_eval_plan.md

## Supersedes

None

## Superseded By

None

## Follow-Up Work

- Keep retrieval manifest updated as new modules, roles, and capabilities are added.
- Add retrieval evals for major workflows.
- Ensure future runtime files remain lightweight.

## Review Notes

- Initial decision supplied by Admin in the Master Decision Record system task.

## Change Log

```text
2026-06-13
Status: ACCEPTED
Change: Created initial accepted decision record.
Reason: Admin confirmed retrieval-first architecture as a durable YGOBrain decision.
```
