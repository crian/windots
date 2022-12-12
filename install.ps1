# Install dependent packages
winget install Microsoft.PowerShell
winget install Git.Git
winget install Starship.Starship

#Install PowerShell Modules
Install-Module -Name PowerShellGet -Force
Install-Module -Name PSReadLine
Install-Module -Name Terminal-Icons

# Install dotfiles
function dots {git --git-dir=$HOME\.dotfiles --work-tree=$HOME @Args}
git clone --bare https://github.com/crian/dotfiles-windows.git $HOME\.dotfiles
dots config --local status.showUntrackedFiles no
dots checkout