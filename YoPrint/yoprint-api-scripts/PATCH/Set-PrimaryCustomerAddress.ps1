# Set-PrimaryCustomerAddress.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "      SET PRIMARY CUSTOMER ADDRESS" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Set an address as primary for a customer." -ForegroundColor Gray
Write-Host ""

$CustomerId = Read-Host "  Enter customer ID (UUID)"
$AddressId = Read-Host "  Enter address ID (UUID)"

Write-Host ""
Write-Host "  Setting primary address..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/customer/$CustomerId/address/$AddressId/primary" -Headers $headers -Method Patch

    Write-Host ""
    Write-Host "  SUCCESS: Primary address updated!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    $addr = $response.data
    Write-Host "    Label: $($addr.label)" -ForegroundColor White
    Write-Host "    Address: $($addr.address1), $($addr.city)" -ForegroundColor Gray
    Write-Host "    Primary: $($addr.is_primary)" -ForegroundColor Green
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
