# Get-Pipelines.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "PIPELINE CONFIGURATIONS" -Description "View all workflow pipelines and their statuses."
Write-Host "  Loading..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/pipeline" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  RESULTS: Found $($response.data.Count) pipelines" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    if ($response.data.Count -eq 0) {
        Write-Host "  No pipelines found." -ForegroundColor Yellow
    } else {
        foreach ($pipeline in $response.data) {
            $enabled = if ($pipeline.enable) { "Enabled" } else { "Disabled" }
            $enabledColor = if ($pipeline.enable) { "Green" } else { "Red" }

            Write-Host "  [$($pipeline.label)]" -ForegroundColor Cyan
            Write-Host "    ID: $($pipeline.id)" -ForegroundColor DarkGray
            Write-Host "    Status: " -ForegroundColor Gray -NoNewline
            Write-Host $enabled -ForegroundColor $enabledColor
            Write-Host "    Color: $($pipeline.color)" -ForegroundColor Gray

            if ($pipeline.statuses -and $pipeline.statuses.Count -gt 0) {
                Write-Host "    Statuses:" -ForegroundColor Gray
                foreach ($status in $pipeline.statuses | Sort-Object position) {
                    $typeIcon = switch ($status.type) {
                        "start" { "[START]" }
                        "end" { "[END]" }
                        default { "       " }
                    }
                    Write-Host "      $typeIcon $($status.label)" -ForegroundColor White
                }
            }
            Write-Host ""
        }
    }
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
