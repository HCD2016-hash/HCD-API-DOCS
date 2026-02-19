# Send-ApprovalToCustomer.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "        SEND APPROVAL TO CUSTOMER" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Send an approval request to the customer." -ForegroundColor Gray
Write-Host ""

$ApprovalId = Read-Host "  Enter approval ID (UUID)"

Write-Host ""
Write-Host "  Sending approval to customer..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/approvals/$ApprovalId/send_to_customer" -Headers $headers -Method Patch

    Write-Host ""
    Write-Host "  SUCCESS: Approval sent to customer!" -ForegroundColor Green
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
