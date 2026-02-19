# Get-SettingUsers.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "LIST TEAM USERS" -Description "Get all users in the team with their roles."
Write-Host "  Loading users..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/user" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  USERS: Found $($response.data.Count) users" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    foreach ($user in $response.data) {
        $ownerBadge = if ($user.is_owner) { " [OWNER]" } else { "" }
        $ssoBadge = if ($user.sso) { " (SSO)" } else { "" }
        $roles = ($user.roles | ForEach-Object { $_.name }) -join ", "

        Write-Host "    $($user.name)$ownerBadge$ssoBadge" -ForegroundColor Cyan
        Write-Host "      Email: $($user.email)" -ForegroundColor White
        Write-Host "      Roles: $roles" -ForegroundColor Gray
        Write-Host "      Last Login: $($user.last_login_at)" -ForegroundColor DarkGray
        Write-Host ""
    }
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
