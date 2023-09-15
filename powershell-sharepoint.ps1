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

# Download the whole folder from Sharepoint Site to your local location.

#Set Parameters
$SiteURL = "https://global.sharepoint.com"
$ClientID = ""
$ThumbPrint = ""
$Tenant = "global.com"
# $TenantSiteURL = "https://globalgeninvo.sharepoint.com"
$SiteRelativeURL = "/sites/test/Shared%20Documents"
$LibraryName = "test1509"
$DownloadPath ="C:\temp\"
 
#Connect to PnP Online as Virtual Drive "SPO:\"
Connect-PnPOnline -Url $SiteURL -ClientId $ClientID -Thumbprint $ThumbPrint -Tenant $Tenant -CreateDrive
# Connect-PnPOnline -Url $TenantSiteURL -CreateDrive -Credentials (Get-Credential)
 
#Change the Path and navigate to the source site
Set-Location -Path SPO:\$SiteRelativeURL
 
#Download Document Library to Local Drive
Copy-PnpItemProxy -Recurse -Force $LibraryName $DownloadPath


#Read more: https://www.sharepointdiary.com/2017/03/sharepoint-online-download-all-files-from-document-library-using-powershell.html#ixzz8DOFZdTAv
