# Error Log Entry Template

Status: PLANNED
Version: v0.2
Category: error_logs
Scope: Standard structure for logging material YGOBrain errors
Owner: Simeon Fabowale-Makinde
Last Updated: YYYY-MM-DD

## 1. Purpose

This template defines how material errors should be logged in YGOBrain.

Error logs exist to prevent repeated mistakes. They should capture what went wrong, why it happened, how it was corrected, and what preventative action was taken.

## 2. Monthly Error Log File Naming

Use monthly error log files:

```text
error_logs/YYYY-MM.md
```

Example:

```text
error_logs/2026-06.md
```

## 3. Error Entry Format

```text
## ERR-YYYY-MM-DD-001 — [Short Title]

Date:
Reported By:
Status:
Error Type:
Priority:

Description:
- [What went wrong]

Root Cause:
- [Why it happened]

Correction:
- [What was corrected]

Preventative Action:
- [Rule, test, source note, warning, template update, or runtime update added]

Sub-Agent Involved:
- Yes / No

Top-Level Synthesis Issue:
- Yes / No

Source Family Status:
- Approved / Candidate / Limited Use / Unapproved / Not Applicable

Affected Files:
- [path/to/file.md]

Follow-Up:
- [Remaining work]

Verification:
- [How or by whom the fix was verified]

Notes:
- [Optional context]
```

## 4. Error Type Options

Use one or more of the following where practical:

```text
RULES_MISINTERPRETATION
PSCT_ERROR
CHAIN_ERROR
TIMING_ERROR
SUMMONING_ERROR
CARD_TEXT_ERROR
SOURCE_ERROR
UNAPPROVED_SOURCE_USE
OUTDATED_INFORMATION
FORMAT_CONFUSION
BAD_ASSUMPTION
ANALYTICS_ERROR
DECKBUILDING_ERROR
WORKFLOW_ERROR
RESPONSE_BEHAVIOUR_ERROR
FILE_STRUCTURE_ERROR
MISSING_EDGE_CASE
AMBIGUOUS_WORDING
SUB_AGENT_SCOPE_ERROR
TOP_LEVEL_SYNTHESIS_ERROR
SUB_AGENT_UNVERIFIED_OUTPUT_ERROR
```

## 5. Status Options

```text
OPEN
CORRECTED
PREVENTION_ADDED
VERIFIED_RESOLVED
DEFERRED
WONT_FIX
```

## 6. Priority Labels

Use the standard YGOBrain priority labels:

- Immediate
- Next Task
- When Convenient
- Optional

## 7. When to Log an Error

Create an error log entry when:

- Simeon identifies a material assistant mistake
- a repeated mistake occurs
- a source is found to be wrong or misleading
- an unapproved recurring source is used as trusted
- a verified module becomes incorrect
- a runtime instruction causes bad behaviour
- a sub-agent exceeds scope
- a top-level agent fails to synthesize or check sub-agent output
- a deckbuilding recommendation is materially misleading
- an analytics interpretation is materially wrong
- a format confusion issue occurs
- a rules or card text error could recur

Minor wording fixes do not always need error log entries.

## 8. Preventative Action Options

A logged error should consider one or more preventative actions:

- update governance
- update source hierarchy
- update approved source family list
- update response methodology
- update sub-agent workflow policy
- update a module
- update a template
- update runtime context
- add a test case
- add an edge case
- add a common mistake warning
- demote or qualify a source
- add a source requirement
- tighten sub-agent task scope
- require top-level synthesis checklist

## 9. Closure Checklist

Before marking an error as VERIFIED_RESOLVED, check:

- [ ] The immediate issue was corrected.
- [ ] The root cause was identified.
- [ ] Preventative action was considered.
- [ ] A file update was made if needed.
- [ ] A test or warning was added if useful.
- [ ] Source family approval status was checked if relevant.
- [ ] Sub-agent scope was checked if relevant.
- [ ] Top-level synthesis was checked if relevant.
- [ ] Follow-up work was assigned a priority.
- [ ] Simeon verified or accepted the resolution.

## 10. Example Entry

```text
## ERR-2026-06-02-001 — Unapproved Decklist Source Used as Trusted

Date: 2026-06-02
Reported By: Simeon
Status: PREVENTION_ADDED
Error Type: UNAPPROVED_SOURCE_USE / SOURCE_ERROR
Priority: Immediate

Description:
- Assistant treated a new decklist website as a trusted recurring source without first asking Simeon to approve the source family.

Root Cause:
- Missing source-family approval check before agent research.

Correction:
- Reclassified the source as CANDIDATE until Simeon review.

Preventative Action:
- Updated source approval gate in runtime files.
- Added source family approval fields to source templates.

Sub-Agent Involved:
- Yes

Top-Level Synthesis Issue:
- Yes

Source Family Status:
- Unapproved

Affected Files:
- sources/000_source_index.md
- governance/007_sub_agent_workflow_policy.md

Follow-Up:
- Simeon to approve or reject the source family.

Verification:
- Needs Simeon review.

Notes:
- Individual entries from approved sources do not need separate approval unless unusual, contradictory, or high-impact.
```
