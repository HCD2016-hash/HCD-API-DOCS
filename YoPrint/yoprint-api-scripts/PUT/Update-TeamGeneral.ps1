# Update-TeamGeneral.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "       UPDATE GENERAL TEAM SETTINGS" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Update general team configuration." -ForegroundColor Gray
Write-Host ""

Write-Host "  Pagination per page (default 20): " -NoNewline
$PerPage = Read-Host
if ([string]::IsNullOrEmpty($PerPage)) { $PerPage = 20 } else { $PerPage = [int]$PerPage }

Write-Host "  Enable stock management? (yes/no): " -NoNewline
$StockMgmt = (Read-Host) -eq "yes"

Write-Host "  Use QR codes? (yes/no): " -NoNewline
$UseQR = (Read-Host) -eq "yes"

Write-Host "  Weight unit (lb/kg): " -NoNewline
$Weight = Read-Host
if ([string]::IsNullOrEmpty($Weight)) { $Weight = "lb" }

Write-Host "  Dimension unit (in/cm): " -NoNewline
$Dimension = Read-Host
if ([string]::IsNullOrEmpty($Dimension)) { $Dimension = "in" }

Write-Host ""
Write-Host "  Updating general settings..." -ForegroundColor Yellow

$body = @{
    pagination_per_page = $PerPage
    enable_stock_management = $StockMgmt
    use_qr_code = $UseQR
    weight = $Weight
    dimension = $Dimension
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/general" -Headers $headers -Method Put -Body $body

    Write-Host ""
    Write-Host "  SUCCESS: General settings updated!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    Pagination: $($response.data.pagination_per_page)" -ForegroundColor White
    Write-Host "    Stock Management: $($response.data.enable_stock_management)" -ForegroundColor White
    Write-Host "    QR Codes: $($response.data.use_qr_code)" -ForegroundColor White
    Write-Host "    Weight Unit: $($response.data.weight)" -ForegroundColor White
    Write-Host "    Dimension Unit: $($response.data.dimension)" -ForegroundColor White
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
