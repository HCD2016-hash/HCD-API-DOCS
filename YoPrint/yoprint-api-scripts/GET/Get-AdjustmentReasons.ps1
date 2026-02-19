# Get-AdjustmentReasons.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "ADJUSTMENT REASONS" -Description "View all configured adjustment reasons."
Write-Host "  Loading..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/adjustment_reason" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  RESULTS: Found $($response.data.Count) adjustment reasons" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    if ($response.data.Count -eq 0) {
        Write-Host "  No adjustment reasons found." -ForegroundColor Yellow
    } else {
        foreach ($reason in $response.data) {
            Write-Host "    $($reason.name)" -ForegroundColor White
            Write-Host "      ID: $($reason.id)" -ForegroundColor DarkGray
            if ($reason.description) {
                Write-Host "      $($reason.description)" -ForegroundColor Gray
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
