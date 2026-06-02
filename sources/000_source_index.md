# 000 Source Index

Status: DRAFTED
Version: v0.2
Category: sources
Scope: Central registry of YGOBrain sources and their current trust status
Owner: Admin
Last Updated: 2026-06-02

## 1. Purpose

This file tracks sources used by YGOBrain.

The goal is to make source authority explicit so rulings, deckbuilding recommendations, analytics conclusions, and runtime instructions do not rely on unclear or weak evidence.

## 2. Source Policy Reference

Use this file alongside:

```text
governance/002_source_hierarchy.md
governance/007_sub_agent_workflow_policy.md
templates/source_entry_template.md
sources/001_approved_source_families.md
```

## 3. Source Approval Principle

At a top level, source families, websites, databases, and recurring data providers must be approved by Admin before they become trusted YGOBrain inputs.

Once a source family is approved for a defined use case, individual entries from that approved source may be used within that approved scope without asking Admin about every lookup.

Examples:

```text
Needs Admin approval:
- Should this website become an approved decklist source?
- Should this judge resource become an approved ruling source?
- Should this event database become an approved analytics source?

Does not always need separate approval once source is approved:
- Extract one deck list from the approved decklist website.
- Check one card entry from the official database.
- Use one event result from the approved event database.
```

## 4. Authority Tiers

```text
Tier 1 - Official TCG Authority
Tier 2 - Official or Semi-Official Related Authority
Tier 3 - Judge-Level or Policy-Aware Source
Tier 4 - High-Quality Community Resource
Tier 5 - General Community Discussion
Tier 6 - Assistant Inference
```

## 5. Source Status Labels

```text
APPROVED
CANDIDATE
LIMITED_USE
DEPRECATED
REJECTED
NEEDS_REVIEW
```

## 6. Approved Source Families

### Official Konami TCG Source Family

```text
Source Family: Official Konami TCG Sources
Approved Scope: Official TCG card text, official TCG announcements, official TCG Forbidden & Limited List, official TCG product and policy references where available.
Approval Status: APPROVED
Approved By: Admin / YGOBrain foundation default
Authority Tier: Tier 1 - Official TCG Authority
Notes: This family is the highest-priority source family for TCG card text, legality, announcements, and official TCG material.
```

### Admin Verification Source Family

```text
Source Family: Admin Verification
Approved Scope: Project acceptance, preferred terminology, deckbuilding preferences, approved source choices, and final verification decisions.
Approval Status: APPROVED
Approved By: Admin
Authority Tier: Project-specific authority
Notes: Admin is final arbiter for what enters YGOBrain. This does not override official rules.
```

### Yu-Gi-Oh Meta

```text
Source Family: Yu-Gi-Oh Meta
URL or Reference: https://www.yugiohmeta.com/
Approved Scope: Tournament statistics, decklists, tournament results, metagame trends, and Yu-Gi-Oh news.
Approval Status: APPROVED
Approved By: Admin
Authority Tier: Tier 4 - High-Quality Community Resource
Notes: Approved for competitive and analytics use. Not a final ruling or official policy authority.
```

### YGOResources Database/API

```text
Source Family: YGOResources Database/API
URL or Reference: https://db.ygoresources.com/
Approved Scope: Card database lookup, card text research, card metadata, Q&A/rulings lookup, and API-backed querying where available.
Approval Status: APPROVED
Approved By: Admin
Authority Tier: Tier 3 - Judge-Level or Policy-Aware Source / Tier 4 - High-Quality Community Resource depending on claim
Notes: Approved for database/API-assisted card and ruling research. Must not override official TCG sources. API use should avoid unnecessary full-database queries and should cache where practical.
```

## 7. Limited-Use Source Families

### Official OCG Sources

```text
Source Family: Official OCG Sources
Approved Scope: Informative support only when no TCG authority is available.
Approval Status: LIMITED_USE
Approved By: YGOBrain foundation default, confirmed by Admin
Authority Tier: Tier 2 - Official or Semi-Official Related Authority
Notes: OCG sources may inform TCG reasoning but are not automatically definitive for TCG.
```

