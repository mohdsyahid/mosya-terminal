Write-Host ""
Write-Host "══════════════════════════════════════════════" -ForegroundColor DarkGray
Write-Host ""

Write-Host "[1] 💻 Standard Terminal"

Write-Host "[2] 🚀 MOSYA Workspace"

Write-Host ""

$mode = Read-Host "Choose"

switch($mode){

"1"{

return

}

"2"{

. "$HOME\.mosya\workspace.ps1"

}

default{

return

}

}