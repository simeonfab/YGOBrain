# 000 Source Index

Status: DRAFTED
Version: v0.1
Category: sources
Scope: Central registry of YGOBrain sources and their current trust status
Owner: Simeon Fabowale-Makinde
Last Updated: 2026-05-28

## 1. Purpose

This file tracks sources used by YGOBrain.

The goal is to make source authority explicit so rulings, deckbuilding recommendations, analytics conclusions, and runtime instructions do not rely on unclear or weak evidence.

## 2. Source Policy Reference

Use this file alongside:

```text
governance/002_source_hierarchy.md
templates/source_entry_template.md
```

## 3. Authority Tiers

```text
Tier 1 — Official TCG Authority
Tier 2 — Official or Semi-Official Related Authority
Tier 3 — Judge-Level or Policy-Aware Source
Tier 4 — High-Quality Community Resource
Tier 5 — General Community Discussion
Tier 6 — Assistant Inference
```

## 4. Source Status Labels

```text
APPROVED
CANDIDATE
LIMITED_USE
DEPRECATED
REJECTED
NEEDS_REVIEW
```

## 5. Official TCG Sources

### Konami Official Yu-Gi-Oh Card Database

```text
Source Name: Konami Official Yu-Gi-Oh Card Database
Source Type: OFFICIAL_CARD_DATABASE
Authority Tier: Tier 1 — Official TCG Authority
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
Source Type: OFFICIAL_ANNOUNCEMENT
Authority Tier: Tier 1 — Official TCG Authority
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
Source Type: OFFICIAL_FORBIDDEN_LIMITED_LIST
Authority Tier: Tier 1 — Official TCG Authority
URL or Reference: https://www.yugioh-card.com/en/limited/
Format: TCG_ADVANCED
Date Checked: 2026-05-28
Relevant Claim: Current TCG Forbidden & Limited List.
Confidence: HIGH
Verification Status: VERIFIED_BY_OFFICIAL_SOURCE
Project Status: APPROVED
Notes: Time-sensitive. Must be checked when deckbuilding legality matters.
```

## 6. Official or Semi-Official Related Sources

### Official OCG Sources

```text
Source Name: Official OCG Sources
Source Type: OCG_OFFICIAL_SOURCE
Authority Tier: Tier 2 — Official or Semi-Official Related Authority
URL or Reference: Various official OCG resources
Format: OCG_INFORMATIVE_ONLY
Date Checked: 2026-05-28
Relevant Claim: OCG rulings and official OCG explanations.
Confidence: MEDIUM for TCG use
Verification Status: NEEDS_HUMAN_REVIEW for TCG application
Project Status: LIMITED_USE
Notes: Informative only for YGOBrain unless no TCG authority exists. Do not treat as definitive TCG authority without explicit qualification.
```

## 7. Judge-Level or Policy-Aware Sources

```text
SOURCE_NEEDED
```

Candidate judge-level sources should be added only after review.

## 8. High-Quality Community Sources

### Yugipedia

```text
Source Name: Yugipedia
Source Type: COMMUNITY_DATABASE
Authority Tier: Tier 4 — High-Quality Community Resource
URL or Reference: https://yugipedia.com/
Format: GENERAL_YUGIOH
Date Checked: 2026-05-28
Relevant Claim: Card information, rulings references, terminology, historical notes, and community-maintained explanations.
Confidence: MEDIUM
Verification Status: SUPPORTED_BY_COMMUNITY_SOURCE
Project Status: CANDIDATE
Notes: Useful for research and summaries. Important claims should be verified against higher-tier sources where practical.
```

### YGOrganization

```text
Source Name: YGOrganization
Source Type: COMMUNITY_ARTICLE
Authority Tier: Tier 4 — High-Quality Community Resource
URL or Reference: https://ygorganization.com/
Format: GENERAL_YUGIOH
Date Checked: 2026-05-28
Relevant Claim: News, translations, rulings coverage, and card information.
Confidence: MEDIUM
Verification Status: SUPPORTED_BY_COMMUNITY_SOURCE
Project Status: CANDIDATE
Notes: Useful for OCG-related information and translations. Treat TCG application carefully.
```

## 9. Competitive and Analytics Sources

```text
SOURCE_NEEDED
```

Future candidates may include:

- event result pages
- topping deck list databases
- tournament reports
- reputable metagame breakdowns
- Simeon's own testing data

## 10. Simeon Verification

```text
Source Name: Simeon Verification
Source Type: SIMEON_VERIFICATION
Authority Tier: Project-specific authority
URL or Reference: Internal YGOBrain review
Format: PROJECT_INTERNAL
Date Checked: Ongoing
Relevant Claim: Simeon's approval of project content, deckbuilding preferences, and accepted interpretations.
Confidence: HIGH for project acceptance
Verification Status: VERIFIED_BY_SIMEON
Project Status: APPROVED
Notes: Simeon is final arbiter for what enters YGOBrain. This does not override official rules.
```

## 11. Assistant Inference

```text
Source Name: Assistant Inference
Source Type: ASSISTANT_INFERENCE
Authority Tier: Tier 6 — Assistant Inference
URL or Reference: N/A
Format: PROJECT_INTERNAL
Date Checked: Ongoing
Relevant Claim: Draft reasoning, hypotheses, and proposed explanations.
Confidence: LOW unless verified
Verification Status: INFERRED_NOT_VERIFIED
Project Status: LIMITED_USE
Notes: Never final authority. Must be verified by source support or Simeon.
```

## 12. Open Source Review Tasks

- Add official TCG rulebook source entry.
- Add official tournament policy source entry.
- Identify acceptable judge-level sources.
- Identify competitive decklist and event result sources.
- Decide whether Yugipedia is approved for low-risk factual lookup or remains candidate only.
- Decide whether YGOrganization is approved for OCG translation support.

## 13. Change Log

```text
2026-05-28
Status: DRAFTED
Change: Created initial source index.
Reason: YGOBrain needs a central source registry before rules, deckbuilding, and analytics modules are created.
```
