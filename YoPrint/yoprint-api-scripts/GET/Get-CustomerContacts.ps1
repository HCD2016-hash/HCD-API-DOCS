. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "GET CUSTOMER CONTACTS" -Description "View all contacts for a customer."
Write-Host "  Enter the Customer ID (UUID from YoPrint)" -ForegroundColor DarkGray
Write-Host ""
$CustomerId = Read-Host "  Enter Customer ID"

if ([string]::IsNullOrWhiteSpace($CustomerId)) {
    Write-Host ""; Write-Host "  ERROR: Customer ID is required!" -ForegroundColor Red; Write-Host ""; exit
}

Write-Host ""; Write-Host "  Loading..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/customer/$CustomerId/contact" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  --------------------------------------------" -ForegroundColor Green
    Write-Host "  RESULTS: Found $($response.data.Count) contacts" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    if ($response.data.Count -eq 0) {
        Write-Host "  No contacts for this customer." -ForegroundColor Gray
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
    Write-Host ""; Write-Host "  ERROR: Could not find customer" -ForegroundColor Red
    Write-Host "  $($_.Exception.Message)" -ForegroundColor DarkGray
    Write-Host ""
}
