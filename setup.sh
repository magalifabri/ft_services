#! /bin/bash

# Make sure docker and minikube are running before executing this script
minikube start --vm-driver=hyperkit
# cause minikube to look for images locally
eval $(minikube -p minikube docker-env)

# build the container images with Docker
docker build ./srcs/nginx -t nginx_img
docker build ./srcs/wordpress -t wp_img
docker build ./srcs/mysql -t mysql_img
docker build ./srcs/phpmyadmin -t pma_img

# set up metalLB
minikube addons enable metallb
kubectl apply -f ./srcs/metallbConfig.yaml

# create the rest of the deployments and services
kubectl apply -f ./srcs/nginx/nginx.yaml
kubectl apply -f ./srcs/wordpress/wp.yaml
kubectl apply -f ./srcs/mysql/mysql.yaml 
kubectl apply -f ./srcs/phpmyadmin/pma.yaml 

# view a specific service in the browser with the `minikube service <service name>` command or run `minikube tunnel` in a seperate shell window to access the external IPs given by MetalLB from the browser.