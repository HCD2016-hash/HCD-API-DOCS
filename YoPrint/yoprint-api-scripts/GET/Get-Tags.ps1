# Get-Tags.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "ALL TAGS IN YOPRINT" -Description "These are the tags you use to organize orders."
Write-Host "  Loading..." -ForegroundColor Yellow

$response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/tag?page=1" -Headers $headers -Method Get

Write-Host ""
Write-Host "  RESULTS: Found $($response.data.Count) tags" -ForegroundColor Green
Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
Write-Host ""

foreach ($t in $response.data) {
    Write-Host "    - $($t.name)" -ForegroundColor White
}
Write-Host ""
