# Calc-TaxByCustomer.ps1
# Uses customer's saved address for tax calculation
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "        TAX CALC BY CUSTOMER ADDRESS" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Calculate tax using a customer's saved address." -ForegroundColor Gray
Write-Host ""

$CustomerId = Read-Host "  Enter customer ID (UUID)"
$AddressId = Read-Host "  Enter address ID (UUID)"

Write-Host ""
Write-Host "  Calculating..." -ForegroundColor Yellow

$body = @{
    customer_id = $CustomerId
    address_id = $AddressId
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/misc/calc_tax" -Headers $headers -Method Post -Body $body

    Write-Host ""
    Write-Host "  TAX CALCULATION RESULT" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    $data = $response.data
    Write-Host "    Type: $($data.type)" -ForegroundColor White
    Write-Host "    Total Tax: $($data.total)" -ForegroundColor Cyan
    Write-Host "    Shipping Taxable: $($data.shipping_taxable)" -ForegroundColor Gray
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
