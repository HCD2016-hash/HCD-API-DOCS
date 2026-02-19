# Update-PaymentGateway.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "       UPDATE PAYMENT GATEWAY" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Configure payment gateway settings." -ForegroundColor Gray
Write-Host ""
Write-Host "  WARNING: Handle API keys carefully!" -ForegroundColor Red
Write-Host ""

Write-Host "  Enable Stripe? (yes/no): " -NoNewline
$EnableStripe = (Read-Host) -eq "yes"

$StripeSecret = ""
$StripePub = ""
if ($EnableStripe) {
    $StripeSecret = Read-Host "  Stripe Secret Key"
    $StripePub = Read-Host "  Stripe Publishable Key"
}

Write-Host "  Enable PayPal? (yes/no): " -NoNewline
$EnablePaypal = (Read-Host) -eq "yes"

Write-Host "  Enable Square? (yes/no): " -NoNewline
$EnableSquare = (Read-Host) -eq "yes"

$SquareToken = ""
$SquareLocation = ""
if ($EnableSquare) {
    $SquareToken = Read-Host "  Square Access Token"
    $SquareLocation = Read-Host "  Square Location ID"
}

Write-Host ""
Write-Host "  Updating payment gateway settings..." -ForegroundColor Yellow

$body = @{
    enable_stripe = $EnableStripe
    enable_paypal = $EnablePaypal
    enable_square = $EnableSquare
}

if ($EnableStripe) {
    $body["stripe_secret_key"] = $StripeSecret
    $body["publishable_key"] = $StripePub
}
if ($EnableSquare) {
    $body["square_access_token"] = $SquareToken
    $body["square_location_id"] = $SquareLocation
}

$bodyJson = $body | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/payment_gateway" -Headers $headers -Method Put -Body $bodyJson

    Write-Host ""
    Write-Host "  SUCCESS: Payment gateway updated!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    Stripe: $($response.data.enable_stripe)" -ForegroundColor White
    Write-Host "    PayPal: $($response.data.enable_paypal)" -ForegroundColor White
    Write-Host "    Square: $($response.data.enable_square)" -ForegroundColor White
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
