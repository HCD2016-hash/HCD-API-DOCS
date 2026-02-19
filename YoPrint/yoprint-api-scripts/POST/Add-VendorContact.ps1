# Add-VendorContact.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "           ADD VENDOR CONTACT" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Add a new contact to an existing vendor." -ForegroundColor Gray
Write-Host ""

$VendorId = Read-Host "  Enter vendor ID (UUID)"
Write-Host ""
Write-Host "  Enter contact details:" -ForegroundColor White
$name = Read-Host "    Name"
$email = Read-Host "    Email"
$phone = Read-Host "    Phone (optional)"
$title = Read-Host "    Title (optional)"
$isPrimary = Read-Host "    Primary contact? (y/n)"

Write-Host ""
Write-Host "  Adding contact..." -ForegroundColor Yellow

$body = @{
    name = $name
    email = $email
}

if ($phone) { $body.phone = $phone }
if ($title) { $body.title = $title }
if ($isPrimary -eq "y") { $body.is_primary = $true }

$jsonBody = $body | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/vendor/$VendorId/contact" -Headers $headers -Method Post -Body $jsonBody

    Write-Host ""
    Write-Host "  SUCCESS: Contact added!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    if ($response.data) {
        $contact = $response.data
        Write-Host "    ID: $($contact.id)" -ForegroundColor Cyan
        Write-Host "    Name: $($contact.name)" -ForegroundColor White
        Write-Host "    Email: $($contact.email)" -ForegroundColor Gray
        if ($contact.phone) { Write-Host "    Phone: $($contact.phone)" -ForegroundColor Gray }
        if ($contact.title) { Write-Host "    Title: $($contact.title)" -ForegroundColor Gray }
    }
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
