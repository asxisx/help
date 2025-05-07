$ErrorActionPreference = "Stop"
$VMLocalAdminUser = "LocalAdminUser"
$VMLocalAdminSecurePassword = ConvertTo-SecureString -String "SJNL@EHJQDNo@U#Yo283u298" -AsPlainText -Force
$LocationName = "westeurope"
$ResourceGroupName = "gen-qc-qa-dummy-rg"
$ComputerName = "GENQCQAWIN"
$VMName = "GENQCQAWIN"
$VMSize = "Standard_B2ms"

$NetworkName = "gen-qc-prod-vnet"
$NICName = "$VMNAME-nic"
$SubnetName = "qc-qa-app-subnet"

$getVnetRg = Get-AzResourceGroup -Name $ResourceGroupName -ErrorAction SilentlyContinue
$Vnet = Get-AzVirtualNetwork -Name $NetworkName -ResourceGroupName $getVnetRg.ResourceGroupName -ErrorAction SilentlyContinue
$getSubnet = Get-AzVirtualNetworkSubnetConfig -Name $SubnetName -VirtualNetwork $Vnet
$NIC = New-AzNetworkInterface -Name $NICName -ResourceGroupName $ResourceGroupName -Location $LocationName -SubnetId $getSubnet.Id

$Credential = New-Object System.Management.Automation.PSCredential ($VMLocalAdminUser, $VMLocalAdminSecurePassword);

$VirtualMachine = New-AzVMConfig -VMName $VMName -VMSize $VMSize
$VirtualMachine = Set-AzVMOperatingSystem -VM $VirtualMachine -Windows -ComputerName $ComputerName -Credential $Credential -ProvisionVMAgent -EnableAutoUpdate
$VirtualMachine = Add-AzVMNetworkInterface -VM $VirtualMachine -Id $NIC.Id
$VirtualMachine = Set-AzVMSourceImage -VM $VirtualMachine -PublisherName 'MicrosoftWindowsDesktop' -Offer 'windows-11' -Skus 'win11-24h2-ent' -Version latest

New-AzVM -ResourceGroupName $ResourceGroupName -Location $LocationName -VM $VirtualMachine | Out-Null
