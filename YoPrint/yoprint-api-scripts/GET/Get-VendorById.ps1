# Get-VendorById.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "VENDOR DETAILS" -Description "Get full details for a specific vendor."

$VendorId = Read-Host "  Enter vendor ID (UUID)"
Write-Host ""
Write-Host "  Loading..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/vendor/$VendorId" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  VENDOR DETAILS" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    $vendor = $response.data
    Write-Host "    Name: $($vendor.name)" -ForegroundColor White
    Write-Host "    ID: $($vendor.id)" -ForegroundColor Cyan
    if ($vendor.website) { Write-Host "    Website: $($vendor.website)" -ForegroundColor Gray }
    if ($vendor.account_number) { Write-Host "    Account #: $($vendor.account_number)" -ForegroundColor Gray }
    if ($vendor.internal_notes) { Write-Host "    Notes: $($vendor.internal_notes)" -ForegroundColor Gray }
    if ($vendor.default_vendor_note) { Write-Host "    Default Note: $($vendor.default_vendor_note)" -ForegroundColor Gray }

    if ($vendor.contacts -and $vendor.contacts.Count -gt 0) {
        Write-Host ""
        Write-Host "    Contacts:" -ForegroundColor White
        foreach ($contact in $vendor.contacts) {
            $primary = if ($contact.is_primary) { " [PRIMARY]" } else { "" }
            Write-Host "      - $($contact.first_name) $($contact.last_name)$primary" -ForegroundColor Gray
            if ($contact.email) { Write-Host "        Email: $($contact.email)" -ForegroundColor DarkGray }
            if ($contact.phone) { Write-Host "        Phone: $($contact.phone)" -ForegroundColor DarkGray }
        }
    }
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
