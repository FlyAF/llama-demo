# llama-demo

## Below are bash cmds 

``` bash

ssh -i "your-pem-file" -L 5173:localhost:5173 ubuntu@e<SERVER_ADDRESS>.compute.amazonaws.com


chmod 400 <KEY>.pem
```
## Machine commands

### Updates
``` bash
sudo apt update && sudo apt upgrade -y
```
### NVIDIA Driver
``` bash
sudo apt install -y nvidia-driver-510
```

### Latest CUDA
``` bash
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb
sudo apt-get update
sudo apt-get -y install cuda
```

### Setup Docker

> Uninstall conflicts

`for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done`

> Setup Docker's apt repo: 
``` bash
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```

> Install & verify

``` bash
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo docker run hello-world
```

### Install NVIDIA Container toolkit


> Installing with Apt
- Configure the repository:
``` bash
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
  && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list \
  && \
    sudo apt-get update
```
- Install the NVIDIA Container Toolkit packages:

``` bash
sudo apt-get install -y nvidia-container-toolkit 
```

### Run TGI (Text Generation Interface)

> Start server

``` bash
make start
```


> Execute

``` bash
make run-tgi
```
### Run ChatUI

> Start server

``` bash
git clone https://github.com/huggingface/chat-ui.git
```

> Start MongoDB

``` bash
docker run -d -p 27017:27017 --name mongo-chatui mongo:latest
```
> Install nvm 

``` bash
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.39.1/install.sh | bash
```

> Install node 

``` bash
nvm install node
```

> Install npm 

``` bash
sudo apt install npm
```

> Run `dev`

``` bash
npm install
npm run dev
```
