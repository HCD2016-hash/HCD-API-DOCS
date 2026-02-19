# Get-SalesOrderCommentsV2.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")

# Uses v2 API endpoint

Show-Header -Title "SALES ORDER COMMENTS (v2)" -Description "Get all comments for a sales order."
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

# Lookup the order UUID
$lookupBody = @{ type = "order"; scoped_id = $OrderNumber } | ConvertTo-Json
try {
    $lookup = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/global/scoped_id_search" -Headers $headers -Method Post -Body $lookupBody

    # API returns fuzzy matches, find exact match
    $orderData = $lookup.data | Where-Object { $_.scoped_id -eq $OrderNumber } | Select-Object -First 1
    if (-not $orderData) {
        $orderData = $lookup.data | Select-Object -First 1
    }
    $OrderId = $orderData.id

    if (-not $OrderId) {
        Write-Host "  ERROR: Could not find order '$OrderNumber'" -ForegroundColor Red
        Write-Host ""
        return
    }

    Write-Host "  Found: $($orderData.scoped_id) - $($orderData.name)" -ForegroundColor DarkGray
    Write-Host "  Loading comments..." -ForegroundColor Yellow

    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v2/api/store/$teamSlug/v2/sales_order/$OrderId/comment/index" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  RESULTS: Found $($response.data.Count) comments" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    if ($response.data.Count -eq 0) {
        Write-Host "  No comments found for this order." -ForegroundColor Yellow
    } else {
        foreach ($comment in $response.data) {
            $edited = if ($comment.is_edited) { " [EDITED]" } else { "" }

            Write-Host "    $($comment.created_at)$edited" -ForegroundColor DarkGray
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
