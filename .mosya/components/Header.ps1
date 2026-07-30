$date = Get-Date

$time  = $date.ToString("HH:mm:ss")
$today = $date.ToString("dd MMM yyyy")

$logo = @'
███╗   ███╗ ██████╗ ███████╗██╗   ██╗ █████╗
████╗ ████║██╔═══██╗██╔════╝╚██╗ ██╔╝██╔══██╗
██╔████╔██║██║   ██║███████╗ ╚████╔╝ ███████║
██║╚██╔╝██║██║   ██║╚════██║  ╚██╔╝  ██╔══██║
██║ ╚═╝ ██║╚██████╔╝███████║   ██║   ██║  ██║
╚═╝     ╚═╝ ╚═════╝ ╚══════╝   ╚═╝   ╚═╝  ╚═╝
'@

Write-Host ""
Write-Host $logo -ForegroundColor Cyan

Write-Host "               Developer Workspace" -ForegroundColor White
Write-Host "                 Mohd Syahid" -ForegroundColor Yellow
Write-Host ""

Write-Host ("🌐  mosya.my".PadRight(45) + "🕒  $time")
Write-Host ("🐙  github.com/mohdsyahid".PadRight(45) + "📅  $today")

Write-Host ""
Write-Host "Version $Version" -ForegroundColor DarkGray

Write-Host ""
Write-Host ("═" * 90) -ForegroundColor DarkGray