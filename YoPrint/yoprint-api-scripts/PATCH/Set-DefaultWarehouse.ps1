# Set-DefaultWarehouse.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "       SET DEFAULT WAREHOUSE" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Set a location as the default warehouse." -ForegroundColor Gray
Write-Host ""

$LocationId = Read-Host "  Enter location ID"

Write-Host ""
Write-Host "  Setting as default warehouse..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/location/$LocationId/default_warehouse" -Headers $headers -Method Patch

    Write-Host ""
    Write-Host "  SUCCESS: Location set as default warehouse!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    Location: $($response.data.label)" -ForegroundColor Cyan
    Write-Host "    Is Default Warehouse: $($response.data.is_default_warehouse)" -ForegroundColor White
    Write-Host "    Hold Stock: $($response.data.hold_stock)" -ForegroundColor White
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
