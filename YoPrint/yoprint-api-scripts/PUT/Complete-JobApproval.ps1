# Complete-JobApproval.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "        COMPLETE JOB APPROVAL (V2)" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Mark a job approval as complete with customer feedback." -ForegroundColor Gray
Write-Host ""

$ApprovalId = Read-Host "  Enter approval ID"
$OrderId = Read-Host "  Enter order UUID"
$JobId = Read-Host "  Enter job ID"
Write-Host ""
$CustomerNotes = Read-Host "  Notes from customer"

Write-Host ""
Write-Host "  Completing job approval..." -ForegroundColor Yellow

$body = @{
    id = $ApprovalId
    order_id = $OrderId
    job_id = $JobId
    notes_from_customer = $CustomerNotes
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v2/api/store/$teamSlug/v2/job/approval/$ApprovalId/complete" -Headers $headers -Method Put -Body $body

    Write-Host ""
    Write-Host "  SUCCESS: Job approval completed!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    Approval ID: $($response.data.id)" -ForegroundColor Cyan
    Write-Host "    Completed: $($response.data.completed)" -ForegroundColor White
    Write-Host "    Completed At: $($response.data.completed_at)" -ForegroundColor White
    Write-Host "    Status: $($response.data.status)" -ForegroundColor White
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
