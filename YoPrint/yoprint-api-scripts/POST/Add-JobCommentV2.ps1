# Add-JobCommentV2.ps1
# Uses v2 API endpoint (v1 endpoint is broken)
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "           ADD JOB COMMENT (v2)" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Add a comment to a job." -ForegroundColor Gray
Write-Host "  NOTE: Uses v2 API (v1 is broken)" -ForegroundColor DarkGray
Write-Host ""

$JobId = Read-Host "  Enter job ID (UUID)"
Write-Host ""
$comment = Read-Host "  Enter comment"

Write-Host ""
Write-Host "  Adding comment..." -ForegroundColor Yellow

$body = @{ comment = $comment } | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v2/api/store/$teamSlug/v2/job/$JobId/comment" -Headers $headers -Method Post -Body $body

    Write-Host ""
    Write-Host "  SUCCESS: Comment added!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    $data = $response.data
    Write-Host "    ID: $($data.id)" -ForegroundColor Cyan
    Write-Host "    Job: $($data.job_scoped_id) - $($data.job_name)" -ForegroundColor Gray
    Write-Host "    Comment: $($data.comment)" -ForegroundColor White
    Write-Host "    Created: $($data.created_at)" -ForegroundColor DarkGray
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
