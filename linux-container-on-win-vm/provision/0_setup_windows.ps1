#Set-PSDebug -Trace 1

# set RDP
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" -Value 0
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"

# enable WinRM: already enabled in box
#powershell -Command Enable-PSRemoting -Force

Set-TimeZone "Coordinated Universal Time" -Verbose
Disable-BingSearch
Set-TaskbarOptions -Dock Bottom
Update-Help
Install-WindowsUpdate

# Fix Windows Explorer
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions -EnableShowFullPathInTitleBar


