# Get-Approvals.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Yellow
Write-Host "            FILTERED APPROVALS LIST" -ForegroundColor Yellow
Write-Host "  ============================================" -ForegroundColor Yellow
Write-Host ""
Write-Host "  View all pending and completed approvals." -ForegroundColor Gray
Write-Host ""
Write-Host "  Loading approvals..." -ForegroundColor Yellow

# Only send page - empty arrays cause 422 errors!
$body = @{ page = 1 } | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/approvals/filter" -Headers $headers -Method Post -Body $body

    Write-Host ""
    Write-Host "  RESULTS: Found $($response.data.Count) approvals" -ForegroundColor Green
    if ($response.pagination) {
        Write-Host "  Page $($response.pagination.currentPage) of $($response.pagination.totalPages) | Total: $($response.pagination.total)" -ForegroundColor DarkGray
    }
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    if ($response.data.Count -eq 0) {
        Write-Host "  No approvals found." -ForegroundColor Yellow
    } else {
        foreach ($approval in $response.data) {
            $status = $approval.status
            $statusColor = switch ($status) {
                "pending" { "Yellow" }
                "completed" { "Green" }
                "need-changes" { "Red" }
                default { "White" }
            }

            Write-Host "    ID: " -ForegroundColor Gray -NoNewline
            Write-Host "$($approval.id)" -ForegroundColor White
            Write-Host "    Status: " -ForegroundColor Gray -NoNewline
            Write-Host "$status" -ForegroundColor $statusColor
            if ($approval.order_id) {
                Write-Host "    Order: $($approval.order_id)" -ForegroundColor DarkGray
            }
            Write-Host ""
        }
    }
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
