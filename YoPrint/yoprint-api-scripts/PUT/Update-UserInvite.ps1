# Update-UserInvite.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "        UPDATE USER INVITATION" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Update an existing user invitation." -ForegroundColor Gray
Write-Host ""

$InviteId = Read-Host "  Enter invitation ID"
$RoleId = Read-Host "  Enter new role ID"

Write-Host ""
Write-Host "  Updating invitation..." -ForegroundColor Yellow

$body = @{
    id = $InviteId
    role_id = $RoleId
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/invite/$InviteId" -Headers $headers -Method Put -Body $body

    Write-Host ""
    Write-Host "  SUCCESS: Invitation updated!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    Email: $($response.data.email)" -ForegroundColor Cyan
    Write-Host "    New Role: $($response.data.role.name)" -ForegroundColor White
    Write-Host "    Expired: $($response.data.expired)" -ForegroundColor Gray
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
