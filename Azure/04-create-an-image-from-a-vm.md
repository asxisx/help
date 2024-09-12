# Create an Image of a VM in Microsoft Azure [Linux]

1. Remove everything sensitive or anything that doesn't need to be a part of image.
2. For Linux, run `sudo waagent -deprovision+user`
3. From Azure CLI, run the following command for the VM:
    ```bash
    az vm deallocate --subscription <id> -g MyResourceGroup -n MyVm
    # Optional
    az vm generalize --subscription <id >-g MyResourceGroup -n MyVm 
    ```
4. Now open the virtual machine on portal, and click on capture and proceed as required.
