# Get-RunningNumbers.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "RUNNING NUMBERS" -Description "View current running numbers for documents."
Write-Host "  Loading..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/running_number" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  CURRENT RUNNING NUMBERS" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    if ($response.data) {
        $data = $response.data
        Write-Host "    Sales Orders:    SO$($data.sales_order)" -ForegroundColor White
        Write-Host "    Quotes:          Q$($data.quote)" -ForegroundColor White
        Write-Host "    Purchase Orders: PO$($data.purchase_order)" -ForegroundColor White
        Write-Host "    Invoices:        INV$($data.order_invoice)" -ForegroundColor White
    } else {
        Write-Host "    No running numbers found." -ForegroundColor Yellow
    }
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
