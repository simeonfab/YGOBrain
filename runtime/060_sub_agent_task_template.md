# 060 Sub-Agent Task Template

Status: DRAFTED
Version: v0.1
Category: runtime
Scope: Reusable prompt structure for assigning sub-agent tasks in YGOBrain
Owner: Simeon Fabowale-Makinde
Last Updated: 2026-06-02

## 1. Purpose

This file provides a reusable structure for assigning focused sub-agent tasks.

Sub-agents should produce concise, scoped outputs that the top-level agent can synthesize. They should not make final source-of-truth decisions.

## 2. Required Context for Sub-Agents

Every sub-agent should receive only the context needed for its task, plus the relevant rules.

Minimum context:

```text
governance/002_source_hierarchy.md
governance/007_sub_agent_workflow_policy.md
runtime/060_sub_agent_task_template.md
```

Add task-specific runtime files when needed.

## 3. Task Template

```text
SUB-AGENT TASK

Agent Role:
- [Source Research Agent / Rules Analyst Agent / Deckbuilding Analyst Agent / Analytics Agent / Test Writer Agent / Consistency Reviewer Agent / Other]

Objective:
- [What this agent should accomplish]

Scope:
- [What is included]

Out of Scope:
- [What must not be done]

Allowed Sources:
- [Approved source families or repository files]

Candidate Sources:
- [Sources that may be proposed but not treated as trusted]

Forbidden Sources or Actions:
- [Sources/actions not allowed]

Relevant Files:
- [path/to/file.md]

Expected Output:
- [Exact format or sections expected]

Uncertainty Handling:
- Mark unknowns clearly.
- Do not invent sources, card text, rulings, or data.
- Use SOURCE_NEEDED or NEEDS_SIMEON_REVIEW where appropriate.

Return Format:
- Concise structured markdown.
```

## 4. Source Research Agent Output

```text
Sources Used:
- 

Sources Proposed for Approval:
- 

Claims Supported:
- 

Authority Tier:
- 

Confidence:
- 

Gaps:
- 
```

## 5. Rules Analyst Agent Output

```text
Direct Answer:
- 

Reasoning:
- 

Source Status:
- 

Uncertainty:
- 

Edge Cases:
- 
```

## 6. Deckbuilding Analyst Agent Output

```text
Deck Plan:
- 

Role Classification:
- 

Ratio Issues:
- 

Recommendations:
- 

Testing Notes:
- 
```

## 7. Analytics Agent Output

```text
Data Summary:
- 

Findings:
- 

Limitations:
- 

Interpretation:
- 

Decisions:
- 
```

## 8. Test Writer Agent Output

```text
Test Cases:
- 

Expected Answers:
- 

Failure Modes:
- 

Modules Validated:
- 
```

## 9. Consistency Reviewer Agent Output

```text
Conflicts:
- 

Missing Sections:
- 

Unclear Claims:
- 

Recommended Fixes:
- 
```

## 10. Sub-Agent Rules

Sub-agents must:

- stay within assigned scope
- use only allowed sources as trusted inputs
- label candidate sources clearly
- avoid final verification claims
- return concise structured output
- report uncertainty rather than guessing

Sub-agents must not:

- promote new sources to approved status
- mark modules VERIFIED
- rewrite unrelated files
- merge their own output into final project truth
- hide conflicts or uncertainty

## 11. Change Log

```text
2026-06-02
Status: DRAFTED
Change: Created sub-agent task template.
Reason: YGOBrain needs reusable task prompts for controlled multi-agent workflows.
```
