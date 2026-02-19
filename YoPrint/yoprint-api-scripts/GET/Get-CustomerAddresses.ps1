. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "GET CUSTOMER ADDRESSES" -Description "View all addresses for a customer."
$CustomerId = Read-Host "  Enter Customer ID (UUID)"

if ([string]::IsNullOrWhiteSpace($CustomerId)) {
    Write-Host ""; Write-Host "  ERROR: Customer ID is required!" -ForegroundColor Red; Write-Host ""; exit
}

Write-Host ""; Write-Host "  Loading..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/customer/$CustomerId/address" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  --------------------------------------------" -ForegroundColor Green
    Write-Host "  RESULTS: Found $($response.data.Count) addresses" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    if ($response.data.Count -eq 0) {
        Write-Host "  No addresses for this customer." -ForegroundColor Gray
    } else {
        foreach ($a in $response.data) {
            $primary = if ($a.is_primary) { "*" } else { " " }
            $role = "[$($a.role)]"
            Write-Host "  $primary $($a.label) $role" -ForegroundColor White
            Write-Host "     $($a.address1)" -ForegroundColor Gray
            if ($a.address2) { Write-Host "     $($a.address2)" -ForegroundColor Gray }
            Write-Host "     $($a.city), $($a.state_code) $($a.postcode)" -ForegroundColor Gray
            Write-Host "     $($a.country_code)" -ForegroundColor Gray
            Write-Host ""
        }
    }
} catch {
    Write-Host ""; Write-Host "  ERROR: Could not find customer" -ForegroundColor Red
    Write-Host "  $($_.Exception.Message)" -ForegroundColor DarkGray
    Write-Host ""
}
