# Portable Machine Learning Environment with Docker, VSCode and Miniconda

# Steps

## Install Docker

Follow the steps in the [official website](https://docs.docker.com/engine/install/ubuntu/) for installing Docker.

## Build image from [`Dockerfile`](Dockerfile)

### Install the base system

### Install Miniconda (*Mini Anaconda*)

### Install Python libraries

    - Scikit-learn
    - Pytorch
    - TensorFlow

## Needed VSCode Extensions

- [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker) (`ms-azuretools.vscode-docker`): Makes it easy to create, manage, and debug containerized applications.
- [Remote-Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) (`ms-vscode-remote.remote-containers`): Open any folder inside (or mounted into) a container and take advantage of Visual Studio Code's full feature set.
- *[optional]* [Remote Development](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack) (`ms-vscode-remote.vscode-remote-extensionpack`): An extension pack that lets you open any folder in a container, on a remote machine, or in WSL and take advantage of VS Code's full feature set.
