# Get-PurchaseOrderHistory.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "PURCHASE ORDER ACTIVITY HISTORY" -Description "View activity history for a purchase order."
Write-Host "  Examples:  PO1234  |  po5678" -ForegroundColor DarkGray
Write-Host ""

$PONumber = Read-Host "  Enter PO number"
Write-Host ""
Write-Host "  Looking up PO ID..." -ForegroundColor Yellow

# First lookup the PO UUID using scoped_id_search
# GOTCHA: Must use 'scoped_id' not 'id' - API returns 422 otherwise
$formatted = $PONumber.ToUpper()
if ($formatted -match '^\d+$') { $formatted = "PO$formatted" }
$lookupBody = @{ scoped_id = $formatted; type = "purchase_order" } | ConvertTo-Json
try {
    $lookup = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/scoped_id_search" -Headers $headers -Method Post -Body $lookupBody
    # GOTCHA: scoped_id_search returns fuzzy matches - filter for exact match
    $exactMatch = $lookup.data | Where-Object { $_.scoped_id -eq $formatted } | Select-Object -First 1
    $poId = if ($exactMatch) { $exactMatch.id } else { $lookup.data.id }

    if (-not $poId) {
        Write-Host "  ERROR: Could not find PO '$PONumber'" -ForegroundColor Red
        Write-Host ""
        return
    }

    Write-Host "  Found PO ID: $poId" -ForegroundColor DarkGray
    Write-Host "  Loading history..." -ForegroundColor Yellow

    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/purchase_order/$poId/history?page=1" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  RESULTS: Found $($response.data.Count) history entries" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    if ($response.data.Count -eq 0) {
        Write-Host "  No history found for this purchase order." -ForegroundColor Yellow
    } else {
        foreach ($entry in $response.data) {
            $date = if ($entry.created_at) { $entry.created_at.Substring(0,10) } else { "Unknown" }
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
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
