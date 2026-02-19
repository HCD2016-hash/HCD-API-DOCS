# Set-PrimaryContact.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Blue
Write-Host "           SET PRIMARY CONTACT" -ForegroundColor Blue
Write-Host "  ============================================" -ForegroundColor Blue
Write-Host ""
Write-Host "  Set a contact as primary for a customer." -ForegroundColor Gray
Write-Host "  Run Get-CustomerContacts first to get IDs." -ForegroundColor DarkGray
Write-Host ""

Write-Host "  Type: 1 = Customer, 2 = Vendor" -ForegroundColor DarkGray
$Type = Read-Host "  Select type (1 or 2)"
Write-Host ""

$EntityId = ""
$ContactId = ""
$endpoint = ""

if ($Type -eq "1") {
    $EntityId = Read-Host "  Enter customer ID (UUID)"
    Write-Host ""
    $ContactId = Read-Host "  Enter contact ID (UUID)"
    $endpoint = "customer/$EntityId/contact/$ContactId/primary"
} elseif ($Type -eq "2") {
    $EntityId = Read-Host "  Enter vendor ID (UUID)"
    Write-Host ""
    $ContactId = Read-Host "  Enter contact ID (UUID)"
    $endpoint = "vendor/$EntityId/contact/$ContactId/primary"
} else {
    Write-Host "  Invalid selection." -ForegroundColor Red
    Write-Host ""
    return
}

Write-Host ""
Write-Host "  Setting as primary contact..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/$endpoint" -Headers $headers -Method Patch

    Write-Host ""
    Write-Host "  SUCCESS: Primary contact updated!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    Contact ID: $ContactId" -ForegroundColor Cyan
    Write-Host "    Now set as PRIMARY" -ForegroundColor White
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
