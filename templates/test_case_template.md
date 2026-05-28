# [Test Suite Name]

Status: PLANNED
Version: v0.1
Category: tests
Scope: [What this test suite validates]
Owner: Simeon Fabowale-Makinde
Last Updated: YYYY-MM-DD

## 1. Purpose

This file defines test cases for validating a YGOBrain module.

Tests exist to prevent repeated mistakes, preserve verified reasoning, and make future changes safer.

## 2. Module Under Test

Module:

```text
[path/to/module.md]
```

Related Modules:

- [path/to/related_module.md]
- [path/to/related_module.md]

## 3. Test Scope

This test suite checks:

- [Item]
- [Item]
- [Item]

This test suite does not check:

- [Out-of-scope item]
- [Out-of-scope item]

## 4. Default Assumptions

Unless stated otherwise, assume:

- Yu-Gi-Oh TCG Advanced Format
- official cards only
- current official card text
- TCG rulings and policy are preferred
- OCG information is informative only when TCG authority is unavailable

## 5. Test Case Format

Use this format for each test:

```text
TEST ID:
TITLE:
TYPE:
STATUS:
PRIORITY:

QUESTION OR SCENARIO:
- 

EXPECTED ANSWER:
- 

REASONING:
- 

SOURCE STATUS:
- Officially Confirmed / Source-Backed / Simeon Verified / Inferred Not Verified / Source Needed

MODULES VALIDATED:
- 

NOTES:
- 
```

## 6. Test Types

Use one of the following types where practical:

```text
BASIC_RULE
EDGE_CASE
COMMON_MISTAKE
CONTRADICTION_CHECK
CARD_TEXT_PRECISION
CHAIN_TIMING
ACTIVATION_LEGALITY
RESOLUTION_LEGALITY
DECKBUILDING_DECISION
ANALYTICS_INTERPRETATION
SOURCE_AUTHORITY
RESPONSE_BEHAVIOUR
```

## 7. Test Statuses

Allowed statuses:

```text
PLANNED
DRAFTED
UNDER_REVIEW
PASSED
FAILED
NEEDS_SOURCE
NEEDS_REWRITE
DEPRECATED
```

## 8. Priority Labels

Use the standard YGOBrain priority labels:

- Immediate
- Next Task
- When Convenient
- Optional

## 9. Test Cases

### TEST ID: [MODULE]-001

TITLE:
- [Short title]

TYPE:
- [Test type]

STATUS:
- PLANNED

PRIORITY:
- [Immediate / Next Task / When Convenient / Optional]

QUESTION OR SCENARIO:
- [Describe the scenario]

EXPECTED ANSWER:
- [Expected answer]

REASONING:
- [Why this answer is correct]

SOURCE STATUS:
- [Officially Confirmed / Source-Backed / Simeon Verified / Inferred Not Verified / Source Needed]

MODULES VALIDATED:
- [path/to/module.md]

NOTES:
- [Optional]

### TEST ID: [MODULE]-002

TITLE:
- [Short title]

TYPE:
- [Test type]

STATUS:
- PLANNED

PRIORITY:
- [Immediate / Next Task / When Convenient / Optional]

QUESTION OR SCENARIO:
- [Describe the scenario]

EXPECTED ANSWER:
- [Expected answer]

REASONING:
- [Why this answer is correct]

SOURCE STATUS:
- [Officially Confirmed / Source-Backed / Simeon Verified / Inferred Not Verified / Source Needed]

MODULES VALIDATED:
- [path/to/module.md]

NOTES:
- [Optional]

## 10. Failure Handling

If a test fails, record:

```text
FAILED TEST:
FAILURE TYPE:
WHAT WENT WRONG:
ROOT CAUSE:
REQUIRED FIX:
AFFECTED FILES:
PRIORITY:
```

A failed material test should trigger the error correction and hardening workflow.

## 11. Review Checklist

Before marking this test suite as useful, check:

- [ ] Tests map to a specific module.
- [ ] Expected answers are clear.
- [ ] Reasoning is included.
- [ ] Source status is labelled.
- [ ] Edge cases are represented where useful.
- [ ] Common mistakes are represented where useful.
- [ ] Failed tests create follow-up work.

## 12. Sources

```text
Source Name:
Source Type:
Tier:
URL or Reference:
Format:
Date Checked:
Relevant Claim:
Confidence:
Notes:
```

## 13. Change Log

```text
YYYY-MM-DD
Status:
Change:
Reason:
```
