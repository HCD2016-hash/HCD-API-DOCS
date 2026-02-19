# Update-Location.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "        UPDATE COMPANY LOCATION" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Update an existing company location." -ForegroundColor Gray
Write-Host ""

$LocationId = Read-Host "  Enter location ID"
$Label = Read-Host "  Location name/label"
$Address1 = Read-Host "  Address Line 1"
$Address2 = Read-Host "  Address Line 2 (optional)"
$City = Read-Host "  City"
$State = Read-Host "  State name"
$StateCode = Read-Host "  State code"
$Country = Read-Host "  Country name"
$CountryCode = Read-Host "  Country code"
$Postcode = Read-Host "  Postal Code"

Write-Host ""
Write-Host "  Updating location..." -ForegroundColor Yellow

$body = @{
    id = $LocationId
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
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/location/$LocationId" -Headers $headers -Method Put -Body $body

    Write-Host ""
    Write-Host "  SUCCESS: Location updated!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    ID: $($response.data.id)" -ForegroundColor Cyan
    Write-Host "    Label: $($response.data.label)" -ForegroundColor White
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
