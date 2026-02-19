# Get-CustomerAddressById.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "CUSTOMER ADDRESS DETAILS" -Description "Get details for a specific address."

$CustomerId = Read-Host "  Enter customer ID (UUID)"
$AddressId = Read-Host "  Enter address ID (UUID)"
Write-Host ""
Write-Host "  Loading..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/customer/$CustomerId/address/$AddressId" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  ADDRESS DETAILS" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    $addr = $response.data
    $primary = if ($addr.is_primary) { " [PRIMARY]" } else { "" }

    Write-Host "    Label: $($addr.label)$primary" -ForegroundColor White
    Write-Host "    ID: $($addr.id)" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "    Address:" -ForegroundColor Gray
    Write-Host "      $($addr.address1)" -ForegroundColor White
    if ($addr.address2) { Write-Host "      $($addr.address2)" -ForegroundColor White }
    Write-Host "      $($addr.city), $($addr.state_code) $($addr.postcode)" -ForegroundColor White
    Write-Host "      $($addr.country)" -ForegroundColor White
    Write-Host ""
    if ($addr.role) { Write-Host "    Role: $($addr.role)" -ForegroundColor Gray }
    if ($addr.note) { Write-Host "    Note: $($addr.note)" -ForegroundColor DarkGray }
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
