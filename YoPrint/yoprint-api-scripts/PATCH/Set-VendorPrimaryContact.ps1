# Set-VendorPrimaryContact.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "       SET VENDOR PRIMARY CONTACT" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Set a contact as the primary for a vendor." -ForegroundColor Gray
Write-Host ""

$VendorId = Read-Host "  Enter vendor ID (UUID)"
$ContactId = Read-Host "  Enter contact ID (UUID)"

Write-Host ""
Write-Host "  Updating primary contact..." -ForegroundColor Yellow

$body = @{
    id = $ContactId
    vendor_id = $VendorId
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/vendor/$VendorId/contact/$ContactId/primary" -Headers $headers -Method Patch -Body $body

    Write-Host ""
    Write-Host "  SUCCESS: Primary contact updated!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    $contact = $response.data
    Write-Host "    Contact: $($contact.first_name) $($contact.last_name)" -ForegroundColor White
    Write-Host "    Primary: $($contact.is_primary)" -ForegroundColor Green
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
