# Get-PaymentTermById.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "GET PAYMENT TERM DETAILS" -Description "Get details of a specific payment term."

$TermId = Read-Host "  Enter payment term ID"

Write-Host ""
Write-Host "  Loading payment term..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/payment_term/$TermId" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  PAYMENT TERM DETAILS" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    ID: $($response.data.id)" -ForegroundColor Cyan
    Write-Host "    Name: $($response.data.name)" -ForegroundColor White
    Write-Host "    Default: $($response.data.default)" -ForegroundColor Gray
    Write-Host ""
    if ($response.data.enable_deposit) {
        Write-Host "    Deposit Required: Yes" -ForegroundColor White
        Write-Host "    Deposit: $($response.data.deposit_percent)%" -ForegroundColor Gray
        Write-Host "    Deposit Due: $($response.data.deposit_due) days from $($response.data.deposit_due_from)" -ForegroundColor Gray
    } else {
        Write-Host "    Deposit Required: No" -ForegroundColor Gray
    }
    Write-Host "    Full Amount Due: $($response.data.full_amount_due) days from $($response.data.full_amount_due_from)" -ForegroundColor Gray
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
