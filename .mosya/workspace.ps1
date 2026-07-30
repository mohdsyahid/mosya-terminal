Clear-Host

Write-Host ""
Write-Host "==========================================" -ForegroundColor DarkGray
Write-Host "           MOSYA WORKSPACE" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor DarkGray
Write-Host ""

for ($i = 0; $i -lt $Projects.Count; $i++) {

    $project = $Projects[$i]

    Write-Host "[$($i+1)] $($project.Icon) $($project.Name)"

}

Write-Host ""
Write-Host "[0] Exit"
Write-Host ""

$choice = Read-Host "Choose Project"

if ($choice -eq "0") {

    return

}

$index = [int]$choice - 1

if ($index -ge 0 -and $index -lt $Projects.Count) {

    Set-Location $Projects[$index].Path

    Clear-Host

}