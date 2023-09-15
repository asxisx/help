# To Connect without entering password in Edge, usually to save from the error "Connect-SPOService : No valid OAuth 2.0 authentication session exists"

$username = "admin@contoso.sharepoint.com" 
$password = "password" 
$cred = New-Object -TypeName System.Management.Automation.PSCredential -argumentlist $userName, $(convertto-securestring $Password -asplaintext -force) 
Connect-SPOService -Url https://contoso-admin.sharepoint.com -Credential $cred
