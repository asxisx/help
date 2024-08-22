# [Azure Private Link](https://learn.microsoft.com/en-us/azure/private-link/private-link-overview)

> **Just as the name suggests, it's private link to some selected azure resources from within a virtual network by some other resources in Azure.**

Azure Private Link enables you to access Azure PaaS Services (for example, Azure Storage and SQL Database) and Azure hosted customer-owned/partner services over a 
[private endpoint](https://learn.microsoft.com/en-us/azure/private-link/private-endpoint-overview) in your virtual network.

Traffic between your virtual network and the service travels the Microsoft backbone network. Exposing your service to the public internet is no longer necessary. You can 
create your own [private link service](https://learn.microsoft.com/en-us/azure/private-link/private-link-service-overview) in your virtual network and deliver it to your 
customers. Setup and consumption using Azure Private Link is consistent across Azure PaaS, customer-owned, and shared partner services.


## [Let's understand usage of private endpoint, private link and private link service as an example](https://youtu.be/vVDql7IKneg)

## Private Endpoint

A company *XBC Logistics* have a website that uses Azure VM as a web server and stores data in azure storage blob.
Now we all know that storage accounts are publically accessible and that's bad for security.

We need a solution so that our storage account isn't exposed to the public IP and privately accessible.

In this case, we can utilize the private endpoint.

### How to implement private endpoint.

1. Go to Azure and search for Private Link.
2. Click on Private Link and then private endpoints.
3. Create one on the vnet as the VM so the machine could access it privately.
    -   Connection Method - Connect to an Azure resource in my directory.
    -   Subsciption
    -   Resource Type (Will show the options supported by Private Link) - Microsoft.Storage/StorageAccounts
    -   Resource - Select the storage account
    -   Target sub-resource - blob/file/table/queue/dfs
    -   Virtual Network - Select as same as VM
    -   Subnet - As per need
    -   Integrate with private DNS Zone - yes *(This will help resolve the storage account url to private ip.)*

**Now our blob will be accessible using a private IP and all the transfers and transactions will be made privately on Azure Backbone Network**

> **One thing before we end, can you guess what resources are created on the background to make it all possible?**

    Whenever we create a private endpoint using Private Link, a NIC (Network Interface Card) and a private endpoint is created (in our case above, a private dns as well.)
    This NIC is responsible for giving that particular azure resource a private IP

---

## Private Link Services

Now *XBC Logistics* has acquired *Logiexpress*, and both are on Azure, but, there's an issue now. `logiexpress.com` is a website that is accessible on the internet and now XBC don't want that, they want to make it private. So once we remove the load balancer/public ip in front of `logiexpress.com`, nobody could access it.

Incidently, VNET Peering between both vnet is not possible as well due to overlapping IP addresses. Now how can we have all XBC users resolve the `logiexpress.com` privately.

**Voila, we can use Private Link Service.**

For this, we need to:

1. Create a private Load Balancer (Standard) on **logiexpress ** Web Server subnet.
2. We will then create a Private Link Service over Load Balancer on **logiexpress** subscription.
    2.1 We can limit the exposure of the service via RBAC, Subcriptions & Anyone with alias.
3. Now we'll create private endpoint on **XBC Logistics** subscription (same vnet as above).
    Using this endpoint we will connect with this Private link service and we'll be able to open that website easily from XBC as well.

And, all this is actually happening on the Azure Backbone Network, no public internet.

### [Check How to Implement this](https://youtu.be/vVDql7IKneg?t=455)

> **One thing before we end, can you guess what resources are created on the background to make it all possible?**

    In **Logiexpress** subscription, we've simply created an Internal Load Balancer and Private Link Service. That private link service will uniquely
    create an id (alias) for the Load Balancer to expose it, to whomever we want.
    So I'll be *restricting the exposure by subscription* meaning, i'll provide the subscription id of tenant where it needed to be consumed, in our case,
    XBC Logistics subscription.

    Now in XBC Logistics subscription, when we create a private endpoint a NIC will be created as well. Now that NIC will be attached to that Load Balancer
