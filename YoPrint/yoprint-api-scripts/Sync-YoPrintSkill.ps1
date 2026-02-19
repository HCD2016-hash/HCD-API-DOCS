<#
.SYNOPSIS
    Syncs YoPrint API knowledge from CLAUDE.md and yoprint-scripts.json to the global Claude Code skill.

.DESCRIPTION
    Reads the project CLAUDE.md (documentation) and yoprint-scripts.json (test statuses)
    and regenerates the ~/.claude/skills/yoprint-api-knowledge/SKILL.md file.

    Run this after:
    - Updating CLAUDE.md with new API gotchas or patterns
    - Marking scripts as broken/needs_improvement in the launcher

.EXAMPLE
    .\Sync-YoPrintSkill.ps1
#>

$ErrorActionPreference = "Stop"

# Paths
$sourceFile = Join-Path $PSScriptRoot "CLAUDE.md"
$jsonFile = Join-Path $PSScriptRoot "yoprint-scripts.json"
$skillDir = Join-Path $env:USERPROFILE ".claude\skills\yoprint-api-knowledge"
$skillFile = Join-Path $skillDir "SKILL.md"

# Frontmatter for the skill (triggers auto-loading)
$frontmatter = @"
---
name: yoprint-api-knowledge
description: |
  Use when working with YoPrint API integrations, debugging YoPrint API errors, writing PowerShell scripts for YoPrint, searching for orders/customers/jobs, or implementing any YoPrint automation.

  <example>
  Context: User gets 422 error on scoped_id_search
  user: "Why does scoped_id_search return 422?"
  assistant: "The scoped_id_search endpoint requires BOTH 'type' and 'scoped_id' fields. Use: { type: 'order', scoped_id: 'SO1234' } - not just { id: 'SO1234' }."
  <commentary>
  This is a common gotcha - the API returns 422 if you use 'id' instead of 'scoped_id' or omit the 'type' field.
  </commentary>
  </example>

  <example>
  Context: User tries /services endpoint and gets 404
  user: "Getting 404 on /services endpoint"
  assistant: "The /services endpoint doesn't exist. Use /service_location instead. This is a documentation error in YoPrint's API docs."
  <commentary>
  The documented /service endpoint returns 404 - must use /service_location for all service-related operations.
  </commentary>
  </example>

  <example>
  Context: User trying to use scoped_id in v2 endpoint
  user: "My v2 API call with SO1234 isn't working"
  assistant: "v2 endpoints require UUID, not scoped_id. First search using scoped_id_search to get the UUID, then use that UUID in the v2 endpoint path."
  <commentary>
  v2 API design requires UUIDs. The workflow is: scoped_id -> search -> get UUID -> use in v2 path.
  </commentary>
  </example>

  <example>
  Context: User sending empty arrays in search body
  user: "Search returns 422 when I include filters: []"
  assistant: "YoPrint API rejects empty arrays. Omit 'filters' and 'sort' entirely from the request body instead of sending empty arrays."
  <commentary>
  API validation quirk - empty arrays cause 422 errors. Simply don't include the fields if they're empty.
  </commentary>
  </example>

version: 1.0.0
---

"@

Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "        YOPRINT SKILL SYNC" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""

# Check sources exist
if (-not (Test-Path $sourceFile)) {
    Write-Host "  ERROR: CLAUDE.md not found at:" -ForegroundColor Red
    Write-Host "  $sourceFile" -ForegroundColor Yellow
    Write-Host ""
    exit 1
}

if (-not (Test-Path $jsonFile)) {
    Write-Host "  ERROR: yoprint-scripts.json not found at:" -ForegroundColor Red
    Write-Host "  $jsonFile" -ForegroundColor Yellow
    Write-Host ""
    exit 1
}

Write-Host "  Sources:" -ForegroundColor Gray
Write-Host "    - CLAUDE.md (documentation)" -ForegroundColor White
Write-Host "    - yoprint-scripts.json (test statuses)" -ForegroundColor White
Write-Host "    - api-cookbook.md (verified patterns)" -ForegroundColor White
Write-Host "  Target: " -NoNewline -ForegroundColor Gray
Write-Host "~\.claude\skills\yoprint-api-knowledge\SKILL.md" -ForegroundColor White
Write-Host ""

# Ensure skill directory exists
if (-not (Test-Path $skillDir)) {
    Write-Host "  Creating skill directory..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Path $skillDir -Force | Out-Null
}

# Read CLAUDE.md
Write-Host "  Reading CLAUDE.md..." -ForegroundColor Yellow
$sourceContent = Get-Content $sourceFile -Raw

