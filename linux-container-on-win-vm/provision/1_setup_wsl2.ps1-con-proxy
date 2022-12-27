# Boxstarter setup script

##
# WSL2
#

# Step 1: Enable Windows Subsystem for Linux (WSL)
Enable-WindowsOptionalFeature -Online -NoRestart -All -FeatureName Microsoft-Windows-Subsystem-Linux
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

# Step 2: Enable Windows Virtual Machine Platform
Enable-WindowsOptionalFeature -Online -NoRestart -All -FeatureName VirtualMachinePlatform 
#dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
# after that you need to reboot the machine

bcdedit /set hypervisorlaunchtype auto


# Step 3: Update the Linux kernel to the latest version
$uri = "https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi"
$out = "c:\tmp\wsl_update_x64.msi"
$proxy = ([System.Net.WebRequest]::GetSystemWebproxy()).GetProxy($uri)
Invoke-WebRequest -uri $uri -OutFile $out -Proxy $proxy -ProxyUseDefaultCredentials
Start-Process -FilePath "msiexec.exe" -ArgumentList "/i $out /quiet /norestart /l c:\tmp\wsl2_install_log.txt" -NoNewWindow -Wait
#start /wait msiexec /i C:\tmp\wsl_update_x64.msi /quiet /norestart /l c:\tmp\wsl2_install_log.txt

