# Setup-TeamAddress.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "        SETUP TEAM ADDRESS" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Configure team address (onboarding)." -ForegroundColor Gray
Write-Host ""

$Address1 = Read-Host "  Address Line 1"
$Address2 = Read-Host "  Address Line 2 (optional)"
$City = Read-Host "  City"
$StateCode = Read-Host "  State Code (e.g., TX)"
$CountryCode = Read-Host "  Country Code (e.g., US)"
$Postcode = Read-Host "  Postal Code"

Write-Host ""
Write-Host "  Setting up team address..." -ForegroundColor Yellow

$body = @{
    address1 = $Address1
    address2 = $Address2
    city = $City
    state_code = $StateCode
    country_code = $CountryCode
    postcode = $Postcode
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/onboard/setup_address" -Headers $headers -Method Put -Body $body

    Write-Host ""
    Write-Host "  SUCCESS: Team address configured!" -ForegroundColor Green
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