### Yugipedia

```text
Source Family: Yugipedia
URL or Reference: https://yugipedia.com/
Approved Scope: Low-risk factual lookup, terminology, card information summaries, and research pointers.
Approval Status: LIMITED_USE
Approved By: Admin
Authority Tier: Tier 4 - High-Quality Community Resource
Notes: Useful for research and summaries. Important claims should be verified against higher-tier sources where practical.
```

### YGOrganization

```text
Source Family: YGOrganization
URL or Reference: https://ygorganization.com/
Approved Scope: Yu-Gi-Oh news, translations, OCG-related information, and ruling pointers.
Approval Status: LIMITED_USE
Approved By: Admin
Authority Tier: Tier 4 - High-Quality Community Resource
Notes: Useful for OCG-related information and translations. Treat TCG application carefully.
```

## 8. Official TCG Sources

### Konami Official Yu-Gi-Oh Card Database

```text
Source Name: Konami Official Yu-Gi-Oh Card Database
Source Family: Official Konami TCG Sources
Source Type: OFFICIAL_CARD_DATABASE
Authority Tier: Tier 1 - Official TCG Authority
URL or Reference: https://www.db.yugioh-card.com/yugiohdb/
Format: TCG_ADVANCED
Date Checked: 2026-05-28
Relevant Claim: Official card text and database information.
Confidence: HIGH
Verification Status: VERIFIED_BY_OFFICIAL_SOURCE
Project Status: APPROVED
Notes: Preferred source for exact current card text where available. Use exact wording when PSCT matters.
```

### Konami Official Yu-Gi-Oh TCG Website

```text
Source Name: Konami Official Yu-Gi-Oh TCG Website
Source Family: Official Konami TCG Sources
Source Type: OFFICIAL_ANNOUNCEMENT
Authority Tier: Tier 1 - Official TCG Authority
URL or Reference: https://www.yugioh-card.com/en/
Format: TCG_ADVANCED
Date Checked: 2026-05-28
Relevant Claim: Official TCG announcements, products, policy links, and format information.
Confidence: HIGH
Verification Status: VERIFIED_BY_OFFICIAL_SOURCE
Project Status: APPROVED
Notes: Use for official TCG announcements and entry point to official resources.
```

### Konami Official Forbidden & Limited List

```text
Source Name: Konami Official Forbidden & Limited List
Source Family: Official Konami TCG Sources
Source Type: OFFICIAL_FORBIDDEN_LIMITED_LIST
Authority Tier: Tier 1 - Official TCG Authority
URL or Reference: https://www.yugioh-card.com/en/limited/
Format: TCG_ADVANCED
Date Checked: 2026-05-28
Relevant Claim: Current TCG Forbidden & Limited List.
Confidence: HIGH
Verification Status: VERIFIED_BY_OFFICIAL_SOURCE
Project Status: APPROVED
Notes: Time-sensitive. Must be checked when deckbuilding legality matters.
```

## 9. Approved Competitive and Analytics Sources

### Yu-Gi-Oh Meta

```text
Source Name: Yu-Gi-Oh Meta
Source Family: Yu-Gi-Oh Meta
Source Type: COMPETITIVE_EVENT_DATA / DECKLIST_SOURCE / COMMUNITY_DATABASE
Authority Tier: Tier 4 - High-Quality Community Resource
URL or Reference: https://www.yugiohmeta.com/
Format: TCG_ADVANCED unless source entry indicates otherwise
Date Checked: 2026-06-02
Relevant Claim: Tournament statistics, decklists, tournament results, metagame trends, and Yu-Gi-Oh news.
Confidence: MEDIUM to HIGH depending on dataset and sample quality
Verification Status: APPROVED_BY_ADMIN
Project Status: APPROVED
Notes: Use sample-size and context checks before making strategic conclusions.
```

## 10. Approved Database/API and Ruling Research Sources

### YGOResources Database/API

