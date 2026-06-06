# Eval Test Template

Status: DRAFTED
Version: v0.1
Category: tests
Scope: Standard structure for retrieval-first YGOBrain evaluation tests
Owner: Admin
Last Updated: 2026-06-06
Applies To: Evaluation and regression testing across YGOBrain task modes
Task Modes: ruling, deckbuilding, analytics, system-building
Keywords: eval, test, regression, retrieval, source discipline, gold answer
Depends On:
- governance/008_retrieval_architecture.md
- runtime/090_retrieval_manifest.md
Source Tier: Project test framework
Verification Status: NEEDS_ADMIN_REVIEW
Retrieval Priority: HIGH
Related Modules:
- tests/000_eval_plan.md
- templates/test_case_template.md

## 1. Purpose

This template defines how to write evaluation tests for YGOBrain.

Eval tests check whether the assistant retrieves the right files, respects source hierarchy, avoids overclaiming, and gives useful answers.

## 2. Eval Test Format

```text
Test ID:
Question:
Task Mode:
Required Retrieval Files:
Expected Answer Points:
Forbidden Errors:
Source Discipline Checks:
Gold Answer / Admin Notes:
Pass / Fail:
Reviewer:
```

## 3. Field Guidance

### Test ID

Use a stable identifier.

Example:

```text
DECK-ROLE-001
RULING-PSCT-001
ANALYTICS-SAMPLE-001
SOURCE-DISCIPLINE-001
```

### Question

The user-facing question or prompt being tested.

### Task Mode

Use one or more:

```text
ruling
deckbuilding
analytics
system-building
source-discipline
```

### Required Retrieval Files

List the repo files the assistant should retrieve or consult.

Example:

```text
runtime/020_deckbuilding_assistant_context.md
competitive/011_card_roles.md
glossary/010_deckbuilding_terms.md
```

### Expected Answer Points

List the key points a correct answer should include.

### Forbidden Errors

List mistakes that should fail the test.

Examples:

- treats DRAFTED module as verified
- ignores official source hierarchy
- invents card text
- gives generic advice without using relevant module
- fails to mention uncertainty
- loads irrelevant large file set

### Source Discipline Checks

Check whether the answer:

- identifies relevant repo files
- labels DRAFTED or UNDER_REVIEW content as unverified
- respects approved source families
- avoids treating assistant inference as final authority
- distinguishes official rules from strategic framework

### Gold Answer / Admin Notes

Admin-approved ideal answer notes or expected direction.

### Pass / Fail

Use:

```text
PASS
FAIL
PARTIAL
NEEDS_REVIEW
```

### Reviewer

Who reviewed the result.

Example:

```text
Admin
Assistant
Codex
```

## 4. Example Eval

```text
Test ID: DECK-ROLE-001
Question: Is a card still a starter if it needs any discard to work?
Task Mode: deckbuilding
Required Retrieval Files:
- runtime/020_deckbuilding_assistant_context.md
- competitive/011_card_roles.md
- glossary/010_deckbuilding_terms.md
Expected Answer Points:
- It may be a 1.5-card starter, not a pure one-card starter.
- The discard requirement matters for ratio and hand-quality analysis.
- If the discard can be generic, it is different from needing a specific paired card.
Forbidden Errors:
- Calls it a one-card starter without qualification.
- Ignores discard requirement.
- Treats all starters as equal.
Source Discipline Checks:
- Identifies card-role module or glossary as relevant.
- Does not claim official rules authority for strategic terminology.
Gold Answer / Admin Notes:
- Use YGOBrain starter taxonomy.
Pass / Fail: NEEDS_REVIEW
Reviewer: Admin
```

## 5. Change Log

```text
2026-06-06
Status: DRAFTED
Change: Created eval test template.
Reason: Admin requested an eval/test scaffold as part of retrieval-first YGOBrain.
```
