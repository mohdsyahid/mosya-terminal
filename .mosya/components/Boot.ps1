Clear-Host

$frames = @(
"[□□□□□□□□□□] 0%",
"[■□□□□□□□□□] 10%",
"[■■□□□□□□□□] 20%",
"[■■■□□□□□□□] 30%",
"[■■■■□□□□□□] 40%",
"[■■■■■□□□□□] 50%",
"[■■■■■■□□□□] 60%",
"[■■■■■■■□□□] 70%",
"[■■■■■■■■□□] 80%",
"[■■■■■■■■■□] 90%",
"[■■■■■■■■■■] 100%"
)

Write-Host ""
Write-Host "Starting MOSYA Terminal..." -ForegroundColor Cyan
Write-Host ""

foreach ($frame in $frames) {

    Write-Host "`r$frame" -NoNewline -ForegroundColor Green
    Start-Sleep -Milliseconds 80

}

Write-Host ""
Start-Sleep -Milliseconds 250

Clear-Host