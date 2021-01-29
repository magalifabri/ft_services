#! /bin/bash

# Make sure docker and minikube are running before executing this script

# cause minikube to look for images locally
eval $(minikube -p minikube docker-env)

# build an image that runs nginx
docker build ./nginx -t nginx_img

# create a deployment and a service in minikube from the nginx image
kubectl create -f ./nginx/nginx.yaml

# have minikube expose the service locally
minikube service nginx-service