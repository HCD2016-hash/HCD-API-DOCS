# Remove-TaxType.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "           REMOVE TAX TYPE" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Delete a tax type configuration." -ForegroundColor Gray
Write-Host ""
Write-Host "  NOTE: Uses /api/ (no /v1 prefix)" -ForegroundColor Yellow
Write-Host "  WARNING: This action cannot be undone!" -ForegroundColor Red
Write-Host ""

$TaxId = Read-Host "  Enter tax type ID"
Write-Host ""
Write-Host "  Are you sure? (yes/no): " -NoNewline
$confirm = Read-Host

if ($confirm -ne "yes") {
    Write-Host ""
    Write-Host "  Cancelled." -ForegroundColor Yellow
    Write-Host ""
    exit
}

Write-Host ""
Write-Host "  Removing tax type..." -ForegroundColor Yellow

try {
    # NOTE: No /v1 prefix for tax_type endpoint!
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/api/store/$teamSlug/setting/tax_type/$TaxId" -Headers $headers -Method Delete

    Write-Host ""
    Write-Host "  SUCCESS: Tax type deleted!" -ForegroundColor Green
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
