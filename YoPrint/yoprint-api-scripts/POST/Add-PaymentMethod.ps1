# Add-PaymentMethod.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Yellow
Write-Host "           CREATE PAYMENT METHOD" -ForegroundColor Yellow
Write-Host "  ============================================" -ForegroundColor Yellow
Write-Host ""
Write-Host "  Add a new payment method to YoPrint." -ForegroundColor Gray
Write-Host ""
Write-Host "  Examples:  Cash  |  Check  |  Credit Card  |  ACH" -ForegroundColor DarkGray
Write-Host ""

$Name = Read-Host "  Enter payment method name"
Write-Host ""
$DefaultInput = Read-Host "  Set as default? (y/n)"
$IsDefault = $DefaultInput -eq 'y' -or $DefaultInput -eq 'Y'
Write-Host ""
Write-Host "  Creating payment method..." -ForegroundColor Yellow

$body = @{
    name = $Name
    default = $IsDefault
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/payment_method" -Headers $headers -Method Post -Body $body

    Write-Host ""
    Write-Host "  SUCCESS: Payment method created!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    Name: $($response.data.name)" -ForegroundColor White
    Write-Host "    ID:   $($response.data.id)" -ForegroundColor Cyan
    Write-Host "    Default: $($response.data.default)" -ForegroundColor Gray
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
