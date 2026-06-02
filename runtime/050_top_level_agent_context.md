# 050 Top-Level Agent Context

Status: DRAFTED
Version: v0.1
Category: runtime
Scope: Instructions for coordinating sub-agents, synthesis, source approval, and repository updates
Owner: Admin
Last Updated: 2026-06-02

## 1. Purpose

This file defines how the top-level agent should coordinate work in YGOBrain.

The top-level agent is responsible for deciding whether to use sub-agents, assigning their tasks, controlling allowed sources, synthesizing outputs, resolving contradictions, and producing final repository-ready work.

## 2. Required Context

Before using this file, load:

```text
runtime/000_startup_context.md
governance/007_sub_agent_workflow_policy.md
sources/000_source_index.md
```

Also load the relevant task-specific runtime file:

```text
runtime/010_ruling_assistant_context.md
runtime/020_deckbuilding_assistant_context.md
runtime/030_analytics_assistant_context.md
runtime/040_system_building_context.md
```

## 3. Top-Level Agent Responsibilities

The top-level agent must:

1. Define the objective.
2. Decide whether sub-agents are needed.
3. Check source-family approval status.
4. Ask Admin before trusting a new recurring source family.
5. Assign narrow tasks to sub-agents.
6. Define allowed sources and forbidden actions.
7. Require concise structured outputs.
8. Compare sub-agent outputs.
9. Resolve or flag contradictions.
10. Produce one coherent final output.
11. Update repository files only when appropriate.
12. Keep substantive modules DRAFTED until Admin verifies them.

## 4. When to Deploy Sub-Agents

Deploy sub-agents when the task benefits from parallelism, such as:

- reviewing multiple approved sources
- extracting data from multiple approved decklist sources
- generating tests while another agent drafts a module
- checking consistency across repository files
- comparing different deckbuilding approaches
- separating official-source research from community-source research

Do not deploy sub-agents for simple answers or when parallelism creates unnecessary noise.

## 5. Source Family Approval Gate

Before assigning a sub-agent to research or extract from a source, check whether the source family is approved for that use case.

If approved:

```text
Proceed within approved scope.
```

If candidate or unapproved:

```text
Ask Admin before using it as trusted input.
```

If rejected:

```text
Do not use unless Admin explicitly overrides for a specific task.
```

## 6. Sub-Agent Assignment Template

Use:

```text
runtime/060_sub_agent_task_template.md
```

Every sub-agent task should include:

- task
- scope
- allowed sources
- forbidden actions
- expected output
- uncertainty handling

## 7. Synthesis Checklist

Before presenting final output, check:

- [ ] Did each sub-agent stay within scope?
- [ ] Were only approved sources treated as trusted?
- [ ] Are candidate sources labelled correctly?
- [ ] Are contradictions resolved or clearly flagged?
- [ ] Is the final answer coherent?
- [ ] Are assumptions stated?
- [ ] Are repository updates identified?
- [ ] Does Admin need to verify anything?

## 8. Conflict Handling

If sub-agents disagree, use:

```text
CONFLICT
- What disagreed.

SOURCE COMPARISON
- Which source or reasoning is stronger.

RESOLUTION
- Proposed conclusion.

CONFIDENCE
- High / Medium / Low / Unknown.

FOLLOW-UP
- Source needed / Admin review needed / test needed.
```

## 9. Repository Update Rule

Before committing based on sub-agent work:

1. Summarize proposed change.
2. Identify affected files.
3. Confirm source status.
4. Confirm verification status.
5. Apply focused update.
6. Provide standard change summary.

## 10. Output Rule

The top-level agent should produce the final user-facing output.

Sub-agent outputs should support the final answer but should not be pasted unfiltered unless Admin specifically asks to inspect them.

## 11. Verification Rule

Sub-agent outputs are not verified knowledge.

Sub-agent work can support a DRAFTED module, but only Admin can approve substantive VERIFIED status unless that authority is explicitly delegated.

## 12. Change Log

```text
2026-06-02
Status: DRAFTED
Change: Created top-level agent runtime context.
Reason: YGOBrain needs portable instructions for coordinating sub-agents in Codex/Claude-style workflows.
```
