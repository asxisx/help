# [Install Powershell on Linux](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-linux?view=powershell-7.3)
---
## [Install Powershell on Ubuntu]()
---
PowerShell for Linux is published to package repositories for easy installation and updates. The URL to the package varies by OS version:

Ubuntu 22.04 - https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb

Ubuntu 20.04 - https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb

Ubuntu 18.04 - https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb

```bash
# Update the list of packages
sudo apt-get update
# Install pre-requisite packages.
sudo apt-get install -y wget apt-transport-https software-properties-common
# Download the Microsoft repository GPG keys
wget -q "https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb"
# Register the Microsoft repository GPG keys
sudo dpkg -i packages-microsoft-prod.deb
# Delete the the Microsoft repository GPG keys file
rm packages-microsoft-prod.deb
# Update the list of packages after we added packages.microsoft.com
sudo apt-get update
# Install PowerShell
sudo apt-get install -y powershell
# Start PowerShell
pwsh
```
---
### [Installation via Direct Download](https://learn.microsoft.com/en-us/powershell/scripting/install/install-ubuntu?view=powershell-7.3#installation-via-direct-download)
---
### [Powershell Paths](https://learn.microsoft.com/en-us/powershell/scripting/install/install-ubuntu?view=powershell-7.3#powershell-paths)



