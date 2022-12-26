# Boxstarter setup script

# Notes:
#  - This file has to be idempotent. it will be run several times if the
#    computer needs to be restarted. When that happens, Boxstarter schedules
#    this script to run again with an auto-logon. Fortunately choco install
#    handles trying to install the same package more than once.
#  - Pass -y to choco install to avoid interactive prompts


# Fix Windows Explorer
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions -EnableShowFullPathInTitleBar

choco feature enable -n=allowGlobalConfirmation
choco feature enable -n=useRememberedArgumentsForUpgrades

##
# WSL2
#
# Step 1: Enable Windows Subsystem for Linux (WSL)
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
# Step 2: Enable Windows Virtual Machine Platform
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
# Step 3: Update the Linux kernel to the latest version
$uri = "https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi"
$out = "c:\tmp\wsl_update_x64.msi"
$proxy = ([System.Net.WebRequest]::GetSystemWebproxy()).GetProxy($uri)
Invoke-WebRequest -uri $uri -OutFile $out -Proxy $proxy -ProxyUseDefaultCredentials
Start-Process -FilePath "msiexec.exe" -ArgumentList "/i $out /quiet /norestart /l c:\tmp\wsl2_install_log.txt" -NoNewWindow -Wait
#start /wait msiexec /i C:\tmp\wsl_update_x64.msi /quiet /norestart /l c:\tmp\wsl2_install_log.txt

# Step 4: Set WSL2 as the default version
wsl --set-default-version 2
# Step 6: Install your preferred Linux distribution



# Docker
choco install docker-desktop  # Windows Pro / Enterprise
# choco install virtualbox docker-kitematic # # Windows Pro / Enterprise
#choco install docker-toolbox -ia /COMPONENTS="kitematic,virtualbox,dockercompose" -ia /TASKS="desktopicon,modifypath,upgradevm"  # Windows HOME


choco install docker-cli
choco install docker-compose

# Activar Hyper-V, abrir powershell como administrador:

dism.exe /Online  /Get-FeatureInfo:VirtualMachinePlatform
dism.exe /Online  /Get-FeatureInfo:HypervisorPlatform
dism.exe /Online  /Get-FeatureInfo:Microsoft-Windows-Subsystem-Linux

dism.exe /Online /Enable-Feature /FeatureName:VirtualMachinePlatform /All
bcdedit /set hypervisorlaunchtype auto

Set-ExecutionPolicy -Scope CurrentUser unrestricted

