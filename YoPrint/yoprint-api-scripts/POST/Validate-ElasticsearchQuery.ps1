# Validate-ElasticsearchQuery.ps1
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "       VALIDATE ELASTICSEARCH QUERY" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Check if an Elasticsearch query syntax is valid." -ForegroundColor Gray
Write-Host ""
Write-Host "  Example: status:active AND (priority:high OR priority:critical)" -ForegroundColor DarkGray
Write-Host ""

$query = Read-Host "  Enter search query"

Write-Host ""
Write-Host "  Validating..." -ForegroundColor Yellow

$body = @{ search = $query } | ConvertTo-Json

try {
    # Note: This endpoint does NOT include team_slug
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/misc/validate_elastic_search_query" -Headers $headers -Method Post -Body $body

    Write-Host ""
    if ($response.success) {
        Write-Host "  VALID: Query syntax is correct!" -ForegroundColor Green
    } else {
        Write-Host "  INVALID: Query syntax has errors" -ForegroundColor Red
    }
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
