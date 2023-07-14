# PSReadLine
Import-Module -Name PSReadLine
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -HistoryNoDuplicates
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

# PSFzf
Import-Module -Name PsFzf
Set-PsFzfOption -PsReadlineChordProvider 'Ctrl+t' -PsReadlineChordReverseHistory 'Ctrl+r'
Set-PsFzfOption -TabExpansion
Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }

# Terminal-Icons
Import-Module -Name Terminal-Icons

# Aliases and functions
function la {Get-ChildItem -Force @args}
function ld {Get-ChildItem -Directory -Force @args}
function .. {Set-Location ..}
function ... {Set-Location ..\..}
function touch {New-Item @args}
function dots {git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME @args}
function trash {explorer.exe Shell:RecycleBinFolder}
function mkcd {param($newFolderName); New-Item $newFolderName -ItemType directory; Set-Location -Path $newFolderName;}

# Starship prompt
Invoke-Expression (&starship init powershell)
