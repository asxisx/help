# To Connect without entering password in Edge, usually to save from the error "Connect-SPOService : No valid OAuth 2.0 authentication session exists"

$username = "admin@contoso.sharepoint.com" 
$password = "password" 
$cred = New-Object -TypeName System.Management.Automation.PSCredential -argumentlist $userName, $(convertto-securestring $Password -asplaintext -force) 
Connect-SPOService -Url https://contoso-admin.sharepoint.com -Credential $cred


#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# Connect with PnP

Install-Module PnP.Powershell

# Then create a certificate and upload it to your app registration. Get the thumbprint.
# to know how to create a certificate, check another file powershell-certificate something.

$SiteURL = ""
$ClientID = ""
$ThumbPrint = ""
$Tenant = ""
 
#Connect to SharePoint Online using Certificate
Connect-PnPOnline -Url $SiteURL -ClientId $ClientID -Thumbprint $ThumbPrint -Tenant $Tenant
 
#Get the Site
Get-PnPSite

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

