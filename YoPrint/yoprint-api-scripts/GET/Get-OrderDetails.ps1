# Get-OrderDetails.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "GET ORDER DETAILS" -Description "Shows all details for ONE order."
Write-Host "  Enter the order number like SO1234" -ForegroundColor DarkGray
Write-Host ""
$OrderId = Read-Host "  Enter order number"

if ([string]::IsNullOrWhiteSpace($OrderId)) {
    Write-Host ""
    Write-Host "  ERROR: You must enter an order number!" -ForegroundColor Red
    Write-Host ""
    return
}

# Auto-prefix SO if user enters just digits
if ($OrderId -match '^\d+$') {
    $OrderId = "SO$OrderId"
}

Write-Host ""
Write-Host "  Looking up $OrderId..." -ForegroundColor Yellow

try {
    # First search to get the UUID
    $body = @{ type = "order"; scoped_id = $OrderId } | ConvertTo-Json
    $searchResult = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/global/scoped_id_search" -Headers $headers -Method Post -Body $body

    $exactMatch = $searchResult.data | Where-Object { $_.scoped_id -eq $OrderId }
    if (-not $exactMatch) {
        throw "Order not found"
    }

    # Now get full details using UUID
    $uuid = $exactMatch.id
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v2/api/store/$teamSlug/v2/sales_order/$uuid" -Headers $headers -Method Get

    $o = $response.data
    Write-Host ""
    Write-Host "  ============================================" -ForegroundColor Green
    Write-Host "    ORDER: $($o.scoped_id)" -ForegroundColor Green
    Write-Host "  ============================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "  CUSTOMER:     $($o.customer.name)" -ForegroundColor White
    Write-Host "  STATUS:       $($o.status.label)" -ForegroundColor White
    Write-Host ""
    Write-Host "  DATES:" -ForegroundColor Yellow
    Write-Host "    Issue Date: $($o.issue_date)" -ForegroundColor White
    Write-Host "    Due Date:   $($o.due_date)" -ForegroundColor White
    Write-Host ""
    Write-Host "  MONEY:" -ForegroundColor Yellow
    Write-Host "    Subtotal:   `$$($o.calc_subtotal)" -ForegroundColor White
    Write-Host "    Tax:        `$$($o.calc_tax)" -ForegroundColor White
    Write-Host "    TOTAL:      `$$($o.calc_total)" -ForegroundColor Green
    Write-Host "    Paid:       `$$($o.paid_amount)" -ForegroundColor White
    Write-Host ""
} catch {
    Write-Host ""
    Write-Host "  ERROR: Could not find order $OrderId" -ForegroundColor Red
    Write-Host "  Make sure you typed the order number correctly" -ForegroundColor Yellow
    Write-Host ""
}
