# [Service Endpoint](https://learn.microsoft.com/en-us/azure/virtual-network/virtual-network-service-endpoints-overview)

Service endpoints is a feature available to us from within **Virtual Network** and can be applied on each subnet.

Let's try to understand it with some use cases:

***Case 1 - Typical File Share Mount***

Let's say `VM1` wants to connect to a file share named `SHARE1` inside storage account `STORAGE1`, what we typically do, we run a script and mount it on our system and transfer data.
In this case, all transfers are happening over the public internet, which is not safe.

***Case 2 - File Share Mount with [Service Endpoint](https://blog.coeo.com/azure-service-endpoints) Enabled***

In this case, first, *we have enabled the service endpoint option in `SUBNET1`* where our `VM1` is, and then, we try to connect to `SHARE1` using the same method mentioned above.
Now we transferred the data, but what changed is, all the data transmission is happening over *the Azure Backbone Network*. We still are using public network to connect to file share,
but all data transfer is done on Azure Backbone Network, this is more secure than the above Case 1.

> To make this more secure, we can apply a setting in storage account to be accessible only from certain virtual network, and disable the public network.


---
