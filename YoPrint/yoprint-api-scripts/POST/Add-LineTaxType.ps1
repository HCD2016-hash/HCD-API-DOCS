# Add-LineTaxType.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "        CREATE LINE TAX TYPE" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Create a combined tax with multiple lines." -ForegroundColor Gray
Write-Host "  (e.g., State + Local tax)" -ForegroundColor Gray
Write-Host ""
Write-Host "  NOTE: Uses /api/ (no /v1 prefix)" -ForegroundColor Yellow
Write-Host ""

$Name = Read-Host "  Tax name"
Write-Host ""
Write-Host "  Enter tax lines (will prompt for each):" -ForegroundColor Gray

$lineTaxes = @()
$addMore = $true

while ($addMore) {
    $lineName = Read-Host "    Line tax name"
    $lineTotal = Read-Host "    Line tax rate (%)"

    $lineTaxes += @{
        name = $lineName
        total = [double]$lineTotal
    }

    Write-Host "    Add another line? (yes/no): " -NoNewline
    $addMore = (Read-Host) -eq "yes"
}

Write-Host ""
Write-Host "  Tax shipping? (yes/no): " -NoNewline
$TaxShipping = (Read-Host) -eq "yes"
Write-Host "  Enable? (yes/no): " -NoNewline
$Enable = (Read-Host) -eq "yes"
Write-Host "  Default? (yes/no): " -NoNewline
$Default = (Read-Host) -eq "yes"

Write-Host ""
Write-Host "  Creating line tax type..." -ForegroundColor Yellow

$body = @{
    type = "line_tax"
    name = $Name
    total = $null
    line_taxes = $lineTaxes
    shipping_taxable = $TaxShipping
    enable = $Enable
    default = $Default
    apply_before_disc = $false
} | ConvertTo-Json -Depth 3

try {
    # NOTE: No /v1 prefix for tax_type endpoint!
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/api/store/$teamSlug/setting/tax_type" -Headers $headers -Method Post -Body $body

    Write-Host ""
    Write-Host "  SUCCESS: Line tax type created!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    ID: $($response.data.id)" -ForegroundColor Cyan
    Write-Host "    Name: $($response.data.name)" -ForegroundColor White
    Write-Host "    Total Rate: $($response.data.total)%" -ForegroundColor White
    Write-Host ""
    Write-Host "    Line Taxes:" -ForegroundColor White
    foreach ($line in $response.data.line_taxes) {
        Write-Host "      - $($line.name): $($line.total)%" -ForegroundColor Gray
    }
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
