# Get-TaxTypes.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")

# NOTE: Previous docs said no /v1 prefix - that was WRONG, v1 is required

Show-Header -Title "TAX TYPES" -Description "View all configured tax types and rates."
Write-Host "  Loading..." -ForegroundColor Yellow

try {
    # v1 prefix IS required (contrary to old docs)
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/tax_type" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  RESULTS: Found $($response.data.Count) tax types" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    if ($response.data.Count -eq 0) {
        Write-Host "  No tax types found." -ForegroundColor Yellow
    } else {
        foreach ($tax in $response.data) {
            $default = if ($tax.default) { " [DEFAULT]" } else { "" }
            $trashed = if ($tax.trashed) { " [TRASHED]" } else { "" }
            $rate = [math]::Round($tax.rate * 100, 2)

            Write-Host "    $($tax.name) - $rate%" -ForegroundColor White -NoNewline
            if ($default) { Write-Host $default -ForegroundColor Green -NoNewline }
            if ($trashed) { Write-Host $trashed -ForegroundColor Red -NoNewline }
            Write-Host ""
            Write-Host "      ID: $($tax.id)" -ForegroundColor DarkGray
        }
    }
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
