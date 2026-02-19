# Add-UserInvitation.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Yellow
Write-Host "           INVITE NEW USER" -ForegroundColor Yellow
Write-Host "  ============================================" -ForegroundColor Yellow
Write-Host ""
Write-Host "  Send an invitation to join your YoPrint team." -ForegroundColor Gray
Write-Host ""

$Email = Read-Host "  Enter email address"
$FirstName = Read-Host "  Enter first name"
$LastName = Read-Host "  Enter last name"
Write-Host ""
Write-Host "  Role options: admin, manager, user, viewer" -ForegroundColor DarkGray
$Role = Read-Host "  Enter role"

$body = @{
    email = $Email
    first_name = $FirstName
    last_name = $LastName
    role = $Role
} | ConvertTo-Json

Write-Host ""
Write-Host "  Sending invitation..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/user/invitation" -Headers $headers -Method Post -Body $body

    Write-Host ""
    Write-Host "  SUCCESS: Invitation sent!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    Email: $Email" -ForegroundColor White
    Write-Host "    Role:  $Role" -ForegroundColor Cyan
    if ($response.data.id) {
        Write-Host "    Invitation ID: $($response.data.id)" -ForegroundColor DarkGray
    }
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