```text
Source Name: YGOResources Database/API
Source Family: YGOResources Database/API
Source Type: COMMUNITY_DATABASE / JUDGE_RESOURCE / CARD_DATABASE_API
Authority Tier: Tier 3 - Judge-Level or Policy-Aware Source / Tier 4 - High-Quality Community Resource depending on claim
URL or Reference: https://db.ygoresources.com/
Format: GENERAL_YUGIOH / TCG_ADVANCED when applicable
Date Checked: 2026-06-02
Relevant Claim: Card database lookup, card text research, card metadata, Q&A/rulings lookup, and API-backed querying.
Confidence: MEDIUM to HIGH depending on whether claim is database lookup, Q&A/ruling reference, or inference.
Verification Status: APPROVED_BY_ADMIN
Project Status: APPROVED
API Use Notes:
- Do not request more data than needed.
- Do not query the entire database unnecessarily.
- Cache requested data locally where practical.
- Respect X-Cache-Revision where applicable.
- Use manifest/revision-style update checks where practical.
- Request only relevant card, Q&A, metadata, or index endpoints for the task.
Notes: Approved as a practical database/API source. Does not override official Konami TCG sources.
```

## 11. Judge-Level or Policy-Aware Sources

```text
PARTIALLY_COVERED
```

YGOResources Database/API is approved for Q&A/ruling lookup and API-assisted research.

Additional judge-level sources may be proposed to Admin before being used as trusted recurring sources.

## 12. Competitive and Analytics Sources

```text
PARTIALLY_COVERED
```

Yu-Gi-Oh Meta is approved for tournament statistics, decklists, tournament results, metagame trends, and Yu-Gi-Oh news.

Additional competitive or analytics source families may be proposed to Admin before being used as trusted recurring data inputs.

## 13. Individual Source Entry Template

Use this structure for individual sources:

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
Project Status:
Notes:
```

## 14. Admin Verification

```text
Source Name: Admin Verification
Source Family: Admin Verification
Source Type: ADMIN_VERIFICATION
Authority Tier: Project-specific authority
URL or Reference: Internal YGOBrain review
Format: PROJECT_INTERNAL
Date Checked: Ongoing
Relevant Claim: Admin approval of project content, source families, deckbuilding preferences, and accepted interpretations.
Confidence: HIGH for project acceptance
Verification Status: VERIFIED_BY_ADMIN
Project Status: APPROVED
Notes: Admin is final arbiter for what enters YGOBrain. This does not override official rules.
```

## 15. Assistant Inference

```text
Source Name: Assistant Inference
Source Family: Assistant Inference
Source Type: ASSISTANT_INFERENCE
Authority Tier: Tier 6 - Assistant Inference
URL or Reference: N/A
Format: PROJECT_INTERNAL
Date Checked: Ongoing
Relevant Claim: Draft reasoning, hypotheses, and proposed explanations.
Confidence: LOW unless verified
Verification Status: INFERRED_NOT_VERIFIED
Project Status: LIMITED_USE
Notes: Never final authority. Must be verified by source support or Admin.
```

## 16. Open Source Review Tasks

- Add official TCG rulebook source entry.
- Add official tournament policy source entry.
- Identify whether additional judge-level sources are needed.
- Identify whether additional competitive decklist and event result sources are needed.
- Identify whether creator/channel sources should be approved for strategic commentary.
- Identify whether community spreadsheet sources should be approved for analytics.

## 17. Change Log

```text
2026-05-28
Status: DRAFTED
Change: Created initial source index.
Reason: YGOBrain needs a central source registry before rules, deckbuilding, and analytics modules are created.

2026-06-02
Status: DRAFTED
Change: Added source family approval rules and explicit Admin approval gate.
Reason: Admin clarified that recurring source websites, databases, and data providers should be approved at a top level before agents use them as trusted sources.

2026-06-02
Status: DRAFTED
Change: Updated source index with approved initial source family set, Yu-Gi-Oh Meta, and YGOResources Database/API.
Reason: Admin approved the initial source recommendations and added source families for tournament statistics, decklists, database lookup, and rulings/API research.
```
