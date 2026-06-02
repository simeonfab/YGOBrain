# Source Entry Template

Status: PLANNED
Version: v0.2
Category: sources
Scope: Standard structure for tracking YGOBrain sources and approved source families
Owner: Simeon Fabowale-Makinde
Last Updated: 2026-06-02

## 1. Purpose

This template defines how sources should be recorded in YGOBrain.

Sources should be tracked clearly so future modules can distinguish official rulings, judge consensus, community summaries, strategic data, approved source families, candidate source families, and assistant inference.

## 2. Source Family Approval Rule

New recurring source families, websites, databases, decklist providers, judge resources, community resources, creator sources, spreadsheets, and data providers require Simeon approval before they become trusted YGOBrain inputs.

Once a source family is approved for a defined use case, individual entries from that source may be used within the approved scope without asking Simeon for every lookup.

## 3. Source Family Entry

```text
Source Family:
Approved Scope:
Approval Status:
Approved By:
Authority Tier:
Allowed Use Cases:
Disallowed Use Cases:
Notes:
```

## 4. Individual Source Entry

```text
Source Name:
Source Family:
Source Type:
Authority Tier:
URL or Reference:
Format:
Date Checked:
Relevant Claim:
Confidence:
Verification Status:
Approval Status:
Approved Scope:
Approved By:
Notes:
```

## 5. Source Type Options

Use one of the following where practical:

```text
OFFICIAL_CARD_DATABASE
OFFICIAL_RULEBOOK
OFFICIAL_POLICY_DOCUMENT
OFFICIAL_FORBIDDEN_LIMITED_LIST
OFFICIAL_ANNOUNCEMENT
OCG_OFFICIAL_SOURCE
JUDGE_RESOURCE
COMMUNITY_DATABASE
COMMUNITY_ARTICLE
COMPETITIVE_EVENT_DATA
DECKLIST_SOURCE
PLAYER_TESTING_NOTES
CREATOR_SOURCE
COMMUNITY_SPREADSHEET
SIMEON_VERIFICATION
ASSISTANT_INFERENCE
```

## 6. Authority Tier Options

Use the hierarchy from `governance/002_source_hierarchy.md`.

```text
Tier 1 — Official TCG Authority
Tier 2 — Official or Semi-Official Related Authority
Tier 3 — Judge-Level or Policy-Aware Source
Tier 4 — High-Quality Community Resource
Tier 5 — General Community Discussion
Tier 6 — Assistant Inference
```

## 7. Format Options

```text
TCG_ADVANCED
TCG_OTHER
OCG_INFORMATIVE_ONLY
MASTER_DUEL_OUT_OF_SCOPE
RUSH_DUEL_OUT_OF_SCOPE
SPEED_DUEL_OUT_OF_SCOPE
HISTORIC_FORMAT_OUT_OF_SCOPE
GENERAL_YUGIOH
PROJECT_INTERNAL
```

## 8. Confidence Options

```text
HIGH
MEDIUM
LOW
UNKNOWN
```

## 9. Verification Status Options

```text
VERIFIED_BY_OFFICIAL_SOURCE
VERIFIED_BY_SIMEON
SUPPORTED_BY_JUDGE_CONSENSUS
SUPPORTED_BY_COMMUNITY_SOURCE
NEEDS_OFFICIAL_SOURCE
NEEDS_HUMAN_REVIEW
INFERRED_NOT_VERIFIED
OUTDATED
SUPERSEDED
```

## 10. Approval Status Options

```text
APPROVED
CANDIDATE
LIMITED_USE
DEPRECATED
REJECTED
NEEDS_REVIEW
```

## 11. Example Source Family Entry

```text
Source Family: [Name]
Approved Scope: [What this source family may be used for]
Approval Status: APPROVED / CANDIDATE / LIMITED_USE / REJECTED
Approved By: Simeon / Pending Simeon review / Official source default
Authority Tier: [Tier]
Allowed Use Cases:
- [Use case]
Disallowed Use Cases:
- [Use case]
Notes: [Any limitations or context]
```

## 12. Example Individual Source Entry

```text
Source Name: [Name]
Source Family: [Source family]
Source Type: OFFICIAL_CARD_DATABASE
Authority Tier: Tier 1 — Official TCG Authority
URL or Reference: [URL]
Format: TCG_ADVANCED
Date Checked: YYYY-MM-DD
Relevant Claim: [What this source supports]
Confidence: HIGH
Verification Status: VERIFIED_BY_OFFICIAL_SOURCE
Approval Status: APPROVED
Approved Scope: [Allowed scope]
Approved By: [Approver]
Notes: [Any limitations or context]
```

## 13. Source Review Checklist

Before using a source for an important claim, check:

- [ ] Is the source family approved for this use case?
- [ ] If not approved, has it been proposed to Simeon?
- [ ] Is the source relevant to TCG Advanced Format?
- [ ] Is the source official, judge-level, community, or inferred?
- [ ] Is the source current enough for the claim?
- [ ] Does the source directly support the claim?
- [ ] Is the claim format-specific?
- [ ] Does the source conflict with a higher-tier source?
- [ ] Is the confidence level labelled correctly?

## 14. Notes

Do not treat a lower-tier source as official confirmation.

Do not use OCG sources as definitive TCG authority unless later confirmed by a TCG source or by Simeon as acceptable for a specific use case.

Do not promote a candidate source family to approved without Simeon review.
