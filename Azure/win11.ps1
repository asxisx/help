# Variables
$resourceGroup = "MyResourceGroup"
$location = "EastUS"
$vmName = "Win11VM"
$vmSize = "Standard_D2s_v3"
$virtualNetworkName = "$vmName-VNet"
$subnetName = "$vmName-Subnet"
$ipName = "$vmName-IP"
$nicName = "$vmName-NIC"
$adminUsername = "azureuser"
$adminPassword = ConvertTo-SecureString "YourStrongPassword123!" -AsPlainText -Force

# Create resource group (if it doesn't exist)
if (-not (Get-AzResourceGroup -Name $resourceGroup -ErrorAction SilentlyContinue)) {
    New-AzResourceGroup -Name $resourceGroup -Location $location
}

# Create virtual network and subnet
$vnet = New-AzVirtualNetwork -ResourceGroupName $resourceGroup -Location $location `
    -Name $virtualNetworkName -AddressPrefix "10.0.0.0/16"
Add-AzVirtualNetworkSubnetConfig -Name $subnetName -AddressPrefix "10.0.0.0/24" -VirtualNetwork $vnet
$vnet | Set-AzVirtualNetwork

# Create public IP
$pip = New-AzPublicIpAddress -ResourceGroupName $resourceGroup -Location $location `
    -Name $ipName -AllocationMethod Dynamic

# Create NIC
$subnet = Get-AzVirtualNetworkSubnetConfig -Name $subnetName -VirtualNetwork $vnet
$nic = New-AzNetworkInterface -ResourceGroupName $resourceGroup -Location $location `
    -Name $nicName -SubnetId $subnet.Id -PublicIpAddressId $pip.Id

# Define Windows 11 image reference
$win11Image = Get-AzVMImage -Location $location -PublisherName "MicrosoftWindowsDesktop" `
    -Offer "windows-11" -Skus "win11-22h2-pro" | Select-Object -First 1

# Create VM config
$vmConfig = New-AzVMConfig -VMName $vmName -VMSize $vmSize |
    Set-AzVMOperatingSystem -Windows -ComputerName $vmName -Credential (New-Object System.Management.Automation.PSCredential($adminUsername, $adminPassword)) -ProvisionVMAgent -EnableAutoUpdate |
    Set-AzVMSourceImage -PublisherName $win11Image.PublisherName -Offer $win11Image.Offer -Skus $win11Image.Skus -Version "latest" |
    Add-AzVMNetworkInterface -Id $nic.Id

# Create the VM
New-AzVM -ResourceGroupName $resourceGroup -Location $location -VM $vmConfig