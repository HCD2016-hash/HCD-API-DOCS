# Get-OrderApprovals.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "ALL APPROVALS FOR AN ORDER" -Description "View all approvals (order + job level) for a sales order."
Write-Host "  Examples:  1234  |  SO1234  |  so5678" -ForegroundColor DarkGray
Write-Host ""

$OrderInput = Read-Host "  Enter SO number"
Write-Host ""
Write-Host "  Looking up order..." -ForegroundColor Yellow

# Auto-add SO prefix if just digits
$OrderNumber = $OrderInput.Trim().ToUpper()
if ($OrderNumber -match '^\d+$') {
    $OrderNumber = "SO$OrderNumber"
}

# First lookup the order UUID using /global/scoped_id_search
$lookupBody = @{ type = "order"; scoped_id = $OrderNumber } | ConvertTo-Json
try {
    $lookup = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/global/scoped_id_search" -Headers $headers -Method Post -Body $lookupBody

    # API returns fuzzy matches, find exact match
    $orderData = $lookup.data | Where-Object { $_.scoped_id -eq $OrderNumber } | Select-Object -First 1
    if (-not $orderData) {
        $orderData = $lookup.data | Select-Object -First 1
    }
    $orderId = $orderData.id

    if (-not $orderId) {
        Write-Host "  ERROR: Could not find order '$OrderNumber'" -ForegroundColor Red
        Write-Host ""
        return
    }

    Write-Host "  Found: $($orderData.scoped_id) - $($orderData.name)" -ForegroundColor DarkGray
    Write-Host "  Loading approvals..." -ForegroundColor Yellow

    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v2/api/store/$teamSlug/v2/sales_order/$orderId/all_approvals" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  RESULTS: Found $($response.data.Count) approvals" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    if ($response.data.Count -eq 0) {
        Write-Host "  No approvals found for this order." -ForegroundColor Yellow
    } else {
        foreach ($approval in $response.data) {
            $status = $approval.status
            $statusColor = switch ($status) {
                "pending" { "Yellow" }
                "completed" { "Green" }
                "need-changes" { "Red" }
                default { "White" }
            }

            $type = if ($approval.job_id) { "Job" } else { "Order" }

            Write-Host "    [$type] " -ForegroundColor Cyan -NoNewline
            Write-Host "$($approval.id)" -ForegroundColor White
            Write-Host "           Status: " -ForegroundColor Gray -NoNewline
            Write-Host "$status" -ForegroundColor $statusColor
            if ($approval.notes_to_customer) {
                Write-Host "           Notes: $($approval.notes_to_customer)" -ForegroundColor DarkGray
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
