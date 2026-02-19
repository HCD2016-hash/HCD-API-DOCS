# Get-Statuses.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "ALL STATUS OPTIONS IN YOPRINT" -Description "These are all the status options in your YoPrint."
Write-Host "  Loading..." -ForegroundColor Yellow

$response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/status" -Headers $headers -Method Get

$roles = $response.data | Group-Object -Property role
foreach ($role in $roles) {
    Write-Host ""
    Write-Host "  === $($role.Name.ToUpper()) STATUSES ===" -ForegroundColor Magenta
    foreach ($s in $role.Group | Sort-Object position) {
        Write-Host "      $($s.label)" -ForegroundColor White
    }
}
Write-Host ""
