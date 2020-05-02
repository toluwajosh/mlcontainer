#!/bin/bash

# install docker
sudo apt-get update
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# add docker's official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key -y fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# isntall docker engine
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Verify that Docker engine is installed correctly by running the `hello-world` image
sudo docker run hello-world

# post-installation steps for Linux
sudo groupadd docker
sudo usermod -aG docker $USER

echo "Log out and log back in so that your group membership is re-evaluated."

