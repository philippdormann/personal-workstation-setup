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

# --- Scoop Package Manager
Set-ExecutionPolicy RemoteSigned -scope CurrentUser
iex "& {$(irm get.scoop.sh)} -RunAsAdmin"
# Scoop packages
scoop install git
scoop bucket add extras
scoop install powertoys vscode 7zip googlechrome wget starship volta flameshot fork dbeaver thunderbird keepassxc firefox bat insomnia winscp libreoffice vcredist2022 windows-terminal
volta install node@latest pnpm@latest

# --- Install VS-Code Extensions
code --install-extension EditorConfig.EditorConfig
code --install-extension Nixon.env-cmd-file-syntax
code --install-extension sleistner.vscode-fileutils
code --install-extension brittanychiang.halcyon-vscode
code --install-extension oderwat.indent-rainbow
code --install-extension vitoravelino.mosaic
code --install-extension wayou.vscode-todo-highlight
code --install-extension eamodio.gitlens
code --install-extension mhutchie.git-graph
code --install-extension kohlbachjan.the-best-theme
code --install-extension github.github-vscode-theme
code --install-extension aaron-bond.better-comments
code --install-extension CoenraadS.bracket-pair-colorizer-2
code --install-extension ms-vscode-remote.remote-containers
code --install-extension ms-azuretools.vscode-docker

# needs setup -> run at end
scoop install gpg4win

# --- Done
clear
Write-Host "installation finished"
Write-Host "------------------------------------"
Write-Host "please add the following line to your powershell PROFILE"
Write-Host "Invoke-Expression (&starship init powershell)" -ForegroundColor Green
# 
code $PROFILE