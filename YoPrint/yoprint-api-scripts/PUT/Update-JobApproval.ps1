# Update-JobApproval.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "         UPDATE JOB APPROVAL (V2)" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Update an existing job approval request." -ForegroundColor Gray
Write-Host ""

$ApprovalId = Read-Host "  Enter approval ID"
$OrderId = Read-Host "  Enter order UUID"
$JobId = Read-Host "  Enter job ID"
Write-Host ""
$Notes = Read-Host "  Notes to customer"

Write-Host ""
Write-Host "  Updating job approval..." -ForegroundColor Yellow

$body = @{
    id = $ApprovalId
    order_id = $OrderId
    job_id = $JobId
    notes_to_customer = $Notes
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v2/api/store/$teamSlug/v2/job/approval/$ApprovalId" -Headers $headers -Method Put -Body $body

    Write-Host ""
    Write-Host "  SUCCESS: Job approval updated!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    Approval ID: $($response.data.id)" -ForegroundColor Cyan
    Write-Host "    Type: $($response.data.type)" -ForegroundColor White
    Write-Host "    Job ID: $($response.data.job_id)" -ForegroundColor White
    Write-Host "    Status: $($response.data.status)" -ForegroundColor White
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
