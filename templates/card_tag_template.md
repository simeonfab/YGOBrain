# Card Tag Template

Status: DRAFTED
Version: v0.1
Category: templates
Scope: Standard structure for assigning and reviewing YGOBrain card tags
Owner: Admin
Last Updated: 2026-06-06
Applies To: Card tagging, local card database overlays, strategic discovery, deckbuilding recommendations, analytics
Task Modes: deckbuilding, analytics, system-building
Keywords: card tag, role tag, function tag, synergy tag, risk tag, confidence, admin verification
Depends On:
- governance/010_card_database_schema.md
- competitive/020_card_tagging_framework.md
Source Tier: Project template
Verification Status: NEEDS_ADMIN_REVIEW
Retrieval Priority: HIGH
Related Modules:
- runtime/070_card_lookup_context.md
- runtime/080_card_recommendation_context.md

## 1. Purpose

This template defines how to record YGOBrain card tags.

Card tags should support function-based card discovery and recommendations while keeping database facts, strategic interpretation, and human verification separate.

## 2. Single Card Tag Entry

```text
Card Name:
Card ID:
Tag Family:
Tag:
Context Scope:
Context Detail:
Confidence:
Verification Status:
Source:
Reasoning:
Last Reviewed:
Reviewer:
Notes:
```

## 3. Field Guidance

### Card Name

Official card name from the local card database.

### Card ID

Stable local or upstream identifier where available.

### Tag Family

Use one of:

```text
ROLE
FUNCTION
SYNERGY
RISK
```

### Tag

Use an approved or candidate tag from `competitive/020_card_tagging_framework.md`.

Examples:

```text
starter
extender
payoff
search
discard
mill
summon
brick
garnet
situational
LIGHT
Fiend
Spellcaster
GY_focused
engine_bridge
```

### Context Scope

Use one of:

```text
global
archetype_specific
deck_specific
build_specific
format_specific
side_context
```

### Context Detail

Specify the context.

Examples:

```text
White Forest
Magical Musket
TCG Advanced current format
Going second build
Post-side going first
```

### Confidence

Use:

```text
HIGH
MEDIUM
LOW
UNKNOWN
```

Guidance:

```text
HIGH
- Admin verified, strongly source-backed, or repeatedly validated.

MEDIUM
- Well-supported but not fully verified.

LOW
- Plausible but untested or weakly supported.

UNKNOWN
- Candidate tag only.
```

### Verification Status

Use:

```text
NEEDS_ADMIN_REVIEW
ADMIN_VERIFIED
REJECTED
SUPERSEDED
LIMITED_USE
```

### Source

State where the tag came from.

Examples:

```text
local_card_database
YGOBrain strategic analysis
Admin review
testing result
analytics result
approved source
assistant inference
```

### Reasoning

Briefly explain why the tag applies.

Do not paste full card text unless necessary.

### Last Reviewed

Use date format:

```text
YYYY-MM-DD
```

### Reviewer

Use:

```text
Admin
Assistant
Codex
```

### Notes

Optional notes about limits, uncertainty, conflicts, or future review.

## 4. Multi-Tag Card Entry

Use this format when tagging one card with multiple tags.

```text
Card Name:
Card ID:
Card Facts Source:
Last Card Fact Check:

Tags:
- Tag Family:
  Tag:
  Context Scope:
  Context Detail:
  Confidence:
  Verification Status:
  Source:
  Reasoning:
  Last Reviewed:
  Reviewer:
  Notes:

- Tag Family:
  Tag:
  Context Scope:
  Context Detail:
  Confidence:
  Verification Status:
  Source:
  Reasoning:
  Last Reviewed:
  Reviewer:
  Notes:
```

## 5. Discovery Query Template

Use this format to define reusable card discovery searches.

```text
Discovery Query Name:
Purpose:
Required Database Filters:
Required Tags:
Optional Tags:
Excluded Tags:
Context Scope:
Confidence Minimum:
Verification Requirement:
Notes:
```

Example:

```text
Discovery Query Name: LIGHT Fiend Extenders
Purpose: Find cards that may extend plays in LIGHT Fiend-based decks.
Required Database Filters:
- Attribute: LIGHT
- Race: Fiend
Required Tags:
- extender
Optional Tags:
- special_summon
- discard_synergy
- GY_focused
Excluded Tags:
- side_only unless side deck search requested
Context Scope:
- deck_specific or archetype_specific preferred
Confidence Minimum:
- MEDIUM
Verification Requirement:
- Admin verification required before treating result as trusted recommendation
Notes:
- Database facts identify LIGHT Fiend. Strategic tags identify extender status.
```

## 6. Review Checklist

Before treating a card tag as trusted, check:

- [ ] Card facts came from the local card database.
- [ ] Tag family is correct.
- [ ] Tag is defined or clearly marked as candidate.
- [ ] Context scope is specified.
- [ ] Confidence is assigned.
- [ ] Source is recorded.
- [ ] Admin verification status is recorded.
- [ ] Tag does not conflict with official rulings or legality.
- [ ] Tag does not overclaim global usefulness when context-specific.

## 7. Change Log

```text
2026-06-06
Status: DRAFTED
Change: Created card tag template.
Reason: Admin requested a standard template for strategic card tags.
```
