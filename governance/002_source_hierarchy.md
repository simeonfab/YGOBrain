# 002 Source Hierarchy

Status: DRAFTED
Version: v0.1
Scope: Source authority, confidence levels, verification rules, and contradiction handling
Owner: Admin
Last Updated: 2026-05-28

## 1. Purpose

This file defines how YGOBrain evaluates sources.

The purpose is to prevent assistant inference, weak community claims, outdated rulings, or format-confused information from entering the system as authoritative knowledge.

YGOBrain should prefer verified, source-backed knowledge over plausible-sounding explanations.

## 2. Default Source Assumption

Unless explicitly stated otherwise, all source evaluation is for:

- Yu-Gi-Oh TCG
- Advanced Format
- official cards
- current rules and policy

OCG, Master Duel, Rush Duel, Speed Duel, anime-only material, historic formats, unofficial simulator behaviour, and custom-card contexts are out of scope unless Admin explicitly requests them.

## 3. Authority Ranking

Use this source hierarchy by default.

### Tier 1 - Official TCG Authority

Highest priority.

Examples:

- Official Konami TCG card database
- Official Konami TCG rulebook
- Official Konami TCG tournament policy documents
- Official Konami TCG Forbidden & Limited List
- Official Konami TCG announcements

Use Tier 1 as the preferred source of truth whenever available.

### Tier 2 - Official or Semi-Official Related Authority

Useful when Tier 1 does not directly answer the issue.

Examples:

- Official OCG database rulings
- Official OCG rule explanations
- Official Yu-Gi-Oh channels outside the TCG region

OCG sources may inform TCG reasoning, but they are not automatically authoritative for TCG. If used, mark them clearly as informative rather than definitive.

### Tier 3 - Judge-Level or Policy-Aware Sources

Useful for interpretation, practical ruling expectations, and edge cases where official public sources are incomplete.

Examples:

- documented judge resources
- judge consensus discussions
- policy-aware ruling explanations
- well-maintained ruling archives

Tier 3 should be treated as strong support, not official truth, unless the source is explicitly endorsed by Konami or official policy.

### Tier 4 - High-Quality Community Resources

Useful for card text, examples, summaries, and initial research.

Examples:

- Yugipedia
- YGOrganization
- well-maintained community ruling pages
- reputable competitive resources

Tier 4 may be used as a working source, but important claims should be verified against higher-tier sources where practical.

### Tier 5 - General Community Discussion

Useful only as weak evidence or a pointer toward better sources.

Examples:

- Reddit threads
- Discord claims
- forum posts
- YouTube comments
- unsourced social media posts

Tier 5 should not become final source of truth without corroboration.

### Tier 6 - Assistant Inference

Lowest authority.

Assistant inference may be used to propose drafts, explanations, or hypotheses, but it must not become final truth without source support or Admin verification.

## 4. Source Confidence Levels

Every important source-backed claim should use a confidence level where practical.

### HIGH

Use when the claim is directly supported by a Tier 1 source or explicitly verified by Admin.

### MEDIUM

Use when the claim is supported by Tier 2, Tier 3, or strong Tier 4 sources, but lacks direct Tier 1 confirmation.

### LOW

Use when the claim is based on weak community evidence, incomplete information, or assistant inference.

### UNKNOWN

Use when no suitable source has been found or the claim has not been investigated.

## 5. Verification Status Labels

Use these labels in modules where useful:

```text
VERIFIED_BY_OFFICIAL_SOURCE
VERIFIED_BY_ADMIN
SUPPORTED_BY_JUDGE_CONSENSUS
SUPPORTED_BY_COMMUNITY_SOURCE
NEEDS_OFFICIAL_SOURCE
NEEDS_HUMAN_REVIEW
INFERRED_NOT_VERIFIED
```

## 6. Human Verification Rule

Admin is the final arbiter of what enters YGOBrain as accepted knowledge.

The assistant may draft, source, summarize, and propose conclusions, but should not self-certify uncertain rulings or strategic claims.

## 7. Official Source First Rule

When researching a rules question, first seek an official TCG source where practical.

If an official TCG source is unavailable, use the next best source and clearly label its authority level.

Do not present community interpretation as official ruling.

## 8. OCG Handling Rule

OCG rulings are useful but not automatically binding for TCG.

Use OCG sources only as:

- informative context
- a likely indication of intended mechanics
- a pointer for further research

When relying on an OCG source, state:

```text
OCG source used as informative support only. No direct TCG authority confirmed.
```

## 9. Contradiction Handling Rule

If sources conflict:

1. Prefer current official TCG sources.
2. Prefer newer official policy over older unofficial interpretation.
3. Prefer card-specific rulings over general assumptions.
4. Prefer exact current card text over memory or paraphrase.
5. Mark unresolved conflicts clearly.
6. Do not collapse conflicting sources into false certainty.

## 10. Outdated Information Rule

Yu-Gi-Oh rules, policy, card text, banlists, and competitive context can change.

For time-sensitive claims, record:

- source
- date checked
- format assumed
- confidence level

Examples of time-sensitive areas:

- Forbidden & Limited List
- tournament policy
- current card text
- current metagame
- recent event results
- current deck ratios

## 11. Card Text Rule

For card-specific analysis, use exact current card text where practical.

Do not rely on paraphrased card effects when the precise wording matters.

Important wording includes:

- targeting language
- activation conditions
- costs
- once-per-turn clauses
- conjunctions
- timing phrases
- restrictions
- summon conditions

## 12. Strategic Source Rule

Strategic claims require different evidence than rules claims.

For deck building, analytics, and competitive recommendations, useful sources include:

- topping deck lists
- event results
- card frequency data
- matchup data
- player testing notes
- probability analysis
- Admin's results and preferences

Strategic recommendations should distinguish between:

- proven results
- statistical trends
- theory
- personal preference
- untested suggestion

## 13. Analytics Source Rule

When analyzing data, preserve the distinction between:

- raw data
- cleaned data
- assumptions
- calculations
- interpretations
- recommendations

Do not treat small samples as conclusive.

When sample size is small, state that clearly.

## 14. Source Entry Requirements

Where practical, source entries should include:

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

## 15. Source Promotion Rule

A source can be promoted in trust only when it proves reliable over time or is explicitly approved by Admin.

Promotion examples:

- A community source consistently matches official rulings.
- A judge resource is repeatedly useful and policy-aware.
- Admin explicitly marks a source as acceptable for a category.

## 16. Source Demotion Rule

A source should be demoted if it is found to be:

- outdated
- format-confused
- frequently wrong
- unsourced on important claims
- misleadingly presented as official

## 17. No Source Laundering Rule

Do not cite a lower-tier source as though it proves a higher-tier claim.

Example:

A Reddit explanation may point toward a ruling, but it does not prove an official TCG ruling.

## 18. Inference Labelling Rule

When the assistant infers something from rules, wording, or data, label it as inference unless a source or Admin has verified it.

Useful labels:

```text
Inference:
Likely but unverified:
Source-backed:
Officially confirmed:
Admin verified:
```

## 19. Missing Source Rule

If a claim matters and no source is available, mark it clearly.

Use:

```text
SOURCE_NEEDED
```

or

```text
NEEDS_OFFICIAL_CONFIRMATION
```

Do not allow unsourced claims to silently become stable knowledge.

## 20. Project-Specific Authority Rule

For YGOBrain itself, Admin instruction overrides generic community preferences.

However, user preference cannot change official rules. If Admin's deckbuilding preference conflicts with common competitive practice, record it as a preference. If a statement conflicts with official rules, official rules remain authoritative.
