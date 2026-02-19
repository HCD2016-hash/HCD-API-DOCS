# Search-CustomersByName.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "        SEARCH CUSTOMERS BY NAME" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Quick customer name search." -ForegroundColor Gray
Write-Host ""

$SearchTerm = Read-Host "  Enter customer name"
Write-Host ""
Write-Host "  Searching..." -ForegroundColor Yellow

$body = @{ name = $SearchTerm } | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/global/customer_name_search" -Headers $headers -Method Post -Body $body

    Write-Host ""
    Write-Host "  RESULTS: Found $($response.data.Count) customers" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    if ($response.data.Count -eq 0) {
        Write-Host "  No customers found matching '$SearchTerm'" -ForegroundColor Yellow
    } else {
        foreach ($cust in $response.data) {
            Write-Host "    $($cust.name)" -ForegroundColor White
            Write-Host "      ID: $($cust.id)" -ForegroundColor DarkGray
            Write-Host ""
        }
    }
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
