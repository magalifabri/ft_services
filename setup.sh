#! /bin/bash

# Make sure docker and minikube are running before executing this script

# cause minikube to look for images locally
eval $(minikube -p minikube docker-env)

# build an image that runs nginx
docker build ./srcs/nginx -t nginx_img
# docker build ./srcs/mysql -t mysql_img
# docker build ./srcs/phpmyadmin -t pma_img
# docker build ./srcs/wordpress -t wp_img

# create a deployment and a service in minikube from the nginx image
kubectl apply -f ./srcs/nginx/nginx.yaml
# kubectl apply -f ./srcs/mysql/mysql.yaml 
# kubectl apply -f ./srcs/phpmyadmin/pma.yaml 
# kubectl apply -f ./srcs/wordpress/wp.yaml 

# have minikube expose the service locally
minikube service nginx-service