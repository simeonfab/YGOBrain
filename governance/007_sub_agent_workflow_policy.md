# 007 Sub-Agent Workflow Policy

Status: DRAFTED
Version: v0.1
Scope: Rules for using sub-agents, parallel research, multi-agent drafting, and synthesis workflows
Owner: Admin
Last Updated: 2026-06-02

## 1. Purpose

This file defines how YGOBrain should use sub-agents or parallel agent workflows.

The purpose is to allow complex work to be split across multiple focused agents while preserving correctness, source discipline, reviewability, and a single final source of truth.

Sub-agents should improve speed and coverage, not create uncontrolled conflicting outputs.

## 2. Core Principle

Sub-agents can gather, compare, draft, test, or analyze information, but the top-level agent remains responsible for synthesis, consistency, source discipline, and final output.

The top-level agent is accountable for:

- assigning clear tasks
- limiting scope
- controlling what sources are allowed
- checking source quality
- resolving contradictions
- merging outputs
- producing the final recommendation or file
- marking uncertainty
- asking Admin for verification where needed

The top-level agent must not blindly merge sub-agent outputs.

## 3. Source Approval Gate

At a top level, source families, websites, databases, and recurring data providers must be approved by Admin before they become trusted YGOBrain inputs.

This means:

- a sub-agent may use already-approved sources within their approved scope
- a sub-agent may propose a new source for review
- a sub-agent must not treat a new website, database, decklist source, ruling source, or community source as trusted until Admin approves it or the source is already covered by YGOBrain source policy

Individual facts, card entries, rulings, or deck lists from an already-approved source do not each require separate approval unless they are unusual, contradictory, or high-impact.

## 4. When to Ask Admin About Sources

Ask Admin before using a new recurring source category or website for durable project knowledge.

Examples:

- a new decklist website
- a new tournament result database
- a new judge resource
- a new rulings archive
- a new community database
- a new YouTube or creator source used for strategic claims
- a new spreadsheet or dataset intended to be reused

Do not ask Admin for every individual lookup from a source that has already been approved for that purpose.

## 5. When to Use Sub-Agents

Use sub-agents when the task benefits from parallel work.

Good use cases:

- researching multiple approved sources at once
- comparing official rulings, judge consensus, and community interpretation
- analyzing multiple deck lists
- extracting statistics from event results
- reviewing different parts of a large markdown set
- checking whether files are complete
- creating test cases for a module
- comparing possible card ratios
- analyzing different matchups
- drafting alternative versions of a module

Do not use sub-agents when:

- the task is simple
- one direct answer is enough
- the work requires a single precise ruling from exact card text
- parallel work would create more noise than value
- the source of truth is already clear
- Admin has asked for a concise answer only

## 6. Top-Level Agent Responsibilities

The top-level agent must:

1. Define the objective.
2. Decide whether sub-agents are needed.
3. Check whether sources are already approved.
4. Ask Admin before trusting a new recurring source family or website.
5. Assign each sub-agent a narrow task.
6. Give each sub-agent the relevant context and source rules.
7. Require each sub-agent to report assumptions and uncertainty.
8. Compare outputs.
9. Resolve contradictions.
10. Produce one coherent final output.
11. Recommend repository updates where needed.
12. Ask Admin for verification before marking substantive knowledge as verified.

## 7. Sub-Agent Task Design

Each sub-agent task should include:

```text
Task:
Scope:
Allowed Sources:
Relevant Files:
Source Rules:
Expected Output:
Do Not Do:
Uncertainty Handling:
```

## 8. Recommended Sub-Agent Roles

### Source Research Agent

Purpose:

- find official or approved high-quality sources
- classify source authority
- identify source gaps
- propose new sources for Admin approval

Output:

```text
Sources Used:
Sources Proposed for Approval:
Claims Supported:
Authority Tier:
Confidence:
Gaps:
```

### Rules Analyst Agent

Purpose:

- analyze PSCT, timing, chains, activation legality, and resolution legality

Output:

```text
Direct Answer:
Reasoning:
Source Status:
Uncertainty:
Edge Cases:
```

### Deckbuilding Analyst Agent

Purpose:

- classify card roles
- evaluate ratios
- identify cuts/additions
- propose testing hypotheses

Output:

```text
Deck Plan:
Role Classification:
Ratio Issues:
Recommendations:
Testing Notes:
```

### Analytics Agent

Purpose:

- process event, deck, matchup, or testing data
- identify trends and limitations

Output:

```text
Data Summary:
Findings:
Limitations:
Interpretation:
Decisions:
```

### Test Writer Agent

Purpose:

- create validation cases for modules
- identify edge cases and common failure modes

Output:

```text
Test Cases:
Expected Answers:
Failure Modes:
Modules Validated:
```

### Consistency Reviewer Agent

Purpose:

- check whether a new file contradicts existing governance, templates, runtime files, or source hierarchy

Output:

```text
Conflicts:
Missing Sections:
Unclear Claims:
Recommended Fixes:
```

## 9. Parallel Research Rule

When multiple agents research the same topic, each should work from a clearly separated angle.

Example:

```text
Agent 1: Official TCG sources only.
Agent 2: Approved judge/community sources only.
Agent 3: Existing YGOBrain file consistency.
```

The top-level agent should then synthesize the result and clearly state:

- what is official
- what is supported but unofficial
- what is inferred
- what still needs review

## 10. Contradiction Handling

