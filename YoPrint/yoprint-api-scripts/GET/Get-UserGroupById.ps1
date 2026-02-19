# Get-UserGroupById.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "GET USER GROUP DETAILS" -Description "Get details of a specific user group."

$GroupId = Read-Host "  Enter group ID"

Write-Host ""
Write-Host "  Loading group details..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/group/$GroupId" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  GROUP DETAILS" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    ID: $($response.data.id)" -ForegroundColor Cyan
    Write-Host "    Name: $($response.data.name)" -ForegroundColor White
    Write-Host "    Permissions: $($response.data.permissions -join ', ')" -ForegroundColor Gray
    Write-Host ""
    Write-Host "    Members:" -ForegroundColor White
    foreach ($user in $response.data.users) {
        Write-Host "      - $($user.name)" -ForegroundColor Gray
    }
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
