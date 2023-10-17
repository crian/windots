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
# Fzf colors
$ENV:FZF_DEFAULT_OPTS=@"
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8
"@

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
