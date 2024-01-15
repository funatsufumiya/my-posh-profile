Set-Alias touch New-Item # touch command like linux
Set-Alias vim nvim
Set-Alias vi nvim
Function mbash { nvim $PROFILE }

# oh-my-posh theme
oh-my-posh init pwsh --config $env:POSH_THEMES_PATH/robbyrussell.omp.json | Invoke-Expression

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.SendKeys]::SendWait('^ ') # Type Ctrl+Space to suppress hankaku eisu