. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "GET VENDOR CONTACTS" -Description "View all contacts for a vendor/supplier."
$VendorId = Read-Host "  Enter Vendor ID (UUID)"

if ([string]::IsNullOrWhiteSpace($VendorId)) {
    Write-Host ""; Write-Host "  ERROR: Vendor ID is required!" -ForegroundColor Red; Write-Host ""; exit
}

Write-Host ""; Write-Host "  Loading..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/vendor/$VendorId/contact" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  --------------------------------------------" -ForegroundColor Green
    Write-Host "  RESULTS: Found $($response.data.Count) contacts" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    if ($response.data.Count -eq 0) {
        Write-Host "  No contacts for this vendor." -ForegroundColor Gray
    } else {
        foreach ($c in $response.data) {
            $primary = if ($c.is_primary) { "[PRIMARY]" } else { "" }
            Write-Host "  $($c.first_name) $($c.last_name) $primary" -ForegroundColor White
            Write-Host "     Email: $($c.email)" -ForegroundColor Gray
            Write-Host "     Phone: $($c.phone)" -ForegroundColor Gray
            Write-Host ""
        }
    }
} catch {
    Write-Host ""; Write-Host "  ERROR: Could not find vendor" -ForegroundColor Red
    Write-Host "  $($_.Exception.Message)" -ForegroundColor DarkGray
    Write-Host ""
}
