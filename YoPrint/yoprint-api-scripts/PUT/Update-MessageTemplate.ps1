# Update-MessageTemplate.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "        UPDATE MESSAGE TEMPLATE" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Update an existing message template." -ForegroundColor Gray
Write-Host ""

$TemplateId = Read-Host "  Enter template ID"
$Name = Read-Host "  Template name"
$Subject = Read-Host "  Email subject"
Write-Host ""
Write-Host "  Enter message body (use \n for newlines):" -ForegroundColor Gray
$Body = Read-Host "  Body"

Write-Host ""
Write-Host "  Updating template..." -ForegroundColor Yellow

$bodyData = @{
    id = $TemplateId
    name = $Name
    subject = $Subject
    body = $Body
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v2/api/store/$teamSlug/setting/message_template/$TemplateId" -Headers $headers -Method Put -Body $bodyData

    Write-Host ""
    Write-Host "  SUCCESS: Template updated!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    ID: $($response.data.id)" -ForegroundColor Cyan
    Write-Host "    Name: $($response.data.name)" -ForegroundColor White
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
