Import-Module $env:ChocolateyInstall\helpers\chocolateyProfile.psm1

# Set-Alias touch New-Item # touch command like linux

Set-Alias vim nvim
Set-Alias vi nvim

Import-Module PSReadline
Set-PSReadLineOption -EditMode Emacs

Remove-Item -Force Alias:sl
function sl { sl.exe }
function mbash { nvim $PROFILE }
function sbash { refreshenv; . $PROFILE }

function touch([string] $filePath) {
    # if exists, make it update
    # if not exists, make it create
    
    if (Test-Path $filePath) {
        (Get-Item $filePath).LastWriteTime = Get-Date
    }
    else {
        New-Item -ItemType File -Path $filePath | Out-Null
    }
}

function ln([switch] $s, [string] $filePath, [string] $symlink) {
    if ($s) {
        New-Item -ItemType SymbolicLink -Value $filePath -Path $symlink | Out-Null
    }
    else {
        New-Item -ItemType HardLink -Value $filePath -Path $symlink | Out-Null
    }
}

function cht.sh([string] $s) {
    curl.exe cht.sh/$s
}

# oh-my-posh theme
oh-my-posh init pwsh --config $env:POSH_THEMES_PATH/robbyrussell.omp.json | Invoke-Expression

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.SendKeys]::SendWait('^ ') # Type Ctrl+Space to suppress hankaku eisu

function rmrf {
     <#
        .DESCRIPTION
        Deletes the specified file or directory.
        .PARAMETER target
        Target file or directory to be deleted.
        .NOTES
        This is an equivalent command of "rm -rf" in Unix-like systems.
        #>
    Param(
        [Parameter(Mandatory=$true)]
        [string]$Target
    )
    Remove-Item -Recurse -Force $Target
}
