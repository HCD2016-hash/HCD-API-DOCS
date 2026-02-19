# Add-JobPreset.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "          CREATE JOB PRESET" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Create a new job preset for quick job setup." -ForegroundColor Gray
Write-Host ""
Write-Host "  NOTE: Complex presets with services/pipelines" -ForegroundColor Yellow
Write-Host "  are best created via the YoPrint UI." -ForegroundColor Yellow
Write-Host ""

$Name = Read-Host "  Preset name"
$Note = Read-Host "  Note/description (optional)"

Write-Host ""
Write-Host "  Creating job preset..." -ForegroundColor Yellow

$body = @{
    name = $Name
    note = $Note
    service = @()
    pipeline = @()
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/job_preset" -Headers $headers -Method Post -Body $body

    Write-Host ""
    Write-Host "  SUCCESS: Job preset created!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    ID: $($response.data.id)" -ForegroundColor Cyan
    Write-Host "    Name: $($response.data.name)" -ForegroundColor White
    Write-Host "    Valid: $($response.data.is_valid)" -ForegroundColor Gray
    Write-Host ""
    Write-Host "  TIP: Add services and pipelines via YoPrint UI." -ForegroundColor Yellow
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
