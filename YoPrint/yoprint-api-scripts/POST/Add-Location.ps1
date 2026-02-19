# Add-Location.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "        CREATE COMPANY LOCATION" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Add a new company location." -ForegroundColor Gray
Write-Host ""

$Label = Read-Host "  Location name/label"
$Address1 = Read-Host "  Address Line 1"
$Address2 = Read-Host "  Address Line 2 (optional)"
$City = Read-Host "  City"
$State = Read-Host "  State name (e.g., Texas)"
$StateCode = Read-Host "  State code (e.g., TX)"
$Country = Read-Host "  Country name (e.g., United States)"
$CountryCode = Read-Host "  Country code (e.g., US)"
$Postcode = Read-Host "  Postal Code"

Write-Host ""
Write-Host "  Creating location..." -ForegroundColor Yellow

$body = @{
    label = $Label
    address1 = $Address1
    address2 = $Address2
    city = $City
    state = $State
    state_code = $StateCode
    country = $Country
    country_code = $CountryCode
    postcode = $Postcode
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/location" -Headers $headers -Method Post -Body $body

    Write-Host ""
    Write-Host "  SUCCESS: Location created!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    ID: $($response.data.id)" -ForegroundColor Cyan
    Write-Host "    Label: $($response.data.label)" -ForegroundColor White
    Write-Host "    Primary: $($response.data.is_primary)" -ForegroundColor Gray
    Write-Host "    Default Warehouse: $($response.data.is_default_warehouse)" -ForegroundColor Gray
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
