# Update-JobPreset.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "          UPDATE JOB PRESET" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Update an existing job preset." -ForegroundColor Gray
Write-Host ""
Write-Host "  NOTE: For complex updates with services/pipelines," -ForegroundColor Yellow
Write-Host "  use the YoPrint UI." -ForegroundColor Yellow
Write-Host ""

$PresetId = Read-Host "  Enter preset ID"
$Name = Read-Host "  Preset name"
$Note = Read-Host "  Note/description"

Write-Host ""
Write-Host "  Updating job preset..." -ForegroundColor Yellow

$body = @{
    id = $PresetId
    name = $Name
    note = $Note
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/job_preset/$PresetId" -Headers $headers -Method Put -Body $body

    Write-Host ""
    Write-Host "  SUCCESS: Job preset updated!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    ID: $($response.data.id)" -ForegroundColor Cyan
    Write-Host "    Name: $($response.data.name)" -ForegroundColor White
    Write-Host "    Valid: $($response.data.is_valid)" -ForegroundColor Gray
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
