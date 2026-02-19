# Get-ShippingTypeById.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "GET SHIPPING TYPE DETAILS" -Description "Get details of a specific shipping type."

$ShipId = Read-Host "  Enter shipping type ID"

Write-Host ""
Write-Host "  Loading shipping type..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/shipping_type/$ShipId" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  SHIPPING TYPE DETAILS" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    ID: $($response.data.id)" -ForegroundColor Cyan
    Write-Host "    Name: $($response.data.name)" -ForegroundColor White
    Write-Host "    Type: $($response.data.type)" -ForegroundColor White
    Write-Host "    Default: $($response.data.default)" -ForegroundColor Gray
    Write-Host ""
    Write-Host "    Price Type: $($response.data.price_type)" -ForegroundColor White
    Write-Host "    Price Percent: $($response.data.price_percent)%" -ForegroundColor Gray
    Write-Host "    Min Price: $($response.data.min_price)" -ForegroundColor Gray
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
