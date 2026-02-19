# YoPrint-Init.ps1
# Shared initialization for YoPrint API scripts.

$repoRoot = $PSScriptRoot

Import-Module (Join-Path $repoRoot "YoPrint-Helpers.psm1") -Force
if (Test-Path (Join-Path $repoRoot "YoPrint-ErrorHandler.psm1")) {
    Import-Module (Join-Path $repoRoot "YoPrint-ErrorHandler.psm1") -Force
}

$resolvedTeamSlug = if ($env:YOPRINT_TEAM_SLUG) { $env:YOPRINT_TEAM_SLUG } else { "hub-city-design-inc" }
Set-YoPrintTeamSlug -TeamSlug $resolvedTeamSlug

$teamSlug = $resolvedTeamSlug
$headers = Get-YoPrintHeaders
