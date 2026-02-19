# Remove-Vendor.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "             DELETE VENDOR" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Permanently delete a vendor from YoPrint." -ForegroundColor Gray
Write-Host ""
Write-Host "  WARNING: This action cannot be undone!" -ForegroundColor Red
Write-Host ""

$VendorId = Read-Host "  Enter vendor ID (UUID)"
Write-Host ""
Write-Host "  Are you sure you want to delete this vendor? (yes/no): " -NoNewline
$confirm = Read-Host

if ($confirm -ne "yes") {
    Write-Host ""
    Write-Host "  Cancelled." -ForegroundColor Yellow
    Write-Host ""
    exit
}

Write-Host ""
Write-Host "  Deleting vendor..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/vendor/$VendorId" -Headers $headers -Method Delete

    Write-Host ""
    Write-Host "  SUCCESS: Vendor deleted!" -ForegroundColor Green
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
