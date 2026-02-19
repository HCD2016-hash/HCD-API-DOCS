# Add-Vendor.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "              ADD NEW VENDOR" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Create a new vendor in YoPrint." -ForegroundColor Gray
Write-Host ""

$name = Read-Host "  Vendor name"
$website = Read-Host "  Website (optional)"
$accountNum = Read-Host "  Account number (optional)"
$notes = Read-Host "  Internal notes (optional)"

Write-Host ""
Write-Host "  Add primary contact? (y/n): " -NoNewline
$addContact = Read-Host

$body = @{ name = $name }
if ($website) { $body.website = $website }
if ($accountNum) { $body.account_number = $accountNum }
if ($notes) { $body.internal_notes = $notes }

if ($addContact -eq "y") {
    Write-Host ""
    Write-Host "  Contact details:" -ForegroundColor White
    $firstName = Read-Host "    First name"
    $lastName = Read-Host "    Last name"
    $email = Read-Host "    Email"
    $phone = Read-Host "    Phone (optional)"

    $contact = @{
        first_name = $firstName
        last_name = $lastName
        email = $email
        is_primary = $true
    }
    if ($phone) { $contact.phone = $phone }
    $body.contact = @($contact)
}

Write-Host ""
Write-Host "  Creating vendor..." -ForegroundColor Yellow

$jsonBody = $body | ConvertTo-Json -Depth 3

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/vendor" -Headers $headers -Method Post -Body $jsonBody

    Write-Host ""
    Write-Host "  SUCCESS: Vendor created!" -ForegroundColor Green
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
