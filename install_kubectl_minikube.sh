#! /bin/bash
#first, let's install needed things for startup, for example, docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
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

#add user to docker group
echo 'adding studentk8s to docker group'
sudo usermod -aG docker $USER && newgrp docker

#add additinal requirements
echo 'fixing error with start'
sudo chown -R $USER $HOME/.minikube; chmod -R u+wrx $HOME/.minikube

#additonally installing connectivity tools for running integraton tests in minikube
echo 'installing conntrack:'
sudo apt-get update -y && sudo apt-get install -y conntrack && conntrack --version

#starting minikube
minikube start

#installing kubectl, first define version
echo 'installing kubectl'
versionkubectl=v1.23.0
#dowloading kubectl
curl -LO https://dl.k8s.io/release/$versionkubectl/bin/linux/amd64/kubectl
#installing kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
