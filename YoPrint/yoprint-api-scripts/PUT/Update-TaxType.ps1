# Update-TaxType.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "           UPDATE TAX TYPE" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Update an existing tax type." -ForegroundColor Gray
Write-Host ""
Write-Host "  NOTE: Uses /api/ (no /v1 prefix)" -ForegroundColor Yellow
Write-Host ""

$TaxId = Read-Host "  Enter tax type ID"
$Name = Read-Host "  Tax name"
$Total = Read-Host "  Tax rate percentage"
Write-Host "  Tax shipping? (yes/no): " -NoNewline
$TaxShipping = (Read-Host) -eq "yes"
Write-Host "  Enable? (yes/no): " -NoNewline
$Enable = (Read-Host) -eq "yes"
Write-Host "  Default? (yes/no): " -NoNewline
$Default = (Read-Host) -eq "yes"
Write-Host "  Apply before discount? (yes/no): " -NoNewline
$ApplyBefore = (Read-Host) -eq "yes"

Write-Host ""
Write-Host "  Updating tax type..." -ForegroundColor Yellow

$body = @{
    id = $TaxId
    name = $Name
    total = [double]$Total
    shipping_taxable = $TaxShipping
    enable = $Enable
    default = $Default
    apply_before_disc = $ApplyBefore
} | ConvertTo-Json

try {
    # NOTE: No /v1 prefix for tax_type endpoint!
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/api/store/$teamSlug/setting/tax_type/$TaxId" -Headers $headers -Method Put -Body $body

    Write-Host ""
    Write-Host "  SUCCESS: Tax type updated!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    ID: $($response.data.id)" -ForegroundColor Cyan
    Write-Host "    Name: $($response.data.name)" -ForegroundColor White
    Write-Host "    Rate: $($response.data.total)%" -ForegroundColor White
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
