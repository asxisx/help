$ErrorActionPreference = "Stop"

$timer = [System.Diagnostics.Stopwatch]::StartNew() 
$subscription_id = ""

function connectToAzure {
    Write-Host "Setting Subscription to Context" -foregroundcolor cyan
    Write-Host "$(Get-date)" -foregroundcolor blue
    Write-Host "`n" 
    Set-AzContext -SubscriptionId $subscription_id
    Write-Host "`n" 
}

$serverName = 'server3'
$publicIpAddressName = "$servername-pip"
$osDiskName = "$serverName-osdisk"
$vNetName = "poc-vnet"
$rgName = "poc-rg"
$location = "centralindia"
$subnetName = "poc-vnet-subnet-1"
$subscription_id = ""

Write-Output "Creating Virtual Machine"
az vm create --name $serverName `
--resource-group $rgName `
--subnet /subscriptions/$subscription_id/resourceGroups/$rgName/providers/Microsoft.Network/virtualNetworks/$vNetName/subnets/$subnetName `
--admin-username 'azureadmin' `
--admin-password 'XNJKWEIurh98239hunid23uen2oi2u39uhednkdjnk' `
--image 'OpenLogic:CentOS:7_9-gen2:latest' `
--nic-delete-option 'Detach' `
--os-disk-size-gb 32 `
--os-disk-delete-option 'Detach' `
--os-disk-name "$osDiskName" `
--size Standard_B2ms `
--location $location `
--public-ip-address "$publicIpAddressName" `
--public-ip-address-allocation 'Static' `
--verbose

# --image Ubuntu2204

$timer.Stop()
$timer.Elapsed