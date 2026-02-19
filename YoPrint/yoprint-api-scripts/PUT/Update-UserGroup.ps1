# Update-UserGroup.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "          UPDATE USER GROUP" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Update an existing user group/role." -ForegroundColor Gray
Write-Host ""

$GroupId = Read-Host "  Enter group ID"
$Name = Read-Host "  Enter new name"
Write-Host ""
Write-Host "  Common permissions:" -ForegroundColor DarkGray
Write-Host "    view_orders, edit_orders, view_jobs, edit_jobs" -ForegroundColor DarkGray
Write-Host "    view_customers, edit_customers, all" -ForegroundColor DarkGray
Write-Host ""
$PermsInput = Read-Host "  Enter permissions (comma-separated)"

$permissions = $PermsInput -split "," | ForEach-Object { $_.Trim() }

Write-Host ""
Write-Host "  Updating user group..." -ForegroundColor Yellow

$body = @{
    id = $GroupId
    name = $Name
    permissions = $permissions
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/group/$GroupId" -Headers $headers -Method Put -Body $body

    Write-Host ""
    Write-Host "  SUCCESS: User group updated!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    ID: $($response.data.id)" -ForegroundColor Cyan
    Write-Host "    Name: $($response.data.name)" -ForegroundColor White
    Write-Host "    Permissions: $($response.data.permissions -join ', ')" -ForegroundColor Gray
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
