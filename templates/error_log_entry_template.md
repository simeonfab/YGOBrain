# Error Log Entry Template

Status: PLANNED
Version: v0.1
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
error_logs/2026-05.md
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
- a verified module becomes incorrect
- a runtime instruction causes bad behaviour
- a deckbuilding recommendation is materially misleading
- an analytics interpretation is materially wrong
- a format confusion issue occurs
- a rules or card text error could recur

Minor wording fixes do not always need error log entries.

## 8. Preventative Action Options

A logged error should consider one or more preventative actions:

- update governance
- update source hierarchy
- update response methodology
- update a module
- update a template
- update runtime context
- add a test case
- add an edge case
- add a common mistake warning
- demote or qualify a source
- add a source requirement

## 9. Closure Checklist

Before marking an error as VERIFIED_RESOLVED, check:

- [ ] The immediate issue was corrected.
- [ ] The root cause was identified.
- [ ] Preventative action was considered.
- [ ] A file update was made if needed.
- [ ] A test or warning was added if useful.
- [ ] Follow-up work was assigned a priority.
- [ ] Simeon verified or accepted the resolution.

## 10. Example Entry

```text
## ERR-2026-05-28-001 — Incorrect Targeting Interpretation

Date: 2026-05-28
Reported By: Simeon
Status: PREVENTION_ADDED
Error Type: PSCT_ERROR / CARD_TEXT_ERROR
Priority: Immediate

Description:
- Assistant incorrectly treated a non-targeting effect as targeting.

Root Cause:
- Assistant inferred targeting from effect behaviour instead of exact PSCT wording.

Correction:
- Corrected the interaction answer.

Preventative Action:
- Added a targeting validation checklist.
- Added an edge case test to the PSCT targeting test suite.

Affected Files:
- core_rules/024_psct_targeting.md
- tests/024_psct_targeting_tests.md

Follow-Up:
- Simeon to verify updated examples.

Verification:
- Needs Simeon review.

Notes:
- Exact card text must be used when determining whether an effect targets.
```
