function prompt {

    # Folder semasa
    $folder = Split-Path (Get-Location) -Leaf
    if ([string]::IsNullOrWhiteSpace($folder)) {
        $folder = (Get-Location).Path
    }

    # Git Branch
    $branch = ""
    try {
        $git = git branch --show-current 2>$null
        if ($LASTEXITCODE -eq 0 -and $git) {
            $branch = " 🌿 $git"
        }
    }
    catch {}

    # Git Status
    $status = ""
    try {
        $dirty = git status --porcelain 2>$null
        if ($LASTEXITCODE -eq 0) {
            if ($dirty) {
                $status = " ✗ Modified"
            } else {
                $status = " ✔ Clean"
            }
        }
    }
    catch {}

    # Warna
    Write-Host ""
    Write-Host "╭──────────────────────────────────────────────" -ForegroundColor DarkGray

    Write-Host "│ " -NoNewline -ForegroundColor DarkGray
    Write-Host "🧑‍💻 MOSYA" -NoNewline -ForegroundColor Cyan

    Write-Host " │ " -NoNewline -ForegroundColor DarkGray
    Write-Host "📁 $folder" -NoNewline -ForegroundColor Yellow

    if ($branch) {
        Write-Host "$branch" -NoNewline -ForegroundColor Green
    }

    if ($status) {
        Write-Host " │ $status" -NoNewline -ForegroundColor Magenta
    }

    Write-Host ""

    Write-Host "╰─❯ " -NoNewline -ForegroundColor Cyan

    return " "
}