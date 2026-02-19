# Decode-Barcode.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Yellow
Write-Host "            DECODE YOPRINT BARCODE" -ForegroundColor Yellow
Write-Host "  ============================================" -ForegroundColor Yellow
Write-Host ""
Write-Host "  Decode a YoPrint barcode/QR code value." -ForegroundColor Gray
Write-Host ""
Write-Host "  Examples:  y9-0p-job-1584  |  y9-0p-so-4521" -ForegroundColor DarkGray
Write-Host ""
Write-Host "  NOTE: Enter only the barcode ID, NOT the full URL!" -ForegroundColor DarkYellow
Write-Host ""

$BarcodeValue = Read-Host "  Enter barcode value"
Write-Host ""
Write-Host "  Decoding..." -ForegroundColor Yellow

$body = @{ value = $BarcodeValue } | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/decode_barcode" -Headers $headers -Method Post -Body $body

    Write-Host ""
    Write-Host "  SUCCESS: Barcode decoded!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    if ($response.data) {
        $data = $response.data

        if ($data.type) {
            Write-Host "    Type: " -ForegroundColor Gray -NoNewline
            Write-Host "$($data.type)" -ForegroundColor Cyan
        }
        if ($data.id) {
            Write-Host "    ID:   " -ForegroundColor Gray -NoNewline
            Write-Host "$($data.id)" -ForegroundColor White
        }
        if ($data.scoped_id) {
            Write-Host "    Scoped ID: " -ForegroundColor Gray -NoNewline
            Write-Host "$($data.scoped_id)" -ForegroundColor Yellow
        }
        if ($data.name) {
            Write-Host "    Name: " -ForegroundColor Gray -NoNewline
            Write-Host "$($data.name)" -ForegroundColor White
        }

        # Show full response for reference
        Write-Host ""
        Write-Host "    Full response:" -ForegroundColor DarkGray
        $response.data | ConvertTo-Json -Depth 3 | ForEach-Object { Write-Host "    $_" -ForegroundColor DarkGray }
    } else {
        Write-Host "    No data returned for this barcode." -ForegroundColor Yellow
    }
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
