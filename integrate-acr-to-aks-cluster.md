# [Integrate ACR to AKS Cluster ](https://learn.microsoft.com/en-us/azure/aks/cluster-container-registry-integration?tabs=azure-cli)


## To Attach

```Powershell
# Attach using acr-name
az aks update -n myAKSCluster -g myResourceGroup --attach-acr <acr-name>

# Attach using acr-resource-id
az aks update -n myAKSCluster -g myResourceGroup --attach-acr <acr-resource-id>
```

## To Import

```Powershell
az acr import  -n <acr-name> --source docker.io/library/nginx:latest --image nginx:v1
```

## To make image from ontainer in local

```Powershell
# To create image of a container
docker commit <container-id/name>
docker images
docker tag <container-id> <tag>
docker commit <container-id> <tag> # will create image with a tag at the same time.

# Push lcal image to Azure ACR
az login
az acr login --name <name-of-the-acr>
docker image tag <image-name> <ac-name>.azure.io/<location>:v1
docker push <image-name> <ac-name>.azure.io/<location>:v1
