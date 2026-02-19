# Update-Currency.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Magenta
Write-Host "             UPDATE CURRENCY" -ForegroundColor Magenta
Write-Host "  ============================================" -ForegroundColor Magenta
Write-Host ""
Write-Host "  Update currency settings." -ForegroundColor Gray
Write-Host "  Run Get-Currencies first to see current config." -ForegroundColor DarkGray
Write-Host ""

$CurrencyId = Read-Host "  Enter currency ID (UUID)"
Write-Host ""
$Code = Read-Host "  Enter currency code (e.g., USD)"
$Name = Read-Host "  Enter currency name (e.g., US Dollar)"
$Symbol = Read-Host "  Enter symbol (e.g., $)"
Write-Host ""
$ExchangeRate = Read-Host "  Enter exchange rate (1.0 for base)"
Write-Host ""
$DefaultInput = Read-Host "  Set as default? (y/n)"

$body = @{
    id = $CurrencyId
    code = $Code
    name = $Name
    symbol = $Symbol
    exchange_rate = [double]$ExchangeRate
    default = $DefaultInput -eq 'y' -or $DefaultInput -eq 'Y'
} | ConvertTo-Json

Write-Host ""
Write-Host "  Updating currency..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/currency" -Headers $headers -Method Put -Body $body

    Write-Host ""
    Write-Host "  SUCCESS: Currency updated!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    Code: $Code" -ForegroundColor White
    Write-Host "    Name: $Name" -ForegroundColor Cyan
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
