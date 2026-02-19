# Get-Services.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "SERVICE LOCATIONS IN YOPRINT" -Description "These are placement locations for logos/designs."
Write-Host "  Loading..." -ForegroundColor Yellow

$response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/service_location" -Headers $headers -Method Get

Write-Host ""
Write-Host "  RESULTS: Found $($response.data.Count) service locations" -ForegroundColor Green
Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
Write-Host ""

$i = 1
foreach ($s in $response.data) {
    Write-Host "    $i. $($s.name)" -ForegroundColor White
    $i++
}
Write-Host ""
