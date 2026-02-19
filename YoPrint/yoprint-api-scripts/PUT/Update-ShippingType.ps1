# Update-ShippingType.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "         UPDATE SHIPPING TYPE" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Update an existing shipping type." -ForegroundColor Gray
Write-Host ""

$ShipId = Read-Host "  Enter shipping type ID"
$Name = Read-Host "  Shipping type name"
Write-Host "  Type (courier/pickup/etc): " -NoNewline
$Type = Read-Host
Write-Host "  Price type (markup/fixed): " -NoNewline
$PriceType = Read-Host
$PricePercent = Read-Host "  Price percentage (for markup)"
$MinPrice = Read-Host "  Minimum price"
Write-Host "  Set as default? (yes/no): " -NoNewline
$Default = (Read-Host) -eq "yes"

Write-Host ""
Write-Host "  Updating shipping type..." -ForegroundColor Yellow

$body = @{
    id = $ShipId
    name = $Name
    type = $Type
    price_type = $PriceType
    price_percent = [double]$PricePercent
    min_price = [double]$MinPrice
    default = $Default
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/shipping_type/$ShipId" -Headers $headers -Method Put -Body $body

    Write-Host ""
    Write-Host "  SUCCESS: Shipping type updated!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    ID: $($response.data.id)" -ForegroundColor Cyan
    Write-Host "    Name: $($response.data.name)" -ForegroundColor White
    Write-Host "    Default: $($response.data.default)" -ForegroundColor Gray
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
