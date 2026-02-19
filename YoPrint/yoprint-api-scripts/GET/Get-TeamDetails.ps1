# Get-TeamDetails.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "GET TEAM DETAILS" -Description "Get team contact and business information."
Write-Host "  Loading team details..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/detail" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  TEAM DETAILS" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    Name: $($response.data.name)" -ForegroundColor Cyan
    Write-Host "    Email: $($response.data.email)" -ForegroundColor White
    Write-Host "    Website: $($response.data.website)" -ForegroundColor White
    Write-Host "    Phone: $($response.data.phone)" -ForegroundColor White
    Write-Host "    Timezone: $($response.data.timezone)" -ForegroundColor White
    Write-Host "    Tax Number: $($response.data.tax_number)" -ForegroundColor White
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
