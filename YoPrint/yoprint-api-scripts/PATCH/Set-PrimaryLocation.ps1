# Set-PrimaryLocation.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "        SET PRIMARY LOCATION" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Set a location as the primary location." -ForegroundColor Gray
Write-Host ""

$LocationId = Read-Host "  Enter location ID"

Write-Host ""
Write-Host "  Setting as primary location..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/location/$LocationId/primary" -Headers $headers -Method Patch

    Write-Host ""
    Write-Host "  SUCCESS: Location set as primary!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    Location: $($response.data.label)" -ForegroundColor Cyan
    Write-Host "    Is Primary: $($response.data.is_primary)" -ForegroundColor White
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
