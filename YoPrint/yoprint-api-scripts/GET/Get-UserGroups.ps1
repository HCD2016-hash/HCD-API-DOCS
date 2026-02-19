# Get-UserGroups.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "USER GROUPS" -Description "View all user groups and their members."
Write-Host "  Loading..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/group" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  RESULTS: Found $($response.data.Count) user groups" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    if ($response.data.Count -eq 0) {
        Write-Host "  No user groups found." -ForegroundColor Yellow
    } else {
        foreach ($group in $response.data) {
            Write-Host "    $($group.name)" -ForegroundColor White
            Write-Host "      ID: $($group.id)" -ForegroundColor DarkGray

            if ($group.users -and $group.users.Count -gt 0) {
                Write-Host "      Members:" -ForegroundColor Gray
                foreach ($user in $group.users) {
                    Write-Host "        - $($user.name)" -ForegroundColor Gray
                }
            }

            if ($group.permissions -and $group.permissions.Count -gt 0) {
                Write-Host "      Permissions: $($group.permissions.Count) configured" -ForegroundColor DarkGray
            }
            Write-Host ""
        }
    }
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
