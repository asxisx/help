# [How to create an internal load balancer with Azure Kubernetes Service (AKS)](https://learn.microsoft.com/en-us/azure/aks/internal-lb)
---

## Sample YAML 1:

```yaml
apiVersion: v1
kind: Service
metadata:
  name: internal-app
  annotations:
    service.beta.kubernetes.io/azure-load-balancer-internal: "true"
spec:
  type: LoadBalancer
  ports:
  - port: 80
  selector:
    app: internal-app
```
---

## [Sample YAML 2 (Specify the IP Address)](https://learn.microsoft.com/en-us/azure/aks/internal-lb#specify-an-ip-address):
- Set service annotations: Use `service.beta.kubernetes.io/azure-load-balancer-ipv4` for an IPv4 address and `service.beta.kubernetes.io/azure-load-balancer-ipv6` for an IPv6 address.

```yaml
apiVersion: v1
kind: Service
metadata:
  name: internal-app
  annotations:
    service.beta.kubernetes.io/azure-load-balancer-ipv4: 10.240.0.25
    service.beta.kubernetes.io/azure-load-balancer-internal: "true"
spec:
  type: LoadBalancer
  ports:
  - port: 80
  selector:
    app: internal-app
```
---
## [Sample YAML 3 (Specify a different subnet)](https://learn.microsoft.com/en-us/azure/aks/internal-lb#specify-a-different-subnet):
- Add the azure-load-balancer-internal-subnet annotation to your service to specify a subnet for your load balancer. The subnet specified must be in the same virtual network as your AKS cluster. When deployed, the load balancer EXTERNAL-IP address is part of the specified subnet.
```yaml
apiVersion: v1
kind: Service
metadata:
  name: internal-app
  annotations:
    service.beta.kubernetes.io/azure-load-balancer-internal: "true"
    service.beta.kubernetes.io/azure-load-balancer-internal-subnet: "apps-subnet"
spec:
  type: LoadBalancer
  ports:
  - port: 80
  selector:
    app: internal-app
``` 
