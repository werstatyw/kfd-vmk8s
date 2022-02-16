#! /bin/bash
#first, let's install needed things for startup, for example, docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
#add user to docker group
sudo usermod -aG docker studentk8s
#first let's check your linux version just in case:
echo 'your linux version is:'
uname --all
#then we will step on specific minikube version
version=v1.24.0
#downloading minikube on your vm, a specific version
echo 'dowloading minikube on your vm, a specific version:'
curl -LO https://storage.googleapis.com/minikube/releases/$version/minikube-linux-amd64
#installing minikube
echo 'installing minikube'
install minikube-linux-amd64 /usr/local/bin/minikube
#finally, we will check minikube version
echo 'your minikube version:'
minikube version