# Add-JobApproval.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Yellow
Write-Host "           CREATE JOB APPROVAL" -ForegroundColor Yellow
Write-Host "  ============================================" -ForegroundColor Yellow
Write-Host ""
Write-Host "  Create an approval request for a specific job." -ForegroundColor Gray
Write-Host "  Requires the order UUID and job UUID." -ForegroundColor Gray
Write-Host ""

$OrderId = Read-Host "  Enter Order UUID"
$JobId = Read-Host "  Enter Job UUID"
Write-Host ""
$Notes = Read-Host "  Enter notes to customer"
Write-Host ""
Write-Host "  Creating approval..." -ForegroundColor Yellow

$body = @{
    order_id = $OrderId
    job_id = $JobId
    notes_to_customer = $Notes
    mockup = @()
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v2/api/store/$teamSlug/v2/job/$JobId/approval" -Headers $headers -Method Post -Body $body

    Write-Host ""
    Write-Host "  SUCCESS: Job approval created!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    Approval ID: $($response.data.id)" -ForegroundColor White
    Write-Host "    Job ID:      $JobId" -ForegroundColor Cyan
    Write-Host "    Status:      $($response.data.status)" -ForegroundColor Yellow
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
