# Get-SalesOrderHistory.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "SALES ORDER ACTIVITY HISTORY" -Description "View activity history for a sales order."
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
    Write-Host "  Loading history..." -ForegroundColor Yellow

    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v2/api/store/$teamSlug/v2/sales_order/$orderId/history?page=1" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  HISTORY: Found $($response.data.Count) entries" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    if ($response.data.Count -eq 0) {
        Write-Host "  No history found for this order." -ForegroundColor Yellow
    } else {
        foreach ($entry in $response.data) {
            $date = if ($entry.created_at) { ([string]$entry.created_at).Substring(0,10) } else { "Unknown" }
            $action = $entry.action -replace '_', ' '

            Write-Host "    [$date] " -ForegroundColor DarkGray -NoNewline
            Write-Host "$action" -ForegroundColor White

            if ($entry.object.contact) {
                $name = "$($entry.object.contact.first_name) $($entry.object.contact.last_name)".Trim()
                if ($name) {
                    Write-Host "             By: $name" -ForegroundColor Gray
                }
            }
        }
    }
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
