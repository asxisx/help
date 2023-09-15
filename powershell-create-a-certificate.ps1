$CertificateName = "SharePoint Online Certificate"
$CertificatePassword = "Password1"
 
#Get the "Documents" folder
$DocumentsFolder = [Environment]::GetFolderPath("MyDocuments")
 
#Generate a Self-signed Certificate
$Certificate = New-SelfSignedCertificate -Subject $CertificateName -CertStoreLocation "Cert:\CurrentUser\My" -KeyExportPolicy Exportable -KeySpec Signature -KeyLength 2048 -KeyAlgorithm RSA -HashAlgorithm SHA256
 
#Export the Certificate to "Documents" Folder in your computer
Export-Certificate -Cert $Certificate -FilePath $DocumentsFolder\$CertificateName.cer
 
#Export the PFX File
Export-PfxCertificate -Cert $Certificate -FilePath "$DocumentsFolder\$CertificateName.pfx" -Password (ConvertTo-SecureString -String $CertificatePassword -Force -AsPlainText)

# https://learn.microsoft.com/en-us/azure/active-directory/develop/howto-create-self-signed-certificate
