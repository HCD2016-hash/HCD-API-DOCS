# Remove-PaymentMethod.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Red
Write-Host "          DELETE PAYMENT METHOD" -ForegroundColor Red
Write-Host "  ============================================" -ForegroundColor Red
Write-Host ""
Write-Host "  Remove a payment method from YoPrint." -ForegroundColor Gray
Write-Host "  Run Get-PaymentMethods first to get the ID." -ForegroundColor DarkGray
Write-Host ""
Write-Host "  WARNING: This action cannot be undone!" -ForegroundColor Yellow
Write-Host ""

$MethodId = Read-Host "  Enter payment method ID (UUID)"
Write-Host ""
$Confirm = Read-Host "  Type 'DELETE' to confirm"

if ($Confirm -ne 'DELETE') {
    Write-Host ""
    Write-Host "  Cancelled. Payment method was NOT deleted." -ForegroundColor Yellow
    Write-Host ""
    return
}

Write-Host ""
Write-Host "  Deleting payment method..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/payment_method/$MethodId" -Headers $headers -Method Delete

    Write-Host ""
    Write-Host "  SUCCESS: Payment method deleted!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
