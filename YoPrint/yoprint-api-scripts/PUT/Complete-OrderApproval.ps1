# Complete-OrderApproval.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Magenta
Write-Host "         COMPLETE ORDER APPROVAL" -ForegroundColor Magenta
Write-Host "  ============================================" -ForegroundColor Magenta
Write-Host ""
Write-Host "  Mark an approval as completed or needs-changes." -ForegroundColor Gray
Write-Host "  Requires order UUID and approval UUID." -ForegroundColor Gray
Write-Host ""

$OrderId = Read-Host "  Enter Order UUID"
$ApprovalId = Read-Host "  Enter Approval UUID"
Write-Host ""
Write-Host "  Status options: completed, need-changes" -ForegroundColor DarkGray
$Status = Read-Host "  Enter status"
Write-Host ""
$CustomerNotes = Read-Host "  Enter customer feedback (optional)"
Write-Host ""
Write-Host "  Completing approval..." -ForegroundColor Yellow

$body = @{
    id = $ApprovalId
    order_id = $OrderId
    status = $Status
}

if ($CustomerNotes) {
    $body.notes_from_customer = $CustomerNotes
}

$jsonBody = $body | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v2/api/store/$teamSlug/v2/sales_order/$OrderId/approval/$ApprovalId/complete" -Headers $headers -Method Put -Body $jsonBody

    Write-Host ""
    Write-Host "  SUCCESS: Approval completed!" -ForegroundColor Green
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
