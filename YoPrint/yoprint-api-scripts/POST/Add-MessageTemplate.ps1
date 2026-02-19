# Add-MessageTemplate.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "        CREATE MESSAGE TEMPLATE" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Create a new message template." -ForegroundColor Gray
Write-Host ""
Write-Host "  Template types:" -ForegroundColor DarkGray
Write-Host "    sales_order_message, quote_message, etc." -ForegroundColor DarkGray
Write-Host ""
Write-Host "  Available variables:" -ForegroundColor DarkGray
Write-Host "    {{customer.name}}, {{order.scoped_id}}," -ForegroundColor DarkGray
Write-Host "    {{order.total}}, {{order.due_date}}" -ForegroundColor DarkGray
Write-Host ""

$Type = Read-Host "  Template type"
$Name = Read-Host "  Template name"
$Subject = Read-Host "  Email subject"
Write-Host ""
Write-Host "  Enter message body (use \n for newlines):" -ForegroundColor Gray
$Body = Read-Host "  Body"

Write-Host ""
Write-Host "  Creating template..." -ForegroundColor Yellow

$body = @{
    type = $Type
    name = $Name
    subject = $Subject
    body = $Body
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v2/api/store/$teamSlug/setting/message_template" -Headers $headers -Method Post -Body $body

    Write-Host ""
    Write-Host "  SUCCESS: Template created!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    ID: $($response.data.id)" -ForegroundColor Cyan
    Write-Host "    Name: $($response.data.name)" -ForegroundColor White
    Write-Host "    Type: $($response.data.type)" -ForegroundColor Gray
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
