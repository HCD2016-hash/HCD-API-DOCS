. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "VIEW CSV IMPORT JOBS" -Description "Shows all CSV import jobs and their status."
Write-Host "  Loading..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/csv/jobs" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  --------------------------------------------" -ForegroundColor Green
    Write-Host "  RESULTS: Found $($response.data.Count) CSV jobs" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    if ($response.data.Count -eq 0) {
        Write-Host "  No CSV import jobs found." -ForegroundColor Gray
    } else {
        Write-Host "  TYPE              STATUS        ROWS       ERRORS" -ForegroundColor Yellow
        Write-Host "  ---------------------------------------------------------" -ForegroundColor DarkGray

        foreach ($job in $response.data) {
            $type = "$($job.type)".PadRight(18)
            $status = "$($job.status)".PadRight(14)
            $rows = "$($job.total_row)".PadRight(11)
            $errors = $job.error_row
            $statusColor = switch ($job.status) {
                "pending" { "Yellow" }
                "completed" { "Green" }
                "failed" { "Red" }
                default { "White" }
            }
            Write-Host "  $type $status $rows $errors" -ForegroundColor $statusColor
        }
    }
    Write-Host ""
} catch {
    Write-Host ""; Write-Host "  ERROR: Failed to load CSV jobs" -ForegroundColor Red
    Write-Host "  $($_.Exception.Message)" -ForegroundColor DarkGray
    Write-Host ""
}