# Read api-cookbook.md if exists
$cookbookFile = Join-Path $PSScriptRoot "api-cookbook.md"
$cookbookContent = ""
if (Test-Path $cookbookFile) {
    Write-Host "  Reading api-cookbook.md..." -ForegroundColor Yellow
    $cookbookRaw = Get-Content $cookbookFile -Raw
    $cookbookContent = @"

---

## VERIFIED API PATTERNS

The following patterns have been tested and verified working. Use these as reliable references.

$cookbookRaw
"@
}

# Read and parse JSON for test statuses
Write-Host "  Reading yoprint-scripts.json..." -ForegroundColor Yellow
$scriptsData = Get-Content $jsonFile -Raw | ConvertFrom-Json

# Extract action items (broken, needs_improvement, claudeModified)
$broken = @()
$needsImprovement = @()
$claudeModified = @()
$verified = @()

foreach ($script in $scriptsData.scripts) {
    switch ($script.testStatus) {
        "broken" { $broken += $script }
        "needs_improvement" { $needsImprovement += $script }
        "verified" { $verified += $script }
    }
    if ($script.claudeModified) {
        $claudeModified += $script
    }
}

# Build action items section
$actionItems = @"

---

## ACTION ITEMS FOR CLAUDE

These scripts have been flagged by the user and need attention:

### Broken Scripts [X] - $($broken.Count) total
"@

if ($broken.Count -gt 0) {
    foreach ($s in $broken) {
        $note = if ($s.testNote) { " - $($s.testNote)" } else { "" }
        $actionItems += "`n- **$($s.name)** ($($s.method))$note"
    }
} else {
    $actionItems += "`nNone currently."
}

$actionItems += @"


### Needs Improvement [~] - $($needsImprovement.Count) total
"@

if ($needsImprovement.Count -gt 0) {
    foreach ($s in $needsImprovement) {
        $note = if ($s.testNote) { " - $($s.testNote)" } else { "" }
        $actionItems += "`n- **$($s.name)** ($($s.method))$note"
    }
} else {
    $actionItems += "`nNone currently."
}

$actionItems += @"


### Claude Modified (Pending Review) [C] - $($claudeModified.Count) total
"@

if ($claudeModified.Count -gt 0) {
    foreach ($s in $claudeModified) {
        $actionItems += "`n- **$($s.name)** - modified $($s.claudeModified)"
    }
} else {
    $actionItems += "`nNone currently."
}

$actionItems += @"


### Verified Working [+] - $($verified.Count) total
"@

if ($verified.Count -gt 0) {
    $verifiedNames = ($verified | ForEach-Object { $_.name }) -join ", "
    $actionItems += "`n$verifiedNames"
} else {
    $actionItems += "`nNone yet."
}

$actionItems += "`n"

# Combine frontmatter + source content + cookbook + action items
$skillContent = $frontmatter + $sourceContent + $cookbookContent + $actionItems

# Write to skill file
Write-Host "  Writing SKILL.md..." -ForegroundColor Yellow
Set-Content -Path $skillFile -Value $skillContent -Encoding UTF8

# Get file info
$fileInfo = Get-Item $skillFile
$sizeKB = [math]::Round($fileInfo.Length / 1KB, 1)

Write-Host ""
Write-Host "  ============================================" -ForegroundColor Green
Write-Host "              SYNC COMPLETE" -ForegroundColor Green
Write-Host "  ============================================" -ForegroundColor Green
Write-Host ""
Write-Host "  Skill updated: " -NoNewline -ForegroundColor Gray
Write-Host "$sizeKB KB" -ForegroundColor White
Write-Host "  Timestamp:     " -NoNewline -ForegroundColor Gray
Write-Host "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')" -ForegroundColor White
Write-Host ""
Write-Host "  Action Items:" -ForegroundColor Gray
Write-Host "    Broken:            " -NoNewline -ForegroundColor Gray
Write-Host "$($broken.Count)" -ForegroundColor $(if ($broken.Count -gt 0) { "Red" } else { "Green" })
Write-Host "    Needs Improvement: " -NoNewline -ForegroundColor Gray
Write-Host "$($needsImprovement.Count)" -ForegroundColor $(if ($needsImprovement.Count -gt 0) { "Yellow" } else { "Green" })
Write-Host "    Claude Modified:   " -NoNewline -ForegroundColor Gray
Write-Host "$($claudeModified.Count)" -ForegroundColor $(if ($claudeModified.Count -gt 0) { "Magenta" } else { "Green" })
Write-Host "    Verified:          " -NoNewline -ForegroundColor Gray
Write-Host "$($verified.Count)" -ForegroundColor Green
Write-Host ""
