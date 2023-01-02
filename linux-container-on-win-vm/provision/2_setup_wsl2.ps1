 Boxstarter setup script

Write-Host "WSL: update WSL2"
wsl --update

Write-Host "WSL2: shutdown WSL2"
wsl --shutdown

Write-Host "WSL2: set 2 as the default version"
wsl --set-default-version 2

Write-Host "Install your preferred Linux distribution"

Write-Host "List the available Linux distributions"
wsl --list --verbose

Write-Host "Install Ubuntu Linux distribution"
#wsl --install
wsl --install -d Ubuntu

#Get-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform
dism.exe /Online  /Get-FeatureInfo:VirtualMachinePlatform
dism.exe /Online  /Get-FeatureInfo:HypervisorPlatform
dism.exe /Online  /Get-FeatureInfo:Microsoft-Windows-Subsystem-Linux

Write-Host "System Type is:"
systeminfo | find '"System Type"'

$expol = Get-ExecutionPolicy -Scope CurrentUser
if ($expol -ne "Unrestricted") {
  Write-Host "changing to unrestricted the execution policy"
  Set-ExecutionPolicy -Scope CurrentUser unrestricted
  #Set-ExecutionPolicy -Scope MachinePolicy Unrestricted
} else {
  Write-Host "execution policy is already unrestricted"
}

