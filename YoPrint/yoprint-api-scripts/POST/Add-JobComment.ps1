# WARNING: YoPrint API bug - endpoint returns 404 for all job IDs
# Documented endpoint: /v2/api/store/{team_slug}/v2/job/{jobId}/comment
# Status: BROKEN as of Jan 1, 2026

$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Red
Write-Host "       ADD JOB COMMENT - API BROKEN" -ForegroundColor Red
Write-Host "  ============================================" -ForegroundColor Red
Write-Host ""
Write-Host "  WARNING: YoPrint API returns 404 for this endpoint." -ForegroundColor Yellow
Write-Host "  This is a known YoPrint bug, not a script error." -ForegroundColor Yellow
Write-Host ""
Write-Host "  Add a new comment to a job." -ForegroundColor Gray
Write-Host ""
$JobId = Read-Host "  Enter Job ID (UUID)"

if ([string]::IsNullOrWhiteSpace($JobId)) {
    Write-Host ""; Write-Host "  ERROR: Job ID is required!" -ForegroundColor Red; Write-Host ""; exit
}

Write-Host ""
$Comment = Read-Host "  Enter your comment"

if ([string]::IsNullOrWhiteSpace($Comment)) {
    Write-Host ""; Write-Host "  ERROR: Comment cannot be empty!" -ForegroundColor Red; Write-Host ""; exit
}

Write-Host ""; Write-Host "  Saving..." -ForegroundColor Yellow

$body = @{ comment = $Comment } | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v2/api/store/$teamSlug/v2/job/$JobId/comment" -Headers $headers -Method Post -Body $body

    Write-Host ""
    Write-Host "  --------------------------------------------" -ForegroundColor Green
    Write-Host "  SUCCESS: Comment added to job" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
} catch {
    Write-Host ""; Write-Host "  ERROR: Failed to add comment" -ForegroundColor Red
    Write-Host "  $($_.Exception.Message)" -ForegroundColor DarkGray
    Write-Host ""
}
