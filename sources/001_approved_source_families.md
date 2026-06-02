# 001 Approved Source Families

Status: DRAFTED
Version: v0.2
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

### Yu-Gi-Oh Meta

```text
Source Family: Yu-Gi-Oh Meta
Primary URL: https://www.yugiohmeta.com/
Approved Scope: Yu-Gi-Oh tournament statistics, decklists, tournament results, metagame trends, and Yu-Gi-Oh news.
Approval Status: APPROVED
Approved By: Admin
Authority Tier: Tier 4 — High-Quality Community Resource
Allowed Use Cases:
- tournament statistics
- decklist research
- metagame trend analysis
- competitive analytics
- Yu-Gi-Oh news as context
Disallowed Use Cases:
- final ruling authority
- official TCG card text authority
- official tournament policy authority
Notes: Approved as a competitive and analytics source family. Strategic conclusions still need sample-size and context checks.
```

### YGOResources Database/API

```text
Source Family: YGOResources Database/API
Primary URL: https://db.ygoresources.com/
Approved Scope: Card database lookup, card text research, card metadata, Q&A/rulings lookup, and API-backed querying where available.
Approval Status: APPROVED
Approved By: Admin
Authority Tier: Tier 3 — Judge-Level or Policy-Aware Source / Tier 4 — High-Quality Community Resource depending on claim
Allowed Use Cases:
- card database lookup
- card metadata lookup
- Q&A/rulings lookup
- API-assisted card and ruling queries
- research pointer for exact card/ruling checks
Disallowed Use Cases:
- overriding official Konami TCG sources
- treating API-derived results as final when they conflict with official TCG material
API Use Rules:
- Do not request more data than needed.
- Do not query the entire database unnecessarily.
- Cache requested data locally where practical.
- Respect X-Cache-Revision where applicable.
- Use manifest/revision-style update checks where practical instead of repeatedly re-downloading unchanged data.
- Request only relevant card, Q&A, metadata, or index endpoints for the task.
Notes: Approved as a practical database/API source. Treat as highly useful for querying and research, but maintain source hierarchy discipline.
```

## 5. Limited-Use Source Families

### Official OCG Sources

```text
Source Family: Official OCG Sources
Approved Scope: Informative support only when no TCG authority is available.
Approval Status: LIMITED_USE
Approved By: YGOBrain foundation default, confirmed by Admin
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

### Yugipedia

```text
Source Family: Yugipedia
Primary URL: https://yugipedia.com/
Approved Scope: Low-risk factual lookup, terminology, card information summaries, and research pointers.
Approval Status: LIMITED_USE
Approved By: Admin
Authority Tier: Tier 4 — High-Quality Community Resource
Allowed Use Cases:
- quick lookup
- card information summaries
- terminology research
- research pointers
- low-risk factual checks
Disallowed Use Cases:
- final ruling authority without higher-tier support
- final current card text authority where official sources are available
- official policy authority
Notes: Useful as a fast reference and pointer source. Important claims should be verified against higher-tier sources where practical.
```

### YGOrganization

```text
Source Family: YGOrganization
Primary URL: https://ygorganization.com/
Approved Scope: Yu-Gi-Oh news, translations, OCG-related information, and ruling pointers.
Approval Status: LIMITED_USE
Approved By: Admin
Authority Tier: Tier 4 — High-Quality Community Resource
Allowed Use Cases:
- OCG translation support
- Yu-Gi-Oh news research
- ruling coverage as pointer
- product/news context
Disallowed Use Cases:
- final TCG ruling authority
- unqualified OCG-to-TCG transfer
- official TCG policy authority
Notes: Useful for OCG-related information and translation/news context. Treat TCG application carefully.
```

## 6. Candidate Source Families Pending Admin Review

```text
None currently listed.
```

## 7. Needed Source Families

These categories may need more Admin-approved source families before agent-assisted content generation relies on them.

```text
Judge / ruling source family: PARTIALLY_COVERED by YGOResources Database/API; additional judge resources may be proposed later.
Decklist source family: COVERED by Yu-Gi-Oh Meta; additional decklist sources may be proposed later.
Tournament result source family: COVERED by Yu-Gi-Oh Meta; official event coverage may also be used when available.
Metagame statistics source family: COVERED by Yu-Gi-Oh Meta; additional statistics sources may be proposed later.
Creator / channel source family: SOURCE_NEEDED if creator sources are required.
Community spreadsheet source family: SOURCE_NEEDED if external spreadsheets are required.
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

2026-06-02
Status: DRAFTED
Change: Approved initial source family set and added Yu-Gi-Oh Meta plus YGOResources Database/API.
Reason: Admin approved the initial source recommendations and added specific competitive/statistics and database/API sources.
```
