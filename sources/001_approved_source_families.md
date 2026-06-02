# 001 Approved Source Families

Status: DRAFTED
Version: v0.1
Category: sources
Scope: Dedicated registry of approved, candidate, limited-use, rejected, and deprecated source families
Owner: Admin
Last Updated: 2026-06-02

## 1. Purpose

This file tracks source families rather than individual source entries.

A source family is a recurring website, database, provider, archive, creator, spreadsheet, or platform that YGOBrain may use for a defined purpose.

Source families must be approved by Admin before they become trusted recurring inputs.

## 2. Approval Rule

New recurring source families require Admin approval before trusted use.

Once approved for a defined use case, individual entries from that source may be used within the approved scope without asking Admin every time.

## 3. Status Labels

```text
APPROVED
CANDIDATE
LIMITED_USE
REJECTED
DEPRECATED
NEEDS_REVIEW
```

## 4. Approved Source Families

### Official Konami TCG Sources

```text
Source Family: Official Konami TCG Sources
Approved Scope: Official TCG card text, official TCG announcements, official TCG Forbidden & Limited List, official TCG product and policy references where available.
Approval Status: APPROVED
Approved By: Admin / YGOBrain foundation default
Authority Tier: Tier 1 — Official TCG Authority
Allowed Use Cases:
- card text lookup
- TCG legality checks
- official announcements
- official TCG source confirmation
Disallowed Use Cases:
- non-official strategic claims
- tournament trend analysis unless the source specifically provides official event data
Notes: Highest-priority source family for TCG authority.
```

### Admin Verification

```text
Source Family: Admin Verification
Approved Scope: Project acceptance, terminology approval, deckbuilding preferences, source approvals, and final verification decisions.
Approval Status: APPROVED
Approved By: Admin
Authority Tier: Project-specific authority
Allowed Use Cases:
- approving modules
- approving source families
- confirming preferred terminology
- confirming deckbuilding assumptions
Disallowed Use Cases:
- overriding official game rules
Notes: Admin is final arbiter for YGOBrain acceptance but does not override official rules.
```

## 5. Limited-Use Source Families

### Official OCG Sources

```text
Source Family: Official OCG Sources
Approved Scope: Informative support only when no TCG authority is available.
Approval Status: LIMITED_USE
Approved By: YGOBrain foundation default, subject to Admin review for recurring use.
Authority Tier: Tier 2 — Official or Semi-Official Related Authority
Allowed Use Cases:
- informative support
- identifying likely intended mechanics
- research pointer when TCG authority is missing
Disallowed Use Cases:
- definitive TCG rulings without qualification
- primary source for TCG deckbuilding legality
Notes: Must be labelled as OCG informative only.
```

## 6. Candidate Source Families Pending Admin Review

### Yugipedia

```text
Source Family: Yugipedia
Proposed Scope: Low-risk factual lookup, terminology, card information summaries, and research pointers.
Approval Status: CANDIDATE
Approved By: Pending Admin review
Authority Tier: Tier 4 — High-Quality Community Resource
Potential Use Cases:
- quick lookup
- card information summary
- terminology research
- rulings references as pointers
Risks:
- community-maintained
- may need higher-tier verification for important claims
Notes: Needs Admin decision before becoming trusted for recurring use.
```

### YGOrganization

```text
Source Family: YGOrganization
Proposed Scope: Yu-Gi-Oh news, translations, OCG-related information, and rulings coverage.
Approval Status: CANDIDATE
Approved By: Pending Admin review
Authority Tier: Tier 4 — High-Quality Community Resource
Potential Use Cases:
- OCG translation support
- news research
- ruling coverage as pointer
Risks:
- not primary TCG authority
- OCG-to-TCG transfer must be qualified
Notes: Needs Admin decision before becoming trusted for recurring use.
```

## 7. Needed Source Families

These categories need Admin-approved source families before agent-assisted content generation relies on them.

```text
Judge / ruling source family: SOURCE_NEEDED
Decklist source family: SOURCE_NEEDED
Tournament result source family: SOURCE_NEEDED
Metagame statistics source family: SOURCE_NEEDED
Creator / channel source family: SOURCE_NEEDED
Community spreadsheet source family: SOURCE_NEEDED
```

## 8. Rejected Source Families

```text
None yet.
```

## 9. Deprecated Source Families

```text
None yet.
```

## 10. Change Log

```text
2026-06-02
Status: DRAFTED
Change: Created approved source families registry.
Reason: YGOBrain needs a dedicated source-family approval file before agent-assisted source research and data extraction.
```
