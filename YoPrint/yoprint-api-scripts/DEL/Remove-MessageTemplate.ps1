# Remove-MessageTemplate.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "        REMOVE MESSAGE TEMPLATE" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Delete a message template." -ForegroundColor Gray
Write-Host ""
Write-Host "  NOTE: System templates cannot be deleted." -ForegroundColor Yellow
Write-Host ""

$TemplateId = Read-Host "  Enter template ID"
Write-Host ""
Write-Host "  Are you sure? (yes/no): " -NoNewline
$confirm = Read-Host

if ($confirm -ne "yes") {
    Write-Host ""
    Write-Host "  Cancelled." -ForegroundColor Yellow
    Write-Host ""
    exit
}

Write-Host ""
Write-Host "  Removing template..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v2/api/store/$teamSlug/setting/message_template/$TemplateId" -Headers $headers -Method Delete

    Write-Host ""
    Write-Host "  SUCCESS: Template deleted!" -ForegroundColor Green
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
