# Get-AvailableIdentifier.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")

# Shows next available running numbers for orders, quotes, POs, invoices

Show-Header -Title "AVAILABLE IDENTIFIERS / RUNNING NUMBERS" -Description "Shows next available numbers for new records."

Write-Host "  Loading..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/running_number" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  NEXT AVAILABLE IDENTIFIERS" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    $data = $response.data

    if ($data.sales_order) {
        Write-Host "    Sales Order:    " -ForegroundColor Gray -NoNewline
        Write-Host "SO$($data.sales_order)" -ForegroundColor Cyan
    }
    if ($data.purchase_order) {
        Write-Host "    Purchase Order: " -ForegroundColor Gray -NoNewline
        Write-Host "PO$($data.purchase_order)" -ForegroundColor Cyan
    }
    if ($data.order_invoice) {
        Write-Host "    Invoice:        " -ForegroundColor Gray -NoNewline
        Write-Host "INV$($data.order_invoice)" -ForegroundColor Cyan
    }
    if ($data.quote) {
        Write-Host "    Quote:          " -ForegroundColor Gray -NoNewline
        Write-Host "Q$($data.quote)" -ForegroundColor Cyan
    }
    if ($data.shipment) {
        Write-Host "    Shipment:       " -ForegroundColor Gray -NoNewline
        Write-Host "SH$($data.shipment)" -ForegroundColor Cyan
    }

    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
