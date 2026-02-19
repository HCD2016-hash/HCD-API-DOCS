# Set-UserRole.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "          CHANGE USER ROLE" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Assign a user to a different role/group." -ForegroundColor Gray
Write-Host ""

$RoleId = Read-Host "  Enter role/group ID"
$UserId = Read-Host "  Enter user ID"

Write-Host ""
Write-Host "  Changing user role..." -ForegroundColor Yellow

$body = @{
    user_id = $UserId
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/group/$RoleId/change_user_group" -Headers $headers -Method Patch -Body $body

    Write-Host ""
    Write-Host "  SUCCESS: User role changed!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    User: $($response.data.name)" -ForegroundColor Cyan
    Write-Host "    Email: $($response.data.email)" -ForegroundColor White
    $roles = ($response.data.roles | ForEach-Object { $_.name }) -join ", "
    Write-Host "    New Roles: $roles" -ForegroundColor White
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
