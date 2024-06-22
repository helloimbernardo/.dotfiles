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

New-Alias rc Edit-Profile
New-Alias scripts C:\Users\jb\Documents\Apps\bin\scripts.ps1

function Edit-Profile {
    vim $PROFILE
}

# -- temporary alias for DAVE IDE projects --
function dave {
	cd "C:\Infineon\Tools\DAVE IDE\4.5.0.202105191637\eclipse\workspace"
}
