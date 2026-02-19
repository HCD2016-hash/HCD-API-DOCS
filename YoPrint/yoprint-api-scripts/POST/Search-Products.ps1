# Search-Products.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "              SEARCH PRODUCTS" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Search your YoPrint product catalog." -ForegroundColor Gray
Write-Host "  Examples: shirt | hat | Gildan | (blank for all)" -ForegroundColor DarkGray
Write-Host ""
$SearchTerm = Read-Host "  Enter product name"
Write-Host ""
Write-Host "  Searching..." -ForegroundColor Yellow

$body = @{ name = $SearchTerm } | ConvertTo-Json
$response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/product_list_search" -Headers $headers -Method Post -Body $body

Write-Host ""
Write-Host "  RESULTS: Found $($response.data.Count) products" -ForegroundColor Green
Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
Write-Host ""

$i = 1
foreach ($p in $response.data) {
    Write-Host "    $i. $($p.name)" -ForegroundColor White
    $i++
}
Write-Host ""
