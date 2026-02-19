# Get-UserInvites.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "LIST USER INVITATIONS" -Description "Get all pending user invitations."
Write-Host "  Loading invitations..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/invite" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  INVITATIONS: Found $($response.data.Count) invites" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    foreach ($invite in $response.data) {
        $expiredBadge = if ($invite.expired) { " [EXPIRED]" } else { "" }

        Write-Host "    $($invite.email)$expiredBadge" -ForegroundColor Cyan
        Write-Host "      ID: $($invite.id)" -ForegroundColor DarkGray
        Write-Host "      Role: $($invite.role.name)" -ForegroundColor White
        Write-Host ""
    }
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
