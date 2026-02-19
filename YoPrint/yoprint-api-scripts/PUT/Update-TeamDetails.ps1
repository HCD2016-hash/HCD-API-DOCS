# Update-TeamDetails.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "         UPDATE TEAM DETAILS" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Update team contact and business info." -ForegroundColor Gray
Write-Host ""

$Name = Read-Host "  Team/Business name"
$Email = Read-Host "  Email"
$Website = Read-Host "  Website URL"
$Phone = Read-Host "  Phone number"
$PhoneCountry = Read-Host "  Phone country (e.g., US)"
$Timezone = Read-Host "  Timezone (e.g., America/Chicago)"
$TaxNumber = Read-Host "  Tax ID number"

Write-Host ""
Write-Host "  Updating team details..." -ForegroundColor Yellow

$body = @{
    name = $Name
    email = $Email
    website = $Website
    phone = $Phone
    phone_country = $PhoneCountry
    timezone = $Timezone
    tax_number = $TaxNumber
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting" -Headers $headers -Method Put -Body $body

    Write-Host ""
    Write-Host "  SUCCESS: Team details updated!" -ForegroundColor Green
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
