Write-Host ""

Write-Host "Environment"

Write-Host "────────────────────────────────────────────"

$Apps = @(
    @{Name="Git";Command="git"},
    @{Name="PHP";Command="php"},
    @{Name="Node";Command="node"},
    @{Name="Docker";Command="docker"},
    @{Name="GitHub";Command="gh"}
)

foreach($App in $Apps){

    if(Get-Command $App.Command -ErrorAction SilentlyContinue){

        Write-Host " 🟢 $($App.Name)".PadRight(30) -NoNewline

        Write-Host "Ready" -ForegroundColor Green

    }
    else{

        Write-Host " 🔴 $($App.Name)".PadRight(30) -NoNewline

        Write-Host "Offline" -ForegroundColor Red

    }

}

try{

    Test-Connection 1.1.1.1 -Quiet -Count 1 | Out-Null

    if($?){

        Write-Host " 🟢 Network".PadRight(30) -NoNewline

        Write-Host "Online" -ForegroundColor Green

    }

}
catch{

    Write-Host " 🔴 Network".PadRight(30) -NoNewline

    Write-Host "Offline" -ForegroundColor Red

}