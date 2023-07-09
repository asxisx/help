# [Install Docker](https://docs.docker.com/engine/install/)

---

## [Install Docker on Ubuntu](https://docs.docker.com/engine/install/ubuntu/)

Run the following command to uninstall all conflicting packages:
```
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done
```

#### Types

##### Install using apt repository

1. Update the `apt` package index and install packages to allow `apt` to use a repository over HTTPS:
```
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
```

2. Add Docker’s official GPG key:
```
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
```

3. Use the following command to set up the repository:
```
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

4. Update the apt package index:
```
sudo apt-get update
```

5. Install Docker Engine, containerd, and Docker Compose.
```
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

6. Verify that the Docker Engine installation is successful by running the hello-world image.
```
sudo docker run hello-world
```

##### Install using the convenience script

```
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo sh get-docker.sh # --dry-run
```

---

### Update Docker

1. Go to `https://download.docker.com/linux/ubuntu/dists/.`
2. Select your Ubuntu version in the list.
3. Go to `pool/stable/` and select the applicable architecture (amd64, armhf, arm64, or s390x).
4. Download the following deb files for the Docker Engine, CLI, containerd, and Docker Compose packages:
```
containerd.io_<version>_<arch>.deb
docker-ce_<version>_<arch>.deb
docker-ce-cli_<version>_<arch>.deb
docker-buildx-plugin_<version>_<arch>.deb
docker-compose-plugin_<version>_<arch>.deb
```
5. Install the .deb packages. Update the paths in the following example to where you downloaded the Docker packages.
```
sudo dpkg -i ./containerd.io_<version>_<arch>.deb \
./docker-ce_<version>_<arch>.deb \
./docker-ce-cli_<version>_<arch>.deb \
./docker-buildx-plugin_<version>_<arch>.deb \
./docker-compose-plugin_<version>_<arch>.deb
```
6. Verify that the Docker Engine installation is successful by running the hello-world image.
```
sudo service docker start
sudo docker run hello-world
```

