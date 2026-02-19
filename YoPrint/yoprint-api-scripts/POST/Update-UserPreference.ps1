# Update-UserPreference.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "        UPDATE USER PREFERENCE" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Update current user's UI preferences." -ForegroundColor Gray
Write-Host ""
Write-Host "  NOTE: This is typically done via UI." -ForegroundColor Yellow
Write-Host "  Enter preference JSON or press Enter to cancel." -ForegroundColor Gray
Write-Host ""

$PreferenceJson = Read-Host "  Preference JSON"

if ([string]::IsNullOrEmpty($PreferenceJson)) {
    Write-Host ""
    Write-Host "  Cancelled." -ForegroundColor Yellow
    Write-Host ""
    exit
}

Write-Host ""
Write-Host "  Updating preferences..." -ForegroundColor Yellow

try {
    $prefObj = $PreferenceJson | ConvertFrom-Json
    $body = @{
        preference = $prefObj
    } | ConvertTo-Json -Depth 10

    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/current_user_preference" -Headers $headers -Method Post -Body $body

    Write-Host ""
    Write-Host "  SUCCESS: Preferences updated!" -ForegroundColor Green
    Write-Host "  Version: $($response.data.version)" -ForegroundColor White
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
