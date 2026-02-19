# Update-RunningNumbers.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "        UPDATE RUNNING NUMBERS" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Set the next order/PO/invoice numbers." -ForegroundColor Gray
Write-Host ""
Write-Host "  WARNING: Changing these can cause duplicates!" -ForegroundColor Red
Write-Host ""

Write-Host "  Next Sales Order number: " -NoNewline
$SalesOrder = Read-Host
Write-Host "  Next Purchase Order number: " -NoNewline
$PurchaseOrder = Read-Host
Write-Host "  Next Invoice number: " -NoNewline
$Invoice = Read-Host

Write-Host ""
Write-Host "  Updating running numbers..." -ForegroundColor Yellow

$body = @{}
if ($SalesOrder) { $body["sales_order"] = [int]$SalesOrder }
if ($PurchaseOrder) { $body["purchase_order"] = [int]$PurchaseOrder }
if ($Invoice) { $body["order_invoice"] = [int]$Invoice }

$bodyJson = $body | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/running_number" -Headers $headers -Method Put -Body $bodyJson

    Write-Host ""
    Write-Host "  SUCCESS: Running numbers updated!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    Sales Order: $($response.data.sales_order)" -ForegroundColor White
    Write-Host "    Quote: $($response.data.quote)" -ForegroundColor White
    Write-Host "    Purchase Order: $($response.data.purchase_order)" -ForegroundColor White
    Write-Host "    Invoice: $($response.data.order_invoice)" -ForegroundColor White
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
