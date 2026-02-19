$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "         ADD ADDRESS TO CUSTOMER" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Add a new address to a customer." -ForegroundColor Gray
Write-Host ""

$CustomerId = Read-Host "  Enter Customer ID (UUID)"
if ([string]::IsNullOrWhiteSpace($CustomerId)) {
    Write-Host ""; Write-Host "  ERROR: Customer ID is required!" -ForegroundColor Red; Write-Host ""; exit
}

Write-Host ""
Write-Host "  -----------------------------------------" -ForegroundColor DarkGray
Write-Host "  Enter address details:" -ForegroundColor Yellow
Write-Host ""

$Label = Read-Host "  Label (e.g., Main Office, Warehouse)"
$Address1 = Read-Host "  Street Address"
$Address2 = Read-Host "  Address Line 2 (optional, Enter to skip)"
$City = Read-Host "  City"
$StateCode = Read-Host "  State Code (e.g., TX, CA)"
$PostCode = Read-Host "  ZIP/Postal Code"
$CountryCode = Read-Host "  Country Code (e.g., US)"

Write-Host ""
Write-Host "  Address Type:" -ForegroundColor Yellow
Write-Host "    1. Shipping" -ForegroundColor Gray
Write-Host "    2. Billing" -ForegroundColor Gray
$RoleChoice = Read-Host "  Enter 1 or 2"
$Role = if ($RoleChoice -eq "2") { "billing" } else { "shipping" }

$IsPrimary = Read-Host "  Make this the primary address? (Y/N)"

Write-Host ""; Write-Host "  Saving..." -ForegroundColor Yellow

$body = @{
    label = $Label
    address1 = $Address1
    address2 = $Address2
    city = $City
    state_code = $StateCode
    postcode = $PostCode
    country_code = $CountryCode
    role = $Role
    is_primary = ($IsPrimary -eq "Y" -or $IsPrimary -eq "y")
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/customer/$CustomerId/address" -Headers $headers -Method Post -Body $body

    Write-Host ""
    Write-Host "  --------------------------------------------" -ForegroundColor Green
    Write-Host "  SUCCESS: Address added" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
} catch {
    Write-Host ""; Write-Host "  ERROR: Failed to add address" -ForegroundColor Red
    Write-Host "  $($_.Exception.Message)" -ForegroundColor DarkGray
    Write-Host ""
}
