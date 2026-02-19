. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "GET SALES ORDER COMMENTS" -Description "View all comments on a sales order."
Write-Host "  Example: SO1234 or just 1234" -ForegroundColor DarkGray
Write-Host ""
$OrderInput = Read-Host "  Enter Sales Order ID"

if ([string]::IsNullOrWhiteSpace($OrderInput)) {
    Write-Host ""; Write-Host "  ERROR: Order ID is required!" -ForegroundColor Red; Write-Host ""; exit
}

# Auto-prefix SO if user enters just digits
if ($OrderInput -match '^\d+$') {
    $ScopedId = "SO$OrderInput"
} else {
    $ScopedId = $OrderInput.ToUpper()
}

Write-Host ""; Write-Host "  Looking up $ScopedId..." -ForegroundColor Yellow

# First get the UUID via scoped_id search
try {
    $searchBody = @{ type = "order"; scoped_id = $ScopedId } | ConvertTo-Json
    $searchResponse = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/global/scoped_id_search" -Headers $headers -Method Post -Body $searchBody

    $order = $searchResponse.data | Where-Object { $_.scoped_id -eq $ScopedId } | Select-Object -First 1

    if (-not $order) {
        Write-Host ""; Write-Host "  ERROR: Order $ScopedId not found" -ForegroundColor Red; Write-Host ""; exit
    }

    $OrderUuid = $order.id
    Write-Host "  Loading comments..." -ForegroundColor Yellow

    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v2/api/store/$teamSlug/v2/sales_order/$OrderUuid/comment/index" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  --------------------------------------------" -ForegroundColor Green
    Write-Host "  RESULTS: Found $($response.data.Count) comments for $ScopedId" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    if ($response.data.Count -eq 0) {
        Write-Host "  No comments on this order." -ForegroundColor Gray
    } else {
        foreach ($c in $response.data) {
            Write-Host "  -----------------------------------------" -ForegroundColor DarkGray
            Write-Host "  Date: $($c.created_at)" -ForegroundColor DarkGray
            Write-Host "  $($c.comment)" -ForegroundColor White
            Write-Host ""
        }
    }
} catch {
    Write-Host ""; Write-Host "  ERROR: Could not find order $ScopedId" -ForegroundColor Red
    Write-Host "  $($_.Exception.Message)" -ForegroundColor DarkGray
    Write-Host ""
}
