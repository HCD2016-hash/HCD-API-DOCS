# Update-CustomerAddress.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "        UPDATE CUSTOMER ADDRESS" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Update an existing customer address." -ForegroundColor Gray
Write-Host ""

$CustomerId = Read-Host "  Enter customer ID (UUID)"
$AddressId = Read-Host "  Enter address ID (UUID)"
Write-Host ""
Write-Host "  Leave blank to keep current value:" -ForegroundColor DarkGray
Write-Host ""
$label = Read-Host "  Label (e.g., Main Office)"
$address1 = Read-Host "  Address line 1"
$address2 = Read-Host "  Address line 2"
$city = Read-Host "  City"
$stateCode = Read-Host "  State code (e.g., TX)"
$postcode = Read-Host "  ZIP/Postal code"
$countryCode = Read-Host "  Country code (e.g., US)"
$note = Read-Host "  Note"

$body = @{}
if ($label) { $body.label = $label }
if ($address1) { $body.address1 = $address1 }
if ($address2) { $body.address2 = $address2 }
if ($city) { $body.city = $city }
if ($stateCode) { $body.state_code = $stateCode }
if ($postcode) { $body.postcode = $postcode }
if ($countryCode) { $body.country_code = $countryCode }
if ($note) { $body.note = $note }

Write-Host ""
Write-Host "  Updating address..." -ForegroundColor Yellow

$jsonBody = $body | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/customer/$CustomerId/address/$AddressId" -Headers $headers -Method Put -Body $jsonBody

    Write-Host ""
    Write-Host "  SUCCESS: Address updated!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    $addr = $response.data
    Write-Host "    ID: $($addr.id)" -ForegroundColor Cyan
    Write-Host "    Label: $($addr.label)" -ForegroundColor White
    Write-Host "    Address: $($addr.address1), $($addr.city)" -ForegroundColor Gray
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
