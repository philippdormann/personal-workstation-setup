# @philippdormann/setup
automatically setup a fresh workstation for most of my needs

## What will this script do?
- 🔌 set the screen timeout to 30 minutes, and disable auto sleep in AC power
- 🚯 remove useless Windows UWP Apps
- 📦 Install Scoop Package Manager
- ⚡ Install my most used programs (or some that are at least really useful)
  - 🗜️ 7-Zip
  - wget
  - git
  - 🚀 starship shell prompt
  - 📷 Greenshot
  - Google Chrome
  - Firefox
  - 👨‍💻 Windows Terminal
  - NodeJS
  - Git Fork Client
  - Thunderbird
  - KeepassXC
  - DBeaver
  - VSCode
  - GPG4Win
  - libreoffice
  - Insomnia
  - WinSCP
- 🧩 VS-Code Extensions
  - 🌳 Gitlens
  - 👨‍💻 Editorconfig
  - ⚙ .env file syntax
  - 🎨 Themes
    - Best Theme
    - GitHub Theme
  - `🖊` TODO-Highlight
  - `//` Better Comments
  - `{` Bracket Pair Colorizer
  - 🌈 Indent Rainbow
  - 📎 File Utils

## 🧪 Testing the script
Done via [Windows Sandbox](https://techcommunity.microsoft.com/t5/windows-kernel-internals/windows-sandbox/ba-p/301849) to simulate a clean Windows install

## 🚀 Run the script
```
iex "& {$(irm https://raw.githubusercontent.com/philippdormann/personal-workstation-setup/master/setup-script.ps1)}"
```
