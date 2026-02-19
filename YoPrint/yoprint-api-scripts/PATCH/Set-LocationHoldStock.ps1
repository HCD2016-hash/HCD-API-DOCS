# Set-LocationHoldStock.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "       TOGGLE LOCATION HOLD STOCK" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Toggle the hold stock status for a location." -ForegroundColor Gray
Write-Host ""

$LocationId = Read-Host "  Enter location ID"

Write-Host ""
Write-Host "  Toggling hold stock status..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/location/$LocationId/hold_stock" -Headers $headers -Method Patch

    Write-Host ""
    Write-Host "  SUCCESS: Hold stock status toggled!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    Location: $($response.data.label)" -ForegroundColor Cyan
    Write-Host "    Hold Stock: $($response.data.hold_stock)" -ForegroundColor White
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
