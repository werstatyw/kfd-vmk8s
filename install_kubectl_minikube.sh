#! /bin/bash

#installing kubectl on your vm, a specific version
echo 'installing kubectl on your vm, a specific version'
curl -LO https://dl.k8s.io/release/v1.23.0/bin/linux/amd64/kubectl
#installing minikube
curl -Lo minikube https://storage.googleapis.com/minikube/releases/1.24/minikube-linux-amd64 \
  && chmod +x minikube
