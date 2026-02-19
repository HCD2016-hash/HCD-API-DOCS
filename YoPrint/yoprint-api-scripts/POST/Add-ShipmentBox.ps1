# Add-ShipmentBox.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "        CREATE SHIPMENT BOX" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Create a new shipment box configuration." -ForegroundColor Gray
Write-Host ""

$Name = Read-Host "  Box name"
$Height = Read-Host "  Height"
$Width = Read-Host "  Width"
$Length = Read-Host "  Length"
Write-Host "  Length unit (IN/CM): " -NoNewline
$Unit = Read-Host
if ([string]::IsNullOrEmpty($Unit)) { $Unit = "IN" }
Write-Host "  Is insured? (yes/no): " -NoNewline
$Insured = (Read-Host) -eq "yes"
Write-Host "  Set as default? (yes/no): " -NoNewline
$Default = (Read-Host) -eq "yes"

Write-Host ""
Write-Host "  Creating shipment box..." -ForegroundColor Yellow

$body = @{
    name = $Name
    height = [double]$Height
    width = [double]$Width
    length = [double]$Length
    length_unit = $Unit.ToUpper()
    is_insured = $Insured
    is_default = $Default
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/shipment_box" -Headers $headers -Method Post -Body $body

    Write-Host ""
    Write-Host "  SUCCESS: Shipment box created!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    ID: $($response.data.id)" -ForegroundColor Cyan
    Write-Host "    Name: $($response.data.name)" -ForegroundColor White
    Write-Host "    Size: $($response.data.length) x $($response.data.width) x $($response.data.height) $($response.data.length_unit)" -ForegroundColor Gray
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
