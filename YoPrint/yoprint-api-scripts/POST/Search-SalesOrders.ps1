# Search-SalesOrders.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "            SEARCH SALES ORDERS" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Search by customer name, order number, or leave blank for all." -ForegroundColor Gray
Write-Host "  Examples: Xcel Energy | SO1234 | Tree Tech" -ForegroundColor DarkGray
Write-Host ""
$SearchTerm = Read-Host "  Enter search"
Write-Host ""
Write-Host "  Searching..." -ForegroundColor Yellow

$body = @{ name = $SearchTerm } | ConvertTo-Json
$response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/sales_order/search" -Headers $headers -Method Post -Body $body

Write-Host ""
Write-Host "  RESULTS: Found $($response.data.Count) orders" -ForegroundColor Green
Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
Write-Host ""
Write-Host "  ORDER        CUSTOMER                              STATUS" -ForegroundColor Yellow

foreach ($order in $response.data) {
    $num = "$($order.scoped_id)".PadRight(12)
    $cust = if ($order.customer.name) { "$($order.customer.name)".PadRight(35) } else { "(No Customer)".PadRight(35) }
    $stat = $order.status.label
    Write-Host "  $num $cust $stat" -ForegroundColor White
}
Write-Host ""
