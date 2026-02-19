# Compile-MessageTemplate.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "       COMPILE MESSAGE TEMPLATE" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Compile a template with real order data." -ForegroundColor Gray
Write-Host ""

$TemplateId = Read-Host "  Enter template ID"
$ObjectId = Read-Host "  Enter order/object UUID"

Write-Host ""
Write-Host "  Compiling template..." -ForegroundColor Yellow

$body = @{
    id = $TemplateId
    object_id = $ObjectId
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v2/api/store/$teamSlug/setting/message_template/compile" -Headers $headers -Method Post -Body $body

    Write-Host ""
    Write-Host "  COMPILED TEMPLATE" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "  Subject:" -ForegroundColor White
    Write-Host "  $($response.data.compiled_subject)" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "  Body:" -ForegroundColor White
    Write-Host "  $($response.data.compiled_body)" -ForegroundColor Gray
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
