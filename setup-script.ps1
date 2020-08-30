# --- Elevate Shell
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

# --- set the screen timeout to 30 minutes, and disable auto sleep in AC power
Powercfg /Change monitor-timeout-ac 30
Powercfg /Change standby-timeout-ac 0

# --- Clean Up Windows UWP Apps
$uwpRubbishApps = @(
    "Microsoft.Messaging",
    "king.com.CandyCrushSaga",
    "Microsoft.BingNews",
    "Microsoft.MicrosoftSolitaireCollection",
    "Microsoft.People",
    "Microsoft.WindowsFeedbackHub",
    "Microsoft.YourPhone",
    "Microsoft.MicrosoftOfficeHub",
    "Fitbit.FitbitCoach",
    "4DF9E0F8.Netflix")

foreach ($uwp in $uwpRubbishApps) {
    Get-AppxPackage -Name $uwp | Remove-AppxPackage
}

# --- Choco Package Manager
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# --- Scoop Package Manager
# Execution policy
Set-ExecutionPolicy RemoteSigned -scope CurrentUser
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')

# --- Install Choco packages
choco install 7zip.install googlechrome wget git starship firacodenf greenshot nodejs vscode eartrumpet file-converter microsoft-windows-terminal quicklook -y

# --- Windows Package Manager Packages
if (Get-Command 'winget' -errorAction SilentlyContinue) {
    winget install --id=Armin2208.WindowsAutoNightMode -e ;
}else{
    Write-Host ""
    Write-Host "winget is not available" -ForegroundColor Green
    Write-Host "------------------------------------" -ForegroundColor Green
}

# --- Install VS-Code Extensions
code --install-extension EditorConfig.EditorConfig
code --install-extension Nixon.env-cmd-file-syntax
code --install-extension sleistner.vscode-fileutils
code --install-extension brittanychiang.halcyon-vscode
code --install-extension oderwat.indent-rainbow
code --install-extension vitoravelino.mosaic
code --install-extension wayou.vscode-todo-highlight
code --install-extension eamodio.gitlens
code --install-extension aaron-bond.better-comments
code --install-extension CoenraadS.bracket-pair-colorizer-2

# --- Done
Write-Host "script is done" -ForegroundColor Green
Write-Host "------------------------------------" -ForegroundColor Green
Write-Host "please add 'Invoke-Expression (&starship init powershell)' to '~\Documents\PowerShell\Microsoft.PowerShell_profile.ps1'" -ForegroundColor Green
