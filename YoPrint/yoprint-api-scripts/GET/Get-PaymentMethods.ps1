# Get-PaymentMethods.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "PAYMENT METHODS" -Description "View all configured payment methods."
Write-Host "  Loading..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/payment_method" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  RESULTS: Found $($response.data.Count) payment methods" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    if ($response.data.Count -eq 0) {
        Write-Host "  No payment methods found." -ForegroundColor Yellow
    } else {
        foreach ($method in $response.data) {
            $default = if ($method.default) { " [DEFAULT]" } else { "" }
            $trashed = if ($method.trashed) { " [TRASHED]" } else { "" }

            Write-Host "    $($method.name)" -ForegroundColor White -NoNewline
            if ($default) { Write-Host $default -ForegroundColor Green -NoNewline }
            if ($trashed) { Write-Host $trashed -ForegroundColor Red -NoNewline }
            Write-Host ""
            Write-Host "      ID: $($method.id)" -ForegroundColor DarkGray
        }
    }
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
