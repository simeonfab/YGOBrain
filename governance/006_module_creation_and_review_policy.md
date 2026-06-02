# 006 Module Creation and Review Policy

Status: DRAFTED
Version: v0.1
Scope: Rules for creating, reviewing, clarifying, and verifying YGOBrain modules
Owner: Simeon Fabowale-Makinde
Last Updated: 2026-06-02

## 1. Purpose

This file defines how YGOBrain modules should be created and reviewed.

The goal is to make every module small, reviewable, useful, and explicitly verified by Simeon before it becomes trusted project knowledge.

## 2. Core Rule

For each module, the assistant drafts and Simeon verifies.

No substantive module should be treated as VERIFIED until Simeon has reviewed or approved it.

## 3. Module Creation Workflow

Use this workflow for every new module:

1. Identify the module to create.
2. Check whether the module needs clarifying questions.
3. Ask only the minimum necessary questions.
4. Draft the module using the relevant template.
5. Mark the module as DRAFTED, not VERIFIED.
6. Summarize what was created.
7. Ask Simeon to verify, correct, or approve it.
8. Patch the module if needed.
9. Only mark VERIFIED after Simeon approves.

## 4. Clarifying Question Rule

Ask clarifying questions only when they materially affect the module.

Ask one question at a time by default.

Ask two or three questions only when clearly efficient.

Do not ask long question lists unless Simeon explicitly requests them.

If a reasonable default already exists in governance, use the default rather than asking again.

## 5. Verification Gate Rule

Every new substantive module must include a verification gate.

The assistant should clearly state:

```text
Verification needed from Simeon before this module can be marked VERIFIED.
```

The module should remain in one of these statuses until approved:

```text
PLANNED
DRAFTED
UNDER_REVIEW
```

## 6. Review Burden Rule

Simeon should verify, not rewrite from scratch.

The assistant should make each module:

- structured
- focused
- short enough to review
- explicit about assumptions
- explicit about source status
- easy to patch

## 7. Small Module Rule

Prefer small modules over large comprehensive drafts.

If a module becomes too large, split it before drafting or mark the oversized section as needing future decomposition.

## 8. Source and Confidence Rule

Each module should distinguish:

- official source-backed claims
- community-supported claims
- Simeon-verified claims
- assistant inference
- claims needing source verification

Assistant inference must not be treated as final knowledge.

## 9. Post-Draft Review Prompt

After creating a module, the assistant should ask for verification in a concise way.

Recommended wording:

```text
Please verify whether this draft is directionally correct. If anything is wrong, I will patch the module and add a prevention note if needed.
```

## 10. Patch Rule

If Simeon corrects a module, the assistant should:

1. identify the incorrect section
2. patch the file
3. provide a change summary
4. consider whether a test, warning, or error log entry is needed
5. keep the module as DRAFTED or UNDER_REVIEW until approved

## 11. Approval Rule

Only Simeon can approve substantive module verification unless he explicitly delegates verification for a defined category.

When approved, update the module status to VERIFIED and log the change where appropriate.

## 12. Applies To

This policy applies to modules in:

- core_rules/
- competitive/
- analytics/
- decks/
- tests/
- sources/
- runtime/
- governance/

For simple placeholder files or scripts, full verification may be lighter, but meaningful project knowledge still requires review.

## 13. Change Log

```text
2026-06-02
Status: DRAFTED
Change: Created module creation and review policy.
Reason: Simeon confirmed every module should be verified with him, with clarifying questions asked when needed.
```
