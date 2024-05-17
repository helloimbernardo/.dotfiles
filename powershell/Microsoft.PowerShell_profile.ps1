## this file is synced with dotfiles

# --- Modules ---
# gsudo
Import-Module "gsudoModule"

# --- oh-my-posh ---
oh-my-posh init pwsh --config 'C:\Users\jb\AppData\Local\Programs\oh-my-posh\themes\jtracey93.omp.json' | Invoke-Expression

# --- aliases ---
New-Alias neofetch fastfetch
New-Alias vim nvim
New-Alias vi nvim