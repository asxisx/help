# Variables — replace these with your values
$resourceGroup = "YourResourceGroupName"
$location = "eastus"  # or your region
$vmName = "Win11VM"
$virtualNetworkName = "YourVNetName"
$subnetName = "YourSubnetName"
$adminUsername = "azureuser"
$adminPassword = ConvertTo-SecureString "YourStrongPassword123!" -AsPlainText -Force
$vmSize = "Standard_D2s_v3"  # or your preferred size
$ipName = "$vmName-ip"
$nicName = "$vmName-nic"
$diskName = "$vmName-osdisk"

# Login to Azure (if not already)
Connect-AzAccount

# Get existing VNet and subnet
$vnet = Get-AzVirtualNetwork -Name $virtualNetworkName -ResourceGroupName $resourceGroup
$subnet = Get-AzVirtualNetworkSubnetConfig -Name $subnetName -VirtualNetwork $vnet

# Create public IP
$publicIp = New-AzPublicIpAddress -Name $ipName -ResourceGroupName $resourceGroup `
    -Location $location -AllocationMethod Dynamic

# Create NIC
$nic = New-AzNetworkInterface -Name $nicName -ResourceGroupName $resourceGroup `
    -Location $location -SubnetId $subnet.Id -PublicIpAddressId $publicIp.Id

# Get latest Windows 11 image
$win11Image = Get-AzVMImageSku -Location $location -PublisherName "MicrosoftWindowsDesktop" `
    -Offer "windows-11" | Where-Object {$_.Skus -like "win11-22h2-pro"} | Select-Object -First 1

# Configure VM
$vmConfig = New-AzVMConfig -VMName $vmName -VMSize $vmSize | `
    Set-AzVMOperatingSystem -Windows -ComputerName $vmName -Credential (New-Object PSCredential ($adminUsername, $adminPassword)) -ProvisionVMAgent -EnableAutoUpdate | `
    Set-AzVMSourceImage -PublisherName "MicrosoftWindowsDesktop" -Offer "windows-11" -Skus $win11Image.Skus -Version "latest" | `
    Add-AzVMNetworkInterface -Id $nic.Id

# Create VM
New-AzVM -ResourceGroupName $resourceGroup -Location $location -VM $vmConfig