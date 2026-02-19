# Search-Customers.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "              SEARCH CUSTOMERS" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Search by company name, person name, or leave blank for all." -ForegroundColor Gray
Write-Host "  Examples: Xcel | Tree Tech | John | Smith" -ForegroundColor DarkGray
Write-Host ""
$SearchTerm = Read-Host "  Enter customer name"
Write-Host ""
Write-Host "  Searching..." -ForegroundColor Yellow

$body = @{ name = $SearchTerm } | ConvertTo-Json
$response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/customer/search" -Headers $headers -Method Post -Body $body

Write-Host ""
Write-Host "  RESULTS: Found $($response.data.Count) customers" -ForegroundColor Green
Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
Write-Host ""

foreach ($c in $response.data) {
    Write-Host "    $($c.name)" -ForegroundColor White
}
Write-Host ""
