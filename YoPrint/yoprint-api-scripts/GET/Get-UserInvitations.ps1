# Get-UserInvitations.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "USER INVITATIONS" -Description "View all pending user invitations."
Write-Host "  Loading..." -ForegroundColor Yellow

try {
    # /setting/user_invitation returns 404, must use /setting/invite
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/invite" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  RESULTS: Found $($response.data.Count) invitations" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    if ($response.data.Count -eq 0) {
        Write-Host "  No pending invitations found." -ForegroundColor Yellow
    } else {
        foreach ($invite in $response.data) {
            $statusColor = switch ($invite.status) {
                "pending" { "Yellow" }
                "accepted" { "Green" }
                "expired" { "Red" }
                default { "White" }
            }

            Write-Host "    $($invite.email)" -ForegroundColor White
            Write-Host "      ID: $($invite.id)" -ForegroundColor DarkGray
            Write-Host "      Status: " -ForegroundColor Gray -NoNewline
            Write-Host "$($invite.status)" -ForegroundColor $statusColor
            if ($invite.role) { Write-Host "      Role: $($invite.role)" -ForegroundColor Gray }
            if ($invite.created_at) { Write-Host "      Invited: $($invite.created_at)" -ForegroundColor DarkGray }
            Write-Host ""
        }
    }
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
