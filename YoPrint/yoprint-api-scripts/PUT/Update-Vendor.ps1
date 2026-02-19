# Update-Vendor.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "             UPDATE VENDOR" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Update an existing vendor's information." -ForegroundColor Gray
Write-Host ""

$VendorId = Read-Host "  Enter vendor ID (UUID)"
Write-Host ""
Write-Host "  Leave blank to keep current value:" -ForegroundColor DarkGray
Write-Host ""
$name = Read-Host "  New name"
$website = Read-Host "  New website"
$accountNum = Read-Host "  New account number"
$notes = Read-Host "  New internal notes"

$body = @{}
if ($name) { $body.name = $name }
if ($website) { $body.website = $website }
if ($accountNum) { $body.account_number = $accountNum }
if ($notes) { $body.internal_notes = $notes }

if ($body.Count -eq 0) {
    Write-Host ""
    Write-Host "  No changes specified." -ForegroundColor Yellow
    Write-Host ""
    exit
}

Write-Host ""
Write-Host "  Updating vendor..." -ForegroundColor Yellow

$jsonBody = $body | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/vendor/$VendorId" -Headers $headers -Method Put -Body $jsonBody

    Write-Host ""
    Write-Host "  SUCCESS: Vendor updated!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    $vendor = $response.data
    Write-Host "    ID: $($vendor.id)" -ForegroundColor Cyan
    Write-Host "    Name: $($vendor.name)" -ForegroundColor White
    if ($vendor.website) { Write-Host "    Website: $($vendor.website)" -ForegroundColor Gray }
    if ($vendor.account_number) { Write-Host "    Account #: $($vendor.account_number)" -ForegroundColor Gray }
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
