#!/bin/bash

# Step1: Start minikube, Make sure minikube exposes all port range, as it exposes port 30000-32767 by default.
echo "Starting minikube with full port range (Ports: 1-65535)"
minikube start --extra-config=apiserver.service-node-port-range=1-65535

# Step2: Start minikube tunnel, the Proxy Service for Minikube, without this the loadbalancer external IP will be shown as pending
# echo "Starting minikube tunnel, required for load blancer to work"
minikube tunnel
