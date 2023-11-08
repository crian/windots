# PSReadLine
Import-Module -Name PSReadLine
if ($PSVersionTable.PSVersion -ge "7.2") {
    Set-PSReadLineOption -PredictionSource HistoryAndPlugin
} else {
    Set-PSReadLineOption -PredictionSource History
}
Set-PSReadLineOption -HistoryNoDuplicates
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }

# PSFzf
Import-Module -Name PsFzf
Set-PsFzfOption -PsReadlineChordProvider 'Ctrl+t' -PsReadlineChordReverseHistory 'Ctrl+r'
Set-PsFzfOption -TabExpansion

# Terminal-Icons
Import-Module -Name Terminal-Icons

# Functions and aliases
function la {Get-ChildItem -Force @args}
function ld {Get-ChildItem -Directory -Force @args}
function .. {Set-Location ..}
function ... {Set-Location ..\..}
function touch {New-Item @args}
function dots {git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME @args}
function trash {explorer.exe Shell:RecycleBinFolder}
function mkcd {param($newFolderName); New-Item $newFolderName -ItemType directory; Set-Location -Path $newFolderName;}
function admin {Start-Process wt -Verb runAs}
function rs {& $profile}
function df {get-volume}
function up {
    winget upgrade --include-unknown --all
    update-module
    update-script
}
function reboot {shutdown /r /t 0}
function bios {Start-Process wt -Verb runAs -argument "shutdown /r /fw /t 0"}
Set-Alias -Name su -Value admin
Set-Alias -Name c -Value clear

# Starship prompt
Invoke-Expression (&starship init powershell)
