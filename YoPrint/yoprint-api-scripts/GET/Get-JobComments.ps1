# WARNING: YoPrint API bug - endpoint returns 404 for all job IDs
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")

# Documented endpoint: /v2/api/store/{team_slug}/v2/job/{jobId}/comment
# Status: BROKEN as of Jan 1, 2026


Show-Header -Title "GET JOB COMMENTS - API BROKEN"
Write-Host "  WARNING: YoPrint API returns 404 for this endpoint." -ForegroundColor Yellow
Write-Host "  This is a known YoPrint bug, not a script error." -ForegroundColor Yellow
Write-Host ""
Write-Host "  View all comments on a job." -ForegroundColor Gray
Write-Host ""
Write-Host "  Enter the Job ID (UUID from YoPrint)" -ForegroundColor DarkGray
Write-Host ""
$JobId = Read-Host "  Enter Job ID"

if ([string]::IsNullOrWhiteSpace($JobId)) {
    Write-Host ""; Write-Host "  ERROR: Job ID is required!" -ForegroundColor Red; Write-Host ""; exit
}

Write-Host ""; Write-Host "  Loading..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v2/api/store/$teamSlug/v2/job/$JobId/comment" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  --------------------------------------------" -ForegroundColor Green
    Write-Host "  RESULTS: Found $($response.data.Count) comments" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    if ($response.data.Count -eq 0) {
        Write-Host "  No comments on this job." -ForegroundColor Gray
    } else {
        foreach ($c in $response.data) {
            Write-Host "  -----------------------------------------" -ForegroundColor DarkGray
            Write-Host "  Date: $($c.created_at)" -ForegroundColor DarkGray
            Write-Host "  $($c.comment)" -ForegroundColor White
            Write-Host ""
        }
    }
} catch {
    Write-Host ""; Write-Host "  ERROR: Could not find job" -ForegroundColor Red
    Write-Host "  $($_.Exception.Message)" -ForegroundColor DarkGray
    Write-Host ""
}
