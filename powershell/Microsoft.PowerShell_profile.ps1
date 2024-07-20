## --- this file is synced with dotfiles ---

# --- Autocomplete ---
# Shows navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# more autocomplete command registering further down on this config file and more info at the link:
# https://techcommunity.microsoft.com/t5/itops-talk-blog/autocomplete-in-powershell/ba-p/2604524


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

function coding {
	cd ~\Documents\coding
}

function tux{
	wsl -d Ubuntu -e zsh
}

function nebuladownload {
	<#
	.SYNOPSIS
		Downloads videos from Nebula with highest resolution available and all subtitles
	.INPUTS
		Video URL on nebula.tv (can be piped and accepts multiple piped values)
	.OUTPUTS
		Downloads video and subtitles (if available) on current directory
	.EXAMPLE
	        NebulaDownload "https://nebula.tv/video/example1"
		This command downloads the video and all subtitles from the specified URL.
	.EXAMPLE
		"https://nebula.tv/video/example1", "https://nebula.tv/video/example2" | NebulaDownload
		This command downloads videos and all subtitles from the specified URLs using the pipeline.
	.NOTES
		Ensure yt-dlp is installed and accessible in the system's PATH.
	#>

	[CmdletBinding()]
    	param (
		[Parameter(Position=0, Mandatory=$true, ValueFromPipeline=$true)]
	        [string]$VideoUrl
	)
	process {
		$command = "yt-dlp.exe --netrc --write-subs --sub-langs 'all' $VideoUrl"
		Invoke-Expression $command
	}
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


# --- AUTOCOMPLETE ARGUMENT COMPLETER REGISTERING ---

# winget completion
Register-ArgumentCompleter -Native -CommandName winget -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)
        [Console]::InputEncoding = [Console]::OutputEncoding = $OutputEncoding = [System.Text.Utf8Encoding]::new()
        $Local:word = $wordToComplete.Replace('"', '""')
        $Local:ast = $commandAst.ToString().Replace('"', '""')
        winget complete --word="$Local:word" --commandline "$Local:ast" --position $cursorPosition | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
        }
}
