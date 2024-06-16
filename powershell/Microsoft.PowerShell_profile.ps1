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

New-Alias rc Edit-Profile
New-Alias scripts C:\Users\jb\Documents\Apps\bin\scripts.ps1

function Edit-Profile {
    vim $PROFILE
}
