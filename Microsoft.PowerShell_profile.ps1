Set-Alias touch New-Item # touch command like linux
Set-Alias vim nvim
Set-Alias vi nvim
Function mbash { nvim $PROFILE }

function ln([switch] $s, [string] $filePath, [string] $symlink) {
    if ($s) {
        New-Item -ItemType SymbolicLink -Value $filePath -Path $symlink | Out-Null
    }
    else {
        New-Item -ItemType HardLink -Value $filePath -Path $symlink | Out-Null
    }
}

# oh-my-posh theme
oh-my-posh init pwsh --config $env:POSH_THEMES_PATH/robbyrussell.omp.json | Invoke-Expression

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.SendKeys]::SendWait('^ ') # Type Ctrl+Space to suppress hankaku eisu
