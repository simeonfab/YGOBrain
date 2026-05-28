# YGOBrain Repository Scaffold Script
# Purpose: Create the standard YGOBrain folder structure and placeholder files locally.
# Safe to re-run. Existing files are not overwritten.

$ErrorActionPreference = "Stop"

$Root = Get-Location

$Directories = @(
    "governance",
    "core_rules",
    "competitive",
    "decks",
    "analytics",
    "tests",
    "templates",
    "runtime",
    "changelogs",
    "error_logs",
    "sources",
    "scripts"
)

foreach ($Directory in $Directories) {
    $Path = Join-Path $Root $Directory
    if (-not (Test-Path $Path)) {
        New-Item -ItemType Directory -Path $Path | Out-Null
        Write-Host "Created directory: $Directory"
    }
    else {
        Write-Host "Exists: $Directory"
    }

    $GitKeep = Join-Path $Path ".gitkeep"
    if (-not (Test-Path $GitKeep)) {
        New-Item -ItemType File -Path $GitKeep | Out-Null
        Write-Host "Created placeholder: $Directory/.gitkeep"
    }
}

Write-Host "YGOBrain scaffold check complete."
