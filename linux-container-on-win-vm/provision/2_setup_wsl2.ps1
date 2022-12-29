 Boxstarter setup script

# update WSL2
wsl --update
wsl --shutdown

# Step 4: Set WSL2 as the default version
wsl --set-default-version 2
# Step 6: Install your preferred Linux distribution

wsl --list --online
wsl --install Ubuntu
wsl --set-default-version Ubuntu

#Get-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform
dism.exe /Online  /Get-FeatureInfo:VirtualMachinePlatform
dism.exe /Online  /Get-FeatureInfo:HypervisorPlatform
dism.exe /Online  /Get-FeatureInfo:Microsoft-Windows-Subsystem-Linux

systeminfo | find '"System Type"'

Set-ExecutionPolicy -Scope CurrentUser unrestricted

