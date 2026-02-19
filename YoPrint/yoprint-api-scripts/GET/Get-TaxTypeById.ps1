# Get-TaxTypeById.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "GET TAX TYPE DETAILS" -Description "Get details of a specific tax type."
Write-Host "  NOTE: v1 prefix IS required" -ForegroundColor DarkGray
Write-Host ""

$TaxId = Read-Host "  Enter tax type ID"

Write-Host ""
Write-Host "  Loading tax type..." -ForegroundColor Yellow

try {
    # NOTE: v1 prefix IS required (contrary to old docs)
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/tax_type/$TaxId" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  TAX TYPE DETAILS" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    ID: $($response.data.id)" -ForegroundColor Cyan
    Write-Host "    Name: $($response.data.name)" -ForegroundColor White
    Write-Host "    Type: $($response.data.type)" -ForegroundColor White
    Write-Host "    Rate: $($response.data.total)%" -ForegroundColor White
    Write-Host ""
    Write-Host "    Shipping Taxable: $($response.data.shipping_taxable)" -ForegroundColor Gray
    Write-Host "    Enabled: $($response.data.enable)" -ForegroundColor Gray
    Write-Host "    Default: $($response.data.default)" -ForegroundColor Gray
    Write-Host "    Apply Before Discount: $($response.data.apply_before_disc)" -ForegroundColor Gray
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
