# 010 Analytics Principles

Status: DRAFTED
Version: v0.1
Category: analytics
Scope: Foundational principles for interpreting Yu-Gi-Oh TCG Advanced Format deck, event, matchup, and testing data
Owner: Admin
Last Updated: 2026-06-02

## 1. Purpose

This module defines the first-pass analytics framework for YGOBrain.

It exists to help the assistant turn deck lists, event results, matchup records, hand tests, and other performance data into useful decisions without overstating weak evidence.

## 2. Scope

This module covers:

- how to separate raw data, cleaned data, assumptions, calculations, interpretations, and recommendations
- how to label sample-size and source limitations
- how to connect analytics to deckbuilding and testing decisions
- how to avoid treating incomplete data as proof

This module does not cover:

- full probability formulas
- exact metagame tiering
- detailed event result aggregation
- matchup-specific side deck plans
- source approval for new data providers
- archetype-specific conclusions

## 3. Default Assumptions

Unless stated otherwise, assume:

- Yu-Gi-Oh TCG Advanced Format
- official cards only
- current TCG legality matters when interpreting deck lists
- data should support practical deckbuilding or testing decisions
- small samples are not conclusive

## 4. Dependencies

Depends On:

- governance/000_system_operating_rules.md
- governance/001_knowledge_architecture.md
- governance/002_source_hierarchy.md
- governance/003_response_methodology.md
- governance/006_module_creation_and_review_policy.md
- governance/007_sub_agent_workflow_policy.md
- runtime/030_analytics_assistant_context.md
- sources/001_approved_source_families.md

Related Modules:

- competitive/010_deckbuilding_principles.md
- analytics/011_decklist_analysis.md
- analytics/012_event_result_analysis.md
- analytics/016_probability_and_consistency.md

## 5. Clarifying Questions

Questions Needed:

- None for this first draft.

Assumptions Used Instead of Asking:

- This module should define reusable analytics behaviour, not analyze a real event yet.
- Detailed formulas should be handled in later probability and consistency modules.
- Source expansion should wait until Admin provides or approves additional source families.

## 6. Key Definitions

```text
Term: Raw Data
Definition: The original information provided or collected before cleaning, filtering, or interpretation.
Source Status: Inferred Not Verified / Needs Admin Review
```

```text
Term: Cleaned Data
Definition: Data after obvious formatting issues, duplicate entries, missing fields, or scope mismatches have been identified and handled.
Source Status: Inferred Not Verified / Needs Admin Review
```

```text
Term: Sample Size
Definition: The amount of data behind a claim, such as number of deck lists, matches, hands, or event results.
Source Status: Inferred Not Verified / Needs Admin Review
```

```text
Term: Conversion Rate
Definition: The rate at which represented decks, cards, or strategies convert from participation into stronger finishes, such as top cut or wins.
Source Status: Inferred Not Verified / Needs Admin Review
```

```text
Term: Testing Direction
Definition: A practical hypothesis suggested by data that still needs playtesting or further evidence before becoming a stable recommendation.
Source Status: Inferred Not Verified / Needs Admin Review
```

## 7. Core Rules or Principles

### 7.1 Separate Data From Interpretation

Analytics should keep these layers distinct:

- raw data
- cleaned data
- assumptions
- calculations
- interpretation
- recommendation

If these layers are mixed together, weak data can look more certain than it really is.

Source Status: Inferred Not Verified / Needs Admin Review

### 7.2 Small Samples Suggest, They Do Not Prove

A small set of matches, hands, lists, or event finishes can reveal useful testing directions.

It should not be treated as conclusive proof unless the claim is narrow and the evidence is strong enough for that claim.

Source Status: Inferred Not Verified / Needs Admin Review

### 7.3 Representation Is Not the Same as Strength

A popular deck or card is not automatically the best option.

When possible, compare representation with outcomes such as top cut share, conversion rate, matchup spread, or repeated successful use across events.

Source Status: Inferred Not Verified / Needs Admin Review

### 7.4 Analytics Should Produce Decisions

The goal is not only to report numbers.

Useful analytics should lead to a decision such as:

- test a card package
- adjust starter count
- reduce brick count
- change side deck priorities
- review a matchup plan
- collect more data before acting

Source Status: Inferred Not Verified / Needs Admin Review

### 7.5 Source Approval Still Applies

Analytics work must use approved source families as trusted inputs.

Yu-Gi-Oh Meta is currently approved for tournament statistics, decklists, tournament results, metagame trends, and Yu-Gi-Oh news.

If a task needs a new recurring decklist site, tournament result database, spreadsheet, creator source, or data provider, ask Admin before treating it as trusted.

Source Status: Source-Backed by repository source policy / Needs Admin Review for this module

## 8. Practical Application

When analyzing data, use this sequence:

