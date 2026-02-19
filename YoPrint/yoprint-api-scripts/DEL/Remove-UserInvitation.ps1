# Remove-UserInvitation.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Red
Write-Host "          CANCEL USER INVITATION" -ForegroundColor Red
Write-Host "  ============================================" -ForegroundColor Red
Write-Host ""
Write-Host "  Cancel a pending user invitation." -ForegroundColor Gray
Write-Host ""
Write-Host "  WARNING: This action cannot be undone!" -ForegroundColor Yellow
Write-Host ""

$InvitationId = Read-Host "  Enter invitation ID (UUID)"
Write-Host ""
$Confirm = Read-Host "  Type 'DELETE' to confirm"

if ($Confirm -ne 'DELETE') {
    Write-Host ""
    Write-Host "  Cancelled. Invitation was NOT removed." -ForegroundColor Yellow
    Write-Host ""
    return
}

Write-Host ""
Write-Host "  Removing invitation..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/user/invitation/$InvitationId" -Headers $headers -Method Delete

    Write-Host ""
    Write-Host "  SUCCESS: Invitation removed!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
