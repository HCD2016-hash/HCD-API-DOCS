# Review-ActionItems.ps1
# Lists all scripts that need Claude's attention (broken or needs_improvement)
# Run this script to see what needs to be fixed

param(
    [ValidateSet("all", "broken", "needs_improvement")]
    [string]$Filter = "all",

    [switch]$Json,

    [switch]$Brief
)

$basePath = $PSScriptRoot
$jsonPath = Join-Path $basePath "yoprint-scripts.json"

if (-not (Test-Path $jsonPath)) {
    Write-Host "ERROR: yoprint-scripts.json not found" -ForegroundColor Red
    exit 1
}

$metadata = Get-Content $jsonPath -Raw | ConvertFrom-Json

# Get action items based on filter
$actionItems = switch ($Filter) {
    "broken" {
        $metadata.scripts | Where-Object { $_.testStatus -eq "broken" }
    }
    "needs_improvement" {
        $metadata.scripts | Where-Object { $_.testStatus -eq "needs_improvement" }
    }
    default {
        $metadata.scripts | Where-Object { $_.testStatus -in @("broken", "needs_improvement") }
    }
}

if ($Json) {
    # Output as JSON for programmatic use
    $actionItems | ConvertTo-Json -Depth 5
    exit 0
}

# Display header
Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Magenta
Write-Host "       YOPRINT API - ACTION ITEMS" -ForegroundColor Magenta
Write-Host "  ============================================" -ForegroundColor Magenta
Write-Host ""

$brokenCount = ($actionItems | Where-Object { $_.testStatus -eq "broken" }).Count
$improvementCount = ($actionItems | Where-Object { $_.testStatus -eq "needs_improvement" }).Count

Write-Host "  Summary:" -ForegroundColor White
Write-Host "    Broken [X]:           $brokenCount" -ForegroundColor Red
Write-Host "    Needs Improvement [~]: $improvementCount" -ForegroundColor Cyan
Write-Host "    Total Action Items:   $($actionItems.Count)" -ForegroundColor Yellow
Write-Host ""

if ($actionItems.Count -eq 0) {
    Write-Host "  No action items found!" -ForegroundColor Green
    Write-Host ""
    exit 0
}

Write-Host "  ════════════════════════════════════════════" -ForegroundColor DarkGray
Write-Host ""

# Group by status
$broken = $actionItems | Where-Object { $_.testStatus -eq "broken" }
$needsImprovement = $actionItems | Where-Object { $_.testStatus -eq "needs_improvement" }

if ($broken.Count -gt 0) {
    Write-Host "  BROKEN SCRIPTS [X]" -ForegroundColor Red
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray

    foreach ($script in $broken | Sort-Object name) {
        Write-Host ""
        Write-Host "  Script: " -NoNewline -ForegroundColor Gray
        Write-Host "$($script.name)" -ForegroundColor White
        Write-Host "  Path:   " -NoNewline -ForegroundColor Gray
        Write-Host "$($script.path)" -ForegroundColor DarkGray
        Write-Host "  Method: " -NoNewline -ForegroundColor Gray
        Write-Host "$($script.method)" -ForegroundColor Yellow
        if ($script.endpoint) {
            Write-Host "  API:    " -NoNewline -ForegroundColor Gray
            Write-Host "$($script.endpoint)" -ForegroundColor DarkCyan
        }
        if ($script.testNote) {
            Write-Host "  Error:  " -NoNewline -ForegroundColor Gray
            Write-Host "$($script.testNote)" -ForegroundColor Red
        }
        if ($script.testDate) {
            Write-Host "  Date:   " -NoNewline -ForegroundColor Gray
            Write-Host "$($script.testDate)" -ForegroundColor DarkGray
        }

        if (-not $Brief) {
            $fullPath = Join-Path $basePath $script.path
            Write-Host "  Full:   " -NoNewline -ForegroundColor Gray
            Write-Host "$fullPath" -ForegroundColor DarkGray
        }
    }
    Write-Host ""
}

if ($needsImprovement.Count -gt 0) {
    Write-Host "  NEEDS IMPROVEMENT [~]" -ForegroundColor Cyan
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray

    foreach ($script in $needsImprovement | Sort-Object name) {
        Write-Host ""
        Write-Host "  Script: " -NoNewline -ForegroundColor Gray
        Write-Host "$($script.name)" -ForegroundColor White
        Write-Host "  Path:   " -NoNewline -ForegroundColor Gray
        Write-Host "$($script.path)" -ForegroundColor DarkGray
        Write-Host "  Method: " -NoNewline -ForegroundColor Gray
        Write-Host "$($script.method)" -ForegroundColor Yellow
        if ($script.endpoint) {
            Write-Host "  API:    " -NoNewline -ForegroundColor Gray
            Write-Host "$($script.endpoint)" -ForegroundColor DarkCyan
        }
        if ($script.testNote) {
            Write-Host "  Issue:  " -NoNewline -ForegroundColor Gray
            Write-Host "$($script.testNote)" -ForegroundColor Cyan
        }
        if ($script.testDate) {
            Write-Host "  Date:   " -NoNewline -ForegroundColor Gray
            Write-Host "$($script.testDate)" -ForegroundColor DarkGray
        }

        if (-not $Brief) {
            $fullPath = Join-Path $basePath $script.path
            Write-Host "  Full:   " -NoNewline -ForegroundColor Gray
            Write-Host "$fullPath" -ForegroundColor DarkGray
        }
    }
    Write-Host ""
}

Write-Host "  ════════════════════════════════════════════" -ForegroundColor DarkGray
Write-Host ""
Write-Host "  Usage:" -ForegroundColor White
Write-Host "    .\Review-ActionItems.ps1              # Show all action items" -ForegroundColor Gray
Write-Host "    .\Review-ActionItems.ps1 -Filter broken" -ForegroundColor Gray
Write-Host "    .\Review-ActionItems.ps1 -Filter needs_improvement" -ForegroundColor Gray
Write-Host "    .\Review-ActionItems.ps1 -Json       # Output as JSON" -ForegroundColor Gray
Write-Host "    .\Review-ActionItems.ps1 -Brief      # Hide full paths" -ForegroundColor Gray
Write-Host ""
