# Get-JobCommentsV2.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")

# Uses v2 API endpoint (v1 endpoint is broken)

Show-Header -Title "JOB COMMENTS (v2)" -Description "Get all comments for a job."
Write-Host "  NOTE: Uses v2 API (v1 is broken)" -ForegroundColor DarkGray
Write-Host ""

$JobId = Read-Host "  Enter job ID (UUID)"
Write-Host ""
Write-Host "  Loading..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v2/api/store/$teamSlug/v2/job/$JobId/comment" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  RESULTS: Found $($response.data.Count) comments" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    if ($response.data.Count -eq 0) {
        Write-Host "  No comments found for this job." -ForegroundColor Yellow
    } else {
        foreach ($comment in $response.data) {
            $edited = if ($comment.is_edited) { " [EDITED]" } else { "" }

            Write-Host "    $($comment.created_at)$edited" -ForegroundColor DarkGray
            if ($comment.job_scoped_id) {
                Write-Host "    Job: $($comment.job_scoped_id) - $($comment.job_name)" -ForegroundColor Gray
            }
            Write-Host "    $($comment.comment)" -ForegroundColor White
            Write-Host "    ID: $($comment.id)" -ForegroundColor DarkGray
            Write-Host ""
        }
    }
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
