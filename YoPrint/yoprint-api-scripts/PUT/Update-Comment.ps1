# Update-Comment.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Magenta
Write-Host "              UPDATE COMMENT" -ForegroundColor Magenta
Write-Host "  ============================================" -ForegroundColor Magenta
Write-Host ""
Write-Host "  Edit an existing comment." -ForegroundColor Gray
Write-Host "  You need the comment UUID." -ForegroundColor DarkGray
Write-Host ""

$CommentId = Read-Host "  Enter comment ID (UUID)"
Write-Host ""
$NewComment = Read-Host "  Enter new comment text"
Write-Host ""
Write-Host "  Updating comment..." -ForegroundColor Yellow

$body = @{
    id = $CommentId
    comment = $NewComment
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/comment/$CommentId" -Headers $headers -Method Put -Body $body

    Write-Host ""
    Write-Host "  SUCCESS: Comment updated!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    Comment ID: $CommentId" -ForegroundColor Cyan
    Write-Host "    New Text: $NewComment" -ForegroundColor White
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
