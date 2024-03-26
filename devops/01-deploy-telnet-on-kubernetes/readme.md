This project intends to deploy a telnet pod to a kubernetes cluster.
This pod will help check the connectivity of any application inside our cluster and help configure our networking accordingly.

## Implementation

- Run [Dockerfile](https://github.com/asxisx/help/blob/main/devops/01-deploy-telnet-on-kubernetes/Dockerfile) with the following command: `docker build -t <image-name> .`
- Now run the following command to run the docker image to test if telnet is successfully installed : `docker run -it --rm <image-name> bash`
- Once you've checked the image is working fine, push it to any **_acr (Azure)_**/**_ecr (AWS)_**.
- Once image is pushed, run the [telnet.yml](https://github.com/asxisx/help/blob/main/devops/01-deploy-telnet-on-kubernetes/telnet.yml) by doing `kubectl apply -f telnet.yml`
