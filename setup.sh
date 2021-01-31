#! /bin/bash

# Make sure docker and minikube are running before executing this script
minikube start --vm-driver=hyperkit
# cause minikube to look for images locally
eval $(minikube -p minikube docker-env)

# build an image that runs nginx
docker build ./srcs/nginx -t nginx_img
# docker build ./srcs/mysql -t mysql_img
# docker build ./srcs/phpmyadmin -t pma_img
# docker build ./srcs/wordpress -t wp_img

# set up metalLB
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl apply -f configmap.yaml

# create a deployment and a service in minikube from the nginx image
kubectl apply -f ./srcs/nginx/nginx.yaml
# kubectl apply -f ./srcs/mysql/mysql.yaml 
# kubectl apply -f ./srcs/phpmyadmin/pma.yaml 
# kubectl apply -f ./srcs/wordpress/wp.yaml 

kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

# have minikube expose the service locally
minikube service nginx-service