If sub-agents disagree, the top-level agent must not hide the disagreement.

Use this structure:

```text
CONFLICT
- What agents disagreed on.

SOURCE COMPARISON
- Which source or argument is stronger.

RESOLUTION
- Final proposed interpretation.

CONFIDENCE
- High / Medium / Low / Unknown.

FOLLOW-UP
- Source needed / Admin review needed / test needed.
```

Official TCG sources override lower-tier sources.

Assistant inference does not override sources or Admin verification.

## 11. Output Discipline

Sub-agents should produce concise, structured outputs.

Avoid:

- long essays
- unsourced claims
- vague recommendations
- pretending uncertainty does not exist
- duplicating another agent's task
- making final project decisions independently

## 12. Verification Rule

Sub-agent outputs are never automatically verified.

A sub-agent can support a draft, but final knowledge still follows the standard review rule:

```text
Assistant drafts. Admin verifies.
```

Sub-agent work may be marked as:

```text
SUB_AGENT_DRAFT
NEEDS_TOP_LEVEL_SYNTHESIS
NEEDS_ADMIN_REVIEW
SOURCE_NEEDED
```

## 13. Repository Update Rule

Before making repository changes based on sub-agent work, the top-level agent should:

1. summarize the proposed change
2. identify affected files
3. resolve conflicts
4. assign priority
5. confirm whether Admin review is needed before commit

For small governance or template changes already approved by Admin, the top-level agent may commit directly and provide the standard change summary.

## 14. Multi-Agent Workflow Template

Use this structure when planning a multi-agent task:

```text
OBJECTIVE
- 

AGENTS
1. Agent:
   Task:
   Scope:
   Allowed Sources:
   Output:

2. Agent:
   Task:
   Scope:
   Allowed Sources:
   Output:

3. Agent:
   Task:
   Scope:
   Allowed Sources:
   Output:

SYNTHESIS PLAN
- How outputs will be merged.

VERIFICATION PLAN
- What Admin needs to review.

REPOSITORY IMPACT
- Files likely to change.
```

## 15. Example Workflow - Building a Rules Module

```text
OBJECTIVE
Create core_rules/024_psct_targeting.md.

AGENTS
1. Source Research Agent
   Task: Find official or approved high-authority targeting references.
   Allowed Sources: Official TCG sources and Admin-approved ruling resources only.
   Output: Source-backed claims and gaps.

2. Rules Analyst Agent
   Task: Draft targeting principles and edge cases.
   Allowed Sources: Existing approved YGOBrain sources only.
   Output: Draft definitions, examples, common mistakes.

3. Test Writer Agent
   Task: Create targeting validation tests.
   Allowed Sources: Existing module draft and approved sources only.
   Output: Test cases with expected answers.

4. Consistency Reviewer Agent
   Task: Compare draft against governance and source hierarchy.
   Allowed Sources: YGOBrain repository files.
   Output: Conflicts and missing sections.

SYNTHESIS PLAN
Top-level agent merges the findings into one module draft.

VERIFICATION PLAN
Admin reviews before status can become VERIFIED.

REPOSITORY IMPACT
- core_rules/024_psct_targeting.md
- tests/024_psct_targeting_tests.md
```

## 16. Example Workflow - Analyzing Deck Lists

```text
OBJECTIVE
Analyze multiple topping deck lists and extract deckbuilding implications.

AGENTS
1. Data Extraction Agent
   Task: Extract card counts and list structure.
   Allowed Sources: Admin-approved decklist sources only.
   Output: Cleaned data table.

2. Analytics Agent
   Task: Identify frequency, ratios, and trends.
   Allowed Sources: Cleaned data from approved sources.
   Output: Findings and limitations.

3. Deckbuilding Analyst Agent
   Task: Convert findings into practical deckbuilding implications.
   Allowed Sources: Cleaned data, existing deck modules, approved strategic sources.
   Output: Recommendations and testing hypotheses.

4. Consistency Reviewer Agent
   Task: Check whether recommendations conflict with existing deck modules.
   Allowed Sources: YGOBrain repository files.
   Output: Conflicts or update suggestions.

SYNTHESIS PLAN
Top-level agent separates raw findings from recommendations.

VERIFICATION PLAN
Admin reviews before durable deck module updates.

REPOSITORY IMPACT
- analytics/[relevant_file].md
- decks/[deck_name]/[relevant_file].md
```

## 17. Anti-Patterns

Avoid these sub-agent mistakes:

- deploying sub-agents without clear tasks
- giving every agent the same vague objective
- allowing agents to choose new trusted websites without approval
- treating a random website as trusted because it appeared useful once
- merging outputs without checking contradictions
- treating sub-agent confidence as proof
- allowing sub-agents to make final source-of-truth decisions
- creating large unreviewable outputs
- failing to preserve source hierarchy
- failing to ask Admin for verification
- using parallelism when a direct answer would be better

## 18. Completion Criteria

A sub-agent workflow is complete only when:

- each sub-agent output has been reviewed by the top-level agent
- source approval status is clear
- contradictions are resolved or flagged
- source status is clear
- final output is coherent
- repository updates are identified
- Admin review is requested where needed

## 19. Change Log

```text
2026-06-02
Status: DRAFTED
Change: Created sub-agent workflow policy.
Reason: Admin wants YGOBrain to support multi-agent workflows for research, data querying, module drafting, and future Codex/Claude-style implementation.
```
