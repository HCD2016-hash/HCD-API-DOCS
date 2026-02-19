# Get-TeamSettings.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "TEAM SETTINGS" -Description "View your YoPrint team configuration."
Write-Host "  Loading..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  TEAM SETTINGS" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    if ($response.data) {
        $data = $response.data

        if ($data.name) { Write-Host "    Team Name: $($data.name)" -ForegroundColor White }
        if ($data.email) { Write-Host "    Email: $($data.email)" -ForegroundColor Gray }
        if ($data.phone) { Write-Host "    Phone: $($data.phone)" -ForegroundColor Gray }
        if ($data.website) { Write-Host "    Website: $($data.website)" -ForegroundColor Gray }
        if ($data.timezone) { Write-Host "    Timezone: $($data.timezone)" -ForegroundColor Gray }
        if ($data.currency) { Write-Host "    Currency: $($data.currency)" -ForegroundColor Gray }
        if ($data.date_format) { Write-Host "    Date Format: $($data.date_format)" -ForegroundColor Gray }

        Write-Host ""
        Write-Host "    Full Response:" -ForegroundColor DarkGray
        $response.data | ConvertTo-Json -Depth 3 | ForEach-Object { Write-Host "    $_" -ForegroundColor DarkGray }
    } else {
        Write-Host "    No settings data returned." -ForegroundColor Yellow
    }
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
