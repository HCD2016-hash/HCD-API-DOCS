# Get-Currencies.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "CURRENCIES" -Description "View configured currencies."
Write-Host "  Loading..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/currency" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  RESULTS: Found $($response.data.Count) currencies" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    if ($response.data.Count -eq 0) {
        Write-Host "  No currencies found." -ForegroundColor Yellow
    } else {
        foreach ($currency in $response.data) {
            $default = if ($currency.default) { " [DEFAULT]" } else { "" }

            Write-Host "    $($currency.code) - $($currency.name)" -ForegroundColor White -NoNewline
            if ($default) { Write-Host $default -ForegroundColor Green } else { Write-Host "" }
            Write-Host "      ID: $($currency.id)" -ForegroundColor DarkGray
            if ($currency.symbol) {
                Write-Host "      Symbol: $($currency.symbol)" -ForegroundColor Gray
            }
            if ($currency.exchange_rate) {
                Write-Host "      Exchange Rate: $($currency.exchange_rate)" -ForegroundColor Gray
            }
            Write-Host ""
        }
    }
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