1. Identify the data source and source-family approval status.
2. State the format, date range, and scope.
3. Separate raw data from cleaned data.
4. Note missing data, duplicate risk, and sample size.
5. Calculate only the metrics needed for the decision.
6. Interpret trends cautiously.
7. Convert findings into a practical deckbuilding or testing decision.
8. Mark what still needs more data.

## 9. Examples

### Example 1 - Low Sample Testing Result

Situation:
- A deck wins 8 out of 10 test games against one matchup.

Answer:
- Treat the result as a useful testing signal, not proof that the matchup is strongly favored.

Reasoning:
- Ten games can suggest what to test next, but it is too small to establish a stable matchup spread.

Source Status:
- Inferred / Needs Review

### Example 2 - Popular Card With Unclear Outcome

Situation:
- A card appears in many deck lists, but no outcome data is available.

Answer:
- Record it as common adoption, not proven performance.

Reasoning:
- Frequency alone may reflect hype, availability, player preference, or copying successful lists without proving the card improves results.

Source Status:
- Inferred / Needs Review

## 10. Common Mistakes

- Treating one event as the whole format.
- Treating representation as proof of strength.
- Ignoring conversion rate.
- Ignoring sample size.
- Mixing TCG, OCG, Master Duel, and historic-format data without labels.
- Using unapproved data providers as trusted recurring sources.
- Reporting numbers without a decision.
- Making precise-looking calculations from messy or incomplete data.

## 11. Edge Cases

- A small sample can still matter when it identifies a specific failure mode to test.
- A low-representation deck can be strong if its conversion is consistently high.
- A high-representation deck can be weaker than it looks if many pilots perform poorly.
- A card can be correct in one build and wrong in another even if aggregate frequency is high.
- User-provided testing data can be useful but should be labelled with its limitations.

## 12. Verification Gate

This module cannot be marked VERIFIED until Admin has reviewed or approved it.

Verification Status:

```text
NEEDS_ADMIN_REVIEW
```

Review Notes:

- Confirm whether the analytics sequence matches Admin's preferred workflow.
- Confirm whether conversion rate should be defined here or reserved for `analytics/015_conversion_analysis.md`.
- Confirm whether user-provided testing logs should be treated as a source family or as project-internal data.

## 13. Validation Checklist

Before marking this module as VERIFIED, check:

- [x] Scope is clear.
- [x] Clarifying questions were asked if needed.
- [x] Important assumptions are stated.
- [x] Important terms are defined.
- [x] Claims are sourced or labelled as needing review.
- [x] Examples are included where useful.
- [x] Edge cases are included where useful.
- [x] Common mistakes are included where useful.
- [ ] Related tests are created if needed.
- [ ] Admin has reviewed or approved the module.

## 14. Sources

```text
Source Name: Admin Verification
Source Family: Admin Verification
Source Type: ADMIN_VERIFICATION
Authority Tier: Project-specific authority
URL or Reference: Internal YGOBrain review
Format: PROJECT_INTERNAL
Date Checked: Pending
Relevant Claim: Analytics workflow and terminology approval.
Confidence: UNKNOWN until reviewed
Verification Status: NEEDS_HUMAN_REVIEW
Approval Status: APPROVED
Approved Scope: Project acceptance, terminology approval, and final verification decisions.
Approved By: Admin
Notes: This module is currently a draft and requires Admin review.
```

```text
Source Name: Yu-Gi-Oh Meta
Source Family: Yu-Gi-Oh Meta
Source Type: COMPETITIVE_EVENT_DATA / DECKLIST_SOURCE / COMMUNITY_DATABASE
Authority Tier: Tier 4 - High-Quality Community Resource
URL or Reference: https://www.yugiohmeta.com/
Format: TCG_ADVANCED unless source entry indicates otherwise
Date Checked: 2026-06-02
Relevant Claim: Approved source family for tournament statistics, decklists, tournament results, metagame trends, and Yu-Gi-Oh news.
Confidence: MEDIUM to HIGH depending on dataset and sample quality
Verification Status: APPROVED_BY_ADMIN
Approval Status: APPROVED
Approved Scope: Tournament statistics, decklists, tournament results, metagame trends, and Yu-Gi-Oh news.
Approved By: Admin
Notes: Use sample-size and context checks before making strategic conclusions.
```

## 15. Open Questions

- Should user-provided testing logs be recorded as `Admin Verification`, `PLAYER_TESTING_NOTES`, or a separate project-internal data category?
- Should conversion-rate terminology be standardized here or in `analytics/015_conversion_analysis.md`?
- Which additional analytics source families should be added when Admin provides them?

## 16. Change Log

```text
2026-06-02
Status: DRAFTED
Change: Created first draft of analytics principles module.
Reason: YGOBrain needs a reusable analytics foundation before event, decklist, matchup, and probability modules are created.
```
