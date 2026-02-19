# Update-ShipmentBox.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "        UPDATE SHIPMENT BOX" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Update an existing shipment box." -ForegroundColor Gray
Write-Host ""

$BoxId = Read-Host "  Enter box ID"
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
Write-Host "  Updating shipment box..." -ForegroundColor Yellow

$body = @{
    id = $BoxId
    name = $Name
    height = [double]$Height
    width = [double]$Width
    length = [double]$Length
    length_unit = $Unit.ToUpper()
    is_insured = $Insured
    is_default = $Default
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/shipment_box/$BoxId" -Headers $headers -Method Put -Body $body

    Write-Host ""
    Write-Host "  SUCCESS: Shipment box updated!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    ID: $($response.data.id)" -ForegroundColor Cyan
    Write-Host "    Name: $($response.data.name)" -ForegroundColor White
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
