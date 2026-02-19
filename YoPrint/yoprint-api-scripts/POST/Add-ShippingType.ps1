# Add-ShippingType.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Yellow
Write-Host "           CREATE SHIPPING TYPE" -ForegroundColor Yellow
Write-Host "  ============================================" -ForegroundColor Yellow
Write-Host ""
Write-Host "  Add a new shipping type to YoPrint." -ForegroundColor Gray
Write-Host ""

$Name = Read-Host "  Enter shipping type name"
Write-Host ""
Write-Host "  Type options: courier, pickup, other" -ForegroundColor DarkGray
$Type = Read-Host "  Enter type"
Write-Host ""
$ServiceCode = Read-Host "  Enter service code (optional, press Enter to skip)"
Write-Host ""
Write-Host "  Price type options: markup, flat, free" -ForegroundColor DarkGray
$PriceType = Read-Host "  Enter price type"

$body = @{
    name = $Name
    type = $Type
    price_type = $PriceType
}

if ($ServiceCode) {
    $body.service_code = $ServiceCode
}

if ($PriceType -eq "markup") {
    Write-Host ""
    $PricePercent = Read-Host "  Enter markup percentage (e.g., 10)"
    $body.price_percent = [int]$PricePercent
}

Write-Host ""
$MinPrice = Read-Host "  Enter minimum price (0 for none)"
if ([int]$MinPrice -gt 0) {
    $body.min_price = [int]$MinPrice
}

Write-Host ""
$DefaultInput = Read-Host "  Set as default? (y/n)"
$body.default = $DefaultInput -eq 'y' -or $DefaultInput -eq 'Y'

Write-Host ""
Write-Host "  Creating shipping type..." -ForegroundColor Yellow

$jsonBody = $body | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/shipping_type" -Headers $headers -Method Post -Body $jsonBody

    Write-Host ""
    Write-Host "  SUCCESS: Shipping type created!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    Name: $($response.data.name)" -ForegroundColor White
    Write-Host "    ID:   $($response.data.id)" -ForegroundColor Cyan
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
