# Get-ApprovalDetails.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "APPROVAL DETAILS" -Description "View details for a specific approval."
Write-Host "  Loading approvals..." -ForegroundColor Yellow

try {
    # First, try to get list of approvals via POST search
    $searchBody = @{} | ConvertTo-Json
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/approval/search" -Headers $headers -Method Post -Body $searchBody -ErrorAction Stop

    $approvals = $response.data

    Write-Host ""
    Write-Host "  PENDING APPROVALS: $($approvals.Count) found" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    if ($approvals.Count -eq 0) {
        Write-Host "  No pending approvals found." -ForegroundColor Yellow
        Write-Host ""
        return
    }

    $i = 1
    foreach ($appr in $approvals) {
        $statusColor = switch ($appr.status) {
            "pending" { "Yellow" }
            "completed" { "Green" }
            "need-changes" { "Red" }
            default { "White" }
        }
        $orderInfo = if ($appr.order_scoped_id) { " - $($appr.order_scoped_id)" } else { "" }
        $jobInfo = if ($appr.job_scoped_id) { " ($($appr.job_scoped_id))" } else { "" }

        Write-Host "    [$i] " -ForegroundColor Cyan -NoNewline
        Write-Host "[$($appr.status)] " -ForegroundColor $statusColor -NoNewline
        Write-Host "$($appr.type)$orderInfo$jobInfo" -ForegroundColor White
        $i++
    }

    Write-Host ""
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    $selection = Read-Host "  Select approval # to view details (or Enter to exit)"

    if ($selection -match '^\d+$') {
        $idx = [int]$selection
        if ($idx -ge 1 -and $idx -le $approvals.Count) {
            $approval = $approvals[$idx - 1]
            $ApprovalId = $approval.id

            Write-Host ""
            Write-Host "  Loading approval details..." -ForegroundColor Yellow

            # Try to get detailed info
            $detailResponse = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/approval/$ApprovalId" -Headers $headers -Method Get -ErrorAction SilentlyContinue

            $data = if ($detailResponse.data) { $detailResponse.data } else { $approval }

            Write-Host ""
            Write-Host "  ============================================" -ForegroundColor Green
            Write-Host "            APPROVAL DETAILS" -ForegroundColor Green
            Write-Host "  ============================================" -ForegroundColor Green
            Write-Host ""

            $statusColor = switch ($data.status) {
                "pending" { "Yellow" }
                "completed" { "Green" }
                "need-changes" { "Red" }
                default { "White" }
            }

            Write-Host "    ID: $($data.id)" -ForegroundColor DarkGray
            Write-Host "    Type: $($data.type)" -ForegroundColor White
            Write-Host "    Status: " -ForegroundColor Gray -NoNewline
            Write-Host "$($data.status)" -ForegroundColor $statusColor
            Write-Host ""
            if ($data.order_scoped_id) { Write-Host "    Order: $($data.order_scoped_id)" -ForegroundColor Gray }
            if ($data.job_scoped_id) { Write-Host "    Job: $($data.job_scoped_id) - $($data.job_name)" -ForegroundColor Gray }
            Write-Host ""
            if ($data.notes_to_customer) { Write-Host "    Notes to Customer: $($data.notes_to_customer)" -ForegroundColor White }
            if ($data.notes_from_customer) { Write-Host "    Notes from Customer: $($data.notes_from_customer)" -ForegroundColor White }
            Write-Host ""
            if ($data.created_at) { Write-Host "    Created: $($data.created_at)" -ForegroundColor DarkGray }
            if ($data.completed_at) { Write-Host "    Completed: $($data.completed_at)" -ForegroundColor DarkGray }
            Write-Host ""
        } else {
            Write-Host "  Invalid selection." -ForegroundColor Yellow
        }
    }
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
    Write-Host "  Note: The approval search endpoint may not exist." -ForegroundColor DarkGray
    Write-Host "  Try using Get-OrderApprovals to find approvals for a specific order." -ForegroundColor DarkGray
    Write-Host ""
}
