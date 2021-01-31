#! /bin/bash

eval $(minikube -p minikube docker-env)

# build an image that has wordpress installed
docker build ./srcs/wordpress -t wp_img

# create a deployment and a service in minikube from the wordpress image
kubectl apply -f ./srcs/wordpress/wp.yaml 

# have minikube expose the service locally
# minikube service nginx-service