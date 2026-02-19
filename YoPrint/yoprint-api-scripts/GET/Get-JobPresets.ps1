# Get-JobPresets.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "JOB PRESETS LIST" -Description "View all configured job presets."
Write-Host "  Loading job presets..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/job_preset" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  RESULTS: Found $($response.data.Count) job presets" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    if ($response.data.Count -eq 0) {
        Write-Host "  No job presets found." -ForegroundColor Yellow
    } else {
        $i = 1
        foreach ($preset in $response.data) {
            Write-Host "    $i. " -ForegroundColor DarkGray -NoNewline
            Write-Host "$($preset.name)" -ForegroundColor White
            if ($preset.id) {
                Write-Host "       ID: $($preset.id)" -ForegroundColor DarkGray
            }
            if ($preset.description) {
                Write-Host "       $($preset.description)" -ForegroundColor Gray
            }
            $i++
        }
    }
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
