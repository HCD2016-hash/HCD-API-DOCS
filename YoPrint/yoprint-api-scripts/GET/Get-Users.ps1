# Get-Users.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "USERS" -Description "View all users in your YoPrint team."
Write-Host "  Loading..." -ForegroundColor Yellow

try {
    # /user endpoint returns 404, must use /setting/user
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/user" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  RESULTS: Found $($response.data.Count) users" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    if ($response.data.Count -eq 0) {
        Write-Host "  No users found." -ForegroundColor Yellow
    } else {
        foreach ($user in $response.data) {
            $name = "$($user.first_name) $($user.last_name)".Trim()
            if (-not $name) { $name = $user.email }

            $roleColor = switch ($user.role) {
                "admin" { "Red" }
                "owner" { "Magenta" }
                "manager" { "Yellow" }
                default { "White" }
            }

            Write-Host "    $name" -ForegroundColor White
            Write-Host "      Email: $($user.email)" -ForegroundColor Gray
            Write-Host "      Role:  " -ForegroundColor Gray -NoNewline
            Write-Host "$($user.role)" -ForegroundColor $roleColor
            Write-Host "      ID:    $($user.id)" -ForegroundColor DarkGray
            if ($user.last_login) {
                Write-Host "      Last Login: $($user.last_login)" -ForegroundColor DarkGray
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
