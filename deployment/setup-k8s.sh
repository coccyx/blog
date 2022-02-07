#!/bin/bash

sudo snap install microk8s --classic --channel=1.21
sudo snap alias microk8s.kubectl kubectl
microk8s enable dns
microk8s add-node
microk8s enable metallb:192.168.68.20-192.168.68.39
