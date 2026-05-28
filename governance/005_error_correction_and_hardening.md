# 005 Error Correction and Hardening

Status: DRAFTED
Version: v0.1
Scope: Mistake handling, root cause analysis, recurrence prevention, and error logging
Owner: Simeon Fabowale-Makinde
Last Updated: 2026-05-28

## 1. Purpose

This file defines how YGOBrain should respond when the assistant makes a mistake or when incorrect, weak, unclear, or misleading content is discovered.

The purpose is not only to fix individual outputs. The purpose is to make repeated mistakes less likely.

Every material mistake should strengthen the system.

## 2. Core Principle

Fix the system, not just the answer.

If a mistake is found, YGOBrain should consider whether the underlying rules, templates, tests, source policy, runtime instructions, or workflow need to be updated.

## 3. Trigger Events

This policy applies when:

- Simeon says the assistant is wrong
- the assistant later identifies an earlier mistake
- a source contradicts existing content
- a verified module becomes outdated
- a recurring ambiguity appears
- a deckbuilding recommendation proves misleading
- an analytics method produces a bad conclusion
- a workflow causes repeated friction
- a runtime instruction causes poor assistant behaviour

## 4. Immediate Response Rule

When a mistake is identified, the assistant should:

1. acknowledge the correction directly
2. avoid defensiveness
3. correct the immediate issue
4. identify the likely cause
5. decide whether YGOBrain needs a durable update
6. recommend a priority for that update

The assistant should not simply acknowledge the mistake and continue as if nothing needs to change.

## 5. Error Categories

Use these categories where useful:

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

## 6. Root Cause Analysis

For material errors, identify why the mistake happened.

Possible root causes include:

- missing official source
- incorrect source priority
- relying on memory
- relying on paraphrased card text
- treating inference as fact
- confusing TCG with OCG or Master Duel
- missing edge case
- unclear module wording
- incomplete template
- weak runtime instruction
- insufficient tests
- overgeneralized strategic heuristic
- small or biased data sample

## 7. Permanent Fix Options

After identifying a mistake, choose one or more permanent fixes:

- update a governance rule
- update a source note
- update a core rules module
- update a competitive module
- update an analytics module
- add an example
- add an edge case
- add a test case
- add a warning
- update a template
- update a runtime file
- add an error log entry

Not every small mistake needs every fix, but every material mistake should be considered for hardening.

## 8. Error Logging Rule

Material errors should be logged in the `error_logs/` folder.

Recommended file structure:

```text
error_logs/YYYY-MM.md
```

Example:

```text
error_logs/2026-05.md
```

## 9. Error Log Entry Format

Use this format:

```text
## ERR-YYYY-MM-DD-001 — Short Title

Date:
Reported By:
Status:
Error Type:
Priority:

Description:
- 

Root Cause:
- 

Correction:
- 

Preventative Action:
- 

Affected Files:
- 

Follow-Up:
- 
```

## 10. Priority Rules

Use the standard priority labels.

### Immediate

Use when the error affects correctness, source authority, runtime behaviour, or could cause repeated bad outputs.

### Next Task

Use when the fix should happen soon but does not block the current work.

### When Convenient

Use when the fix is useful but not blocking.

### Optional

Use when the fix is mostly polish or additional coverage.

## 11. Recurring Error Escalation Rule

If the same type of mistake happens more than once, escalate it.

Recurring mistakes usually indicate a system weakness, not just an isolated failure.

Possible escalation actions:

- strengthen governance
- add a checklist
- add more tests
- update response methodology
- update runtime context
- split a confusing module
- improve source requirements

## 12. Edge Case Promotion Rule

If an edge case causes a mistake, promote it into a durable test or documented example.

Do not allow important edge cases to remain only in chat history.

## 13. Source Error Rule

If a mistake came from a weak, outdated, or misleading source, update source tracking.

Possible actions:

- demote the source
- mark it as format-specific
- add a warning
- replace it with a better source
- require corroboration before future use

## 14. Card Text Error Rule

If a mistake came from relying on remembered or paraphrased card text, add or reinforce a rule requiring exact card text for similar cases.

This is especially important for words such as:

- target
- destroy
- send
- discard
- tribute
- activate
- use
- then
- and if you do
- also
- if
- when
- once per turn

## 15. Format Confusion Rule

If a mistake came from confusing TCG with OCG, Master Duel, Rush Duel, Speed Duel, historic formats, or unofficial simulator behaviour, update the relevant module or runtime instruction.

YGOBrain defaults to TCG Advanced Format unless Simeon explicitly says otherwise.

## 16. Analytics Error Rule

If an analytics conclusion is wrong or misleading, identify whether the cause was:

- bad data
- missing data
- small sample size
- wrong metric
- calculation error
- biased interpretation
- unsupported recommendation

Then update the analytics method, template, or test case as appropriate.

## 17. Deckbuilding Error Rule

If a deckbuilding recommendation proves bad or misleading, identify whether the cause was:

- poor role classification
- wrong ratio assumption
- untested synergy
- metagame misunderstanding
- ignoring deck objective
- overvaluing theory over results
- failing to account for Simeon's preference

Then update the relevant competitive or deck module.

## 18. Response Behaviour Error Rule

If the assistant's behaviour is wrong, such as asking too many questions, over-explaining, ignoring established defaults, or failing to use PowerShell-first workflows, update response methodology or runtime instructions.

## 19. Do Not Overcorrect Rule

A single mistake should not automatically cause a large rewrite.

Prefer the smallest durable fix that prevents recurrence.

Use broad rewrites only when the root cause is structural.

## 20. Closure Rule

An error is resolved only when:

- the immediate answer or content is corrected
- the affected file is updated if needed
- a preventative action has been considered
- any material error is logged
- follow-up work is assigned a priority
