# Add-OrderApproval.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "         CREATE ORDER APPROVAL (V2)" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Create a new approval request for an order." -ForegroundColor Gray
Write-Host ""

$OrderId = Read-Host "  Enter order UUID"
Write-Host ""
$Notes = Read-Host "  Notes to customer (optional)"
Write-Host ""
Write-Host "  Send immediately? (yes/no): " -NoNewline
$sendNow = Read-Host
$sendLater = $sendNow -ne "yes"

Write-Host ""
Write-Host "  Creating approval request..." -ForegroundColor Yellow

$body = @{
    order_id = $OrderId
    notes_to_customer = $Notes
    send_later = $sendLater
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v2/api/store/$teamSlug/v2/sales_order/$OrderId/approval" -Headers $headers -Method Post -Body $body

    Write-Host ""
    Write-Host "  SUCCESS: Approval created!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    Approval ID: $($response.data.id)" -ForegroundColor Cyan
    Write-Host "    Type: $($response.data.type)" -ForegroundColor White
    Write-Host "    Order: $($response.data.order_scoped_id)" -ForegroundColor White
    Write-Host "    Status: $($response.data.status)" -ForegroundColor White
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
