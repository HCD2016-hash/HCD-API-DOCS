# Get-PaymentTerms.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "PAYMENT TERMS" -Description "View all configured payment terms."
Write-Host "  Loading..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/payment_term" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  RESULTS: Found $($response.data.Count) payment terms" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    if ($response.data.Count -eq 0) {
        Write-Host "  No payment terms found." -ForegroundColor Yellow
    } else {
        foreach ($term in $response.data) {
            $default = if ($term.default) { " [DEFAULT]" } else { "" }
            $deposit = if ($term.enable_deposit) { "Yes ($($term.deposit_percent)%)" } else { "No" }

            Write-Host "    $($term.name)" -ForegroundColor White -NoNewline
            if ($default) { Write-Host $default -ForegroundColor Green }
            else { Write-Host "" }

            Write-Host "      ID: $($term.id)" -ForegroundColor DarkGray
            Write-Host "      Deposit Required: $deposit" -ForegroundColor Gray
            if ($term.enable_deposit) {
                Write-Host "      Deposit Due: $($term.deposit_due) days from $($term.deposit_due_from)" -ForegroundColor Gray
            }
            Write-Host "      Full Amount Due: $($term.full_amount_due) days from $($term.full_amount_due_from)" -ForegroundColor Gray
            Write-Host ""
        }
    }
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
