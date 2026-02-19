# Preview-MessageTemplate.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "       PREVIEW MESSAGE TEMPLATE" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Preview a message template with sample data." -ForegroundColor Gray
Write-Host ""
Write-Host "  Template types:" -ForegroundColor DarkGray
Write-Host "    sales_order_message, quote_message, etc." -ForegroundColor DarkGray
Write-Host ""

$Type = Read-Host "  Template type"
Write-Host ""
Write-Host "  Enter message body with variables:" -ForegroundColor Gray
Write-Host "  (e.g., Dear {{customer.name}}, Your order {{order.scoped_id}}...)" -ForegroundColor DarkGray
$Body = Read-Host "  Body"

Write-Host ""
Write-Host "  Generating preview..." -ForegroundColor Yellow

$bodyData = @{
    type = $Type
    body = $Body
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v2/api/store/$teamSlug/setting/message_template/preview" -Headers $headers -Method Post -Body $bodyData

    Write-Host ""
    Write-Host "  TEMPLATE PREVIEW" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "  Rendered Body:" -ForegroundColor White
    Write-Host "  $($response.data.rendered_body)" -ForegroundColor Gray
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
