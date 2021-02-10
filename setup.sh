#! /bin/bash

# Make sure docker and minikube are running before executing this script
minikube start --vm-driver=hyperkit

# set the correct IP the source files
LC_ALL=C find ./srcs -type d \( -path ./srcs/phpmyadmin/srcs/phpmyadmin -o -path ./srcs/wordpress/srcs/wp \) -prune -false -o -type f -exec sed -i "" "s|$(cat srcs/last_saved_minikube_ip.txt)|$(minikube ip)|g" {} +

# configure your macbook’s docker cli to connect to your minikube’s docker daemon
eval $(minikube -p minikube docker-env)

# build the container images with Docker
docker build ./srcs/nginx -t nginx_img
docker build ./srcs/mysql -t mysql_img
docker build ./srcs/phpmyadmin -t pma_img
docker build ./srcs/wordpress -t wp_img
docker build ./srcs/ftps -t ftps_img
docker build ./srcs/influxdb -t influx_img
docker build ./srcs/grafana -t grafana_img

# set up metalLB
minikube addons enable metallb
kubectl apply -f ./srcs/metallbConfig.yaml

# create the rest of the deployments and services
kubectl apply -f ./srcs/nginx/nginx.yaml
kubectl apply -f ./srcs/mysql/mysql.yaml
kubectl apply -f ./srcs/phpmyadmin/pma.yaml
kubectl apply -f ./srcs/wordpress/wp.yaml
kubectl apply -f ./srcs/influxdb/influx.yaml
kubectl apply -f ./srcs/grafana/grafana.yaml
kubectl apply -f ./srcs/ftps/ftps.yaml

# open the minikuke dashboard
minikube dashboard
