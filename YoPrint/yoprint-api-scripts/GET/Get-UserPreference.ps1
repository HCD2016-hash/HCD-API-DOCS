# Get-UserPreference.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "GET USER PREFERENCE" -Description "Get current user's UI preferences."
Write-Host "  Loading preferences..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/current_user_preference" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  USER PREFERENCES" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    Version: $($response.data.version)" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "    Column Orders:" -ForegroundColor White

    if ($response.data.column_order) {
        foreach ($grid in $response.data.column_order.PSObject.Properties) {
            Write-Host "      $($grid.Name):" -ForegroundColor Gray
            foreach ($col in $grid.Value) {
                $hidden = if ($col.hide) { " [hidden]" } else { "" }
                Write-Host "        - $($col.colId) (width: $($col.width))$hidden" -ForegroundColor DarkGray
            }
        }
    }
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
