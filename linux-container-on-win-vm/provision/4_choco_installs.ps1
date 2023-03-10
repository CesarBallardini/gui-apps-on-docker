# Boxstarter setup script

# Notes:
#  - This file has to be idempotent. it will be run several times if the
#    computer needs to be restarted. When that happens, Boxstarter schedules
#    this script to run again with an auto-logon. Fortunately choco install
#    handles trying to install the same package more than once.
#  - Pass -y to choco install to avoid interactive prompts

choco feature enable -n=allowGlobalConfirmation
choco feature enable -n=useRememberedArgumentsForUpgrades


# Useful apps
choco install microsoft-windows-terminal
#choco install vlc
#choco install keepass

choco install 7zip
#choco install adobereader
#choco install barrier
#choco install falkon
#choco install fbreader
#choco install libreoffice-fresh
#choco install lockhunter
choco install mc -ia /TASKS="desktopicon,modifypath"
#choco install obs-studio.install
choco install okular
#choco install openconnect-gui
#choco install skype
#choco install slack
#choco install sysinternals
choco install vim
choco install winrar
choco install zip
#choco install zoom

# Git
choco install git -params '"/GitAndUnixToolsOnPath /NoAutoCrlf"'
choco install git-credential-manager-for-windows

# must be installed as vagrant user
#git config --global core.autocrlf  input
#git config --global core.symlinks true
#git config --global user.name "Cesar Ballardini"
#git config --global user.email cesar.ballardini@gmail.com
#git config --global core.editor vim
#git config --global credential.helper  manager-core

# Python
choco install pyenv-win

#Adding PYENV, PYENV_HOME and PYENV_ROOT to your Environment Variables
[System.Environment]::SetEnvironmentVariable('PYENV',$env:USERPROFILE + "\.pyenv\pyenv-win\","User")

[System.Environment]::SetEnvironmentVariable('PYENV_ROOT',$env:USERPROFILE + "\.pyenv\pyenv-win\","User")

[System.Environment]::SetEnvironmentVariable('PYENV_HOME',$env:USERPROFILE + "\.pyenv\pyenv-win\","User")

#Now adding the following paths to your USER PATH variable in order to access the pyenv command
[System.Environment]::SetEnvironmentVariable('path', $env:USERPROFILE + "\.pyenv\pyenv-win\bin;" + $env:USERPROFILE + "\.pyenv\pyenv-win\shims;" + [System.Environment]::GetEnvironmentVariable('path', "User"),"User")

Set-ExecutionPolicy -Scope CurrentUser unrestricted

