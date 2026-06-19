# YGOBrain — DEPRECATED

## Do Not Use For Active ResolveYGO Work

This repository is deprecated and must not be used for active ResolveYGO planning, implementation, validation, or source-of-truth decisions.

```text
Deprecated repo: simeonfab/YGOBrain
Canonical repo: simeonfab/ResolveYGO
Canonical remote: https://github.com/simeonfab/ResolveYGO.git
Status: historical reference only
```

All active work must move to:

```text
https://github.com/simeonfab/ResolveYGO
```

## Required Agent Behaviour

If an agent, assistant, or implementation engineer sees this repository during active ResolveYGO work, they must stop and switch to the canonical ResolveYGO repository.

Do not create new planning files here.
Do not create implementation work here.
Do not validate active project state from this repository.
Do not treat this repository as source of truth.

This repository may only be used as historical reference if Admin explicitly requests recovery of old context.

## Reason For Deprecation

The project was renamed and moved from YGOBrain to ResolveYGO.

The repository split caused repeated confusion where planning artifacts were created in YGOBrain while implementation work used ResolveYGO.

Admin confirmed on 2026-06-19 that ResolveYGO is the canonical active repository and that YGOBrain must be clearly marked to prevent recurrence.

## Historical Contents

The historical files in this repository may remain for reference, but they are not authoritative unless copied into ResolveYGO and reviewed there.

Current canonical Phase 1 planning files are in ResolveYGO:

```text
planning/002_supabase_card_database_phase_1_spec.md
planning/003_supabase_card_database_phase_1_implementation_task.md
planning/004_repository_source_of_truth.md
```

## Local Setup Warning

Do not clone this repository for active work.

Correct clone command:

```powershell
git clone https://github.com/simeonfab/ResolveYGO.git
cd ResolveYGO
```

If an existing local working tree points to this repository, change to a ResolveYGO clone before continuing active work.
