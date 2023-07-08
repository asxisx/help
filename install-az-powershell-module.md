# [Install Azure Powershell](https://learn.microsoft.com/en-us/powershell/azure/install-azure-powershell?view=azps-10.0.0)

## [Install Azure Powershell on Windows]($PSVersionTable.PSVersion)

```Powershell
# To check the version
$PSVersionTable.PSVersion

# In windows Powershell 5
Install-Module -Name PowerShellGet -Force
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Install-Module -Name Az -Repository PSGallery -Force

# In Windows Powershell 7
Get-ExecutionPolicy -List
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Install-Module -Name Az -Repository PSGallery -Force
```

#### To Update

```Powershell
Update-Module -Name Az -Force
```
