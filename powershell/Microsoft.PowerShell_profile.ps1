## this file is synced with dotfiles

# --- Modules ---
# gsudo
Import-Module "gsudoModule"

# --- oh-my-posh ---
oh-my-posh init pwsh --config 'C:\Users\jb\AppData\Local\Programs\oh-my-posh\themes\helloimbernardo.omp.json' | Invoke-Expression

# --- aliases ---
New-Alias neofetch fastfetch
New-Alias vim nvim
New-Alias vi nvim
New-Alias ifconfig ipconfig
New-Alias spotify spotify-player

New-Alias rc Edit-Profile
New-Alias scripts C:\Users\jb\Documents\Apps\bin\scripts.ps1

function Edit-Profile {
    vim $PROFILE
}

function spotify-player {
	<#
	.SYNOPSIS
		Fast, easy to use, and configurable terminal music player.
	.LINK
		https://github.com/aome510/spotify-player/tree/master?tab=readme-ov-file#commands
	.INPUTS
		None. You can't pipe inputs
	.OUTPUTS
		Graphical interface on your command line to control spotify with
	#>
	spotify_player.exe
}
