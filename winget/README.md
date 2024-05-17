# Winget packages

This folder contains several packages that can be installed using the Windows Package Manager (winget).
These are split into two files `devessentials.json` and `extras.json`. You can install them running the following commands:

```powershell
winget import -i devessentials.json
winget import -i extras.json
```

These are also installed automatically when running the [`install_Windows.bat`](../install_Windows.bat) script at the root of this repository.

## Dev Essentials
The `devessentials.json` file contains the following packages:

- 7zip
- Git
- GnuPG (GPG)
- Gpg4win (GPG)
- PowerShell (Latest version)
- Windows Terminal
- tldr (cmd tool for quick help on a command)
- gsudo (sudo for windows)
- OhMyPosh (PowerShell customizations)
- Neovim

## Extras
The `extras.json` file contains the following packages:

- Mozilla Firefox
- Mozilla Thunderbird
- Spotify
- VLC
- Visual Studio Code
- Microsoft Edge Redirect