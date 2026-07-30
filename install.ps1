# ==========================================
# MOSYA Terminal Installer
# Author  : Mohd Syahid
# Website : https://mosya.my
# Version : 1.0.0
# ==========================================

$ErrorActionPreference = "Stop"

Clear-Host

Write-Host ""
Write-Host "==========================================" -ForegroundColor DarkGray
Write-Host "        🚀 MOSYA Terminal Installer" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor DarkGray
Write-Host ""

# ---------------------------------------------------
# Check PowerShell Version
# ---------------------------------------------------

if ($PSVersionTable.PSVersion.Major -lt 7) {
    Write-Host "❌ PowerShell 7 or newer is required." -ForegroundColor Red
    exit 1
}

Write-Host "✅ PowerShell $($PSVersionTable.PSVersion)" -ForegroundColor Green

# ---------------------------------------------------
# Check Git
# ---------------------------------------------------

if (Get-Command git -ErrorAction SilentlyContinue) {
    Write-Host "✅ Git Detected" -ForegroundColor Green
}
else {
    Write-Host "⚠ Git not found (optional)" -ForegroundColor Yellow
}

# ---------------------------------------------------
# Paths
# ---------------------------------------------------

$Source = Join-Path $PSScriptRoot ".mosya"
$Destination = Join-Path $HOME ".mosya"

# ---------------------------------------------------
# Backup Existing MOSYA
# ---------------------------------------------------

if (Test-Path $Destination) {

    $Backup = "$HOME\.mosya_backup_$(Get-Date -Format yyyyMMdd_HHmmss)"

    Copy-Item $Destination $Backup -Recurse -Force

    Write-Host "📦 Existing installation backed up:" -ForegroundColor Yellow
    Write-Host "   $Backup"
}

# ---------------------------------------------------
# Install Files
# ---------------------------------------------------

Copy-Item $Source $Destination -Recurse -Force

Write-Host "✅ Files installed." -ForegroundColor Green

# ---------------------------------------------------
# Ensure PowerShell Profile Exists
# ---------------------------------------------------

$ProfileFolder = Split-Path $PROFILE

if (!(Test-Path $ProfileFolder)) {
    New-Item -ItemType Directory -Force -Path $ProfileFolder | Out-Null
}

if (!(Test-Path $PROFILE)) {
    New-Item -ItemType File -Force -Path $PROFILE | Out-Null
}

# ---------------------------------------------------
# Add Loader
# ---------------------------------------------------

$Loader = '. "$HOME\.mosya\profile.ps1"'

$Content = Get-Content $PROFILE -Raw

if ($Content -notmatch [regex]::Escape($Loader)) {

    Add-Content $PROFILE ""
    Add-Content $PROFILE $Loader

    Write-Host "✅ PowerShell profile updated." -ForegroundColor Green

}
else {

    Write-Host "ℹ Loader already exists." -ForegroundColor Cyan

}

Write-Host ""
Write-Host "==========================================" -ForegroundColor DarkGray
Write-Host "        🎉 Installation Complete" -ForegroundColor Green
Write-Host "==========================================" -ForegroundColor DarkGray
Write-Host ""
Write-Host "Next Steps:" -ForegroundColor Cyan
Write-Host ""
Write-Host "  1. Close PowerShell"
Write-Host "  2. Open a new PowerShell window"
Write-Host "  3. Enjoy MOSYA Terminal 🚀"
Write-Host ""