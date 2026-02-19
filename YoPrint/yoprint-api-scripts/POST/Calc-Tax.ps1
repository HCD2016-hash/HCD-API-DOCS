# Calc-Tax.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "            TAX CALCULATOR" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Calculate tax for an amount and address." -ForegroundColor Gray
Write-Host ""

$amount = Read-Host "  Enter amount (e.g., 100.00)"
Write-Host ""
Write-Host "  Enter shipping address:" -ForegroundColor White
$street = Read-Host "    Street"
$city = Read-Host "    City"
$state = Read-Host "    State (e.g., TX)"
$zip = Read-Host "    ZIP Code"
$country = Read-Host "    Country (default: US)"
if (-not $country) { $country = "US" }

Write-Host ""
Write-Host "  Calculating..." -ForegroundColor Yellow

$body = @{
    amount = [decimal]$amount
    address = @{
        street = $street
        city = $city
        state = $state
        postal_code = $zip
        country = $country
    }
} | ConvertTo-Json -Depth 3

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/tax/calculate" -Headers $headers -Method Post -Body $body

    Write-Host ""
    Write-Host "  TAX CALCULATION RESULT" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    if ($response.data) {
        $data = $response.data
        Write-Host "    Subtotal:   `$$amount" -ForegroundColor White
        Write-Host "    Tax Rate:   $($data.rate * 100)%" -ForegroundColor White
        Write-Host "    Tax Amount: `$$($data.tax_amount)" -ForegroundColor Cyan
        Write-Host "    Total:      `$$($data.total)" -ForegroundColor Green
    } else {
        Write-Host "    $($response | ConvertTo-Json -Depth 5)" -ForegroundColor Gray
    }
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
