# Update-OrderApproval.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Magenta
Write-Host "          UPDATE ORDER APPROVAL" -ForegroundColor Magenta
Write-Host "  ============================================" -ForegroundColor Magenta
Write-Host ""
Write-Host "  Update notes on an existing approval." -ForegroundColor Gray
Write-Host "  Requires order UUID and approval UUID." -ForegroundColor Gray
Write-Host ""

$OrderId = Read-Host "  Enter Order UUID"
$ApprovalId = Read-Host "  Enter Approval UUID"
Write-Host ""
$Notes = Read-Host "  Enter notes to customer"
Write-Host ""
Write-Host "  Updating approval..." -ForegroundColor Yellow

$body = @{
    id = $ApprovalId
    order_id = $OrderId
    notes_to_customer = $Notes
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v2/api/store/$teamSlug/v2/sales_order/$OrderId/approval/$ApprovalId" -Headers $headers -Method Put -Body $body

    Write-Host ""
    Write-Host "  SUCCESS: Approval updated!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    Approval ID: $($response.data.id)" -ForegroundColor White
    Write-Host "    Status:      $($response.data.status)" -ForegroundColor Cyan
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
