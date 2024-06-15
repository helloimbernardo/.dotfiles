@echo off
set HOME_DIR=%HOMEDRIVE%%HOMEPATH%

echo:

echo --- helloimbernardo's .dotfiles Windows Setup ---
echo:

echo This script will install several basic tools like Git, Neovim and allow you to install other utilities
echo It will also link the config files in this repo to the correct location
echo This script assumes you have winget installed, if you don't, please install it before running this script
echo This script will also install winget packages, if you don't want to install them, please run commands manually
echo:

echo This script needs to run as administrator to create symbolic links
echo:

set /p continue="Do you want to continue? (y/n): "
if /I "%continue%" NEQ "y" (
    echo "Exiting..."
    exit
)

echo:
echo INSTALLING WINGET PACKAGES
echo:

winget import -i winget\devessentials.json
echo Winget packages installed

@REM asks if user wants extra packages
set /p extra="Do you want to install extra packages? (firefox, spotify, etc...) (y/n): "
if /I "%extra%" EQU "y" (
    winget import -i winget\extras.json
    echo Extra packages installed
) else (
    echo No extra packages installed
)


set /p scoop="Do you want to install scoop and useful scoop packages (fastfetch)? (y/n): "
if /I "%scoop%" EQU "y" (
    powershell -Command "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser"
    powershell -Command "Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression"
    echo Scoop installed

    scoop install fastfetch
) else (
    echo No scoop installed
)

echo:
echo LINKING CONFIG FILES
echo:

mklink /H %HOME_DIR%\Documents\Powershell\Microsoft.PowerShell_profile.ps1 powershell\Microsoft.PowerShell_profile.ps1
echo Powershell profile linked

mklink /H %HOME_DIR%\.gitconfig git\windows.gitconfig
echo Git config linked

mklink /H %HOME_DIR%\.config\fastfetch\config.jsonc fastfetch\config.jsonc
echo Fastfetch config linked

mklink /H %LOCALAPPDATA%\Programs\oh-my-posh\themes\helloimbernardo.omp.json ohmyposh\helloimbernardo.omp.json
echo OhMyPosh config linked

@REM target directories must exist before creating symbolic links
mkdir %LOCALAPPDATA%\nvim
mkdir %LOCALAPPDATA%\nvim\lua
mklink /H %LOCALAPPDATA%\nvim\init.lua nvim\init.lua
mklink /H %LOCALAPPDATA%\nvim\lua\plugins.lua nvim\lua\plugins.lua
echo Neovim config linked

echo:
echo APPS TO INSTALL MANUALLY
echo:

echo Some apps are not available on winget or scoop, please install them manually:
echo (if you didn't install scoop) FASTFETCH: https://github.com/fastfetch-cli/fastfetch

echo:
echo MANUAL CONFIGURATIONS
echo:

echo Some steps need to be done manually:
echo - Set up Windows Terminal to use the settings in the windows-terminal folder by copy-pasting the contents

echo:
echo SETUP COMPLETE
echo Please restart your terminal to see changes
echo Click any key to exit...
pause >nul
cls
fastfetch