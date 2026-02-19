$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "        ADD COMMENT TO SALES ORDER" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Add a new comment to a sales order." -ForegroundColor Gray
Write-Host ""
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

Write-Host ""
$Comment = Read-Host "  Enter your comment"

if ([string]::IsNullOrWhiteSpace($Comment)) {
    Write-Host ""; Write-Host "  ERROR: Comment cannot be empty!" -ForegroundColor Red; Write-Host ""; exit
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
    Write-Host "  Saving comment..." -ForegroundColor Yellow

    $body = @{ comment = $Comment } | ConvertTo-Json
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v2/api/store/$teamSlug/v2/sales_order/$OrderUuid/comment" -Headers $headers -Method Post -Body $body

    Write-Host ""
    Write-Host "  --------------------------------------------" -ForegroundColor Green
    Write-Host "  SUCCESS: Comment added to $ScopedId" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
} catch {
    Write-Host ""; Write-Host "  ERROR: Failed to add comment" -ForegroundColor Red
    Write-Host "  $($_.Exception.Message)" -ForegroundColor DarkGray
    Write-Host ""
}
