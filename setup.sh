#! /bin/bash

# This script launches a multi-service cluster in minikube.
# Docker needs to be running, and minikube, kubectl and hyperkit need to be installed.
# For install instructions, refer to https://www.youtube.com/watch?v=X48VuDVv0do

# define colour variables to use with the printf command
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
RESET="\033[0m"

# clean up before starting
printf "${YELLOW}❖ Cleaning up current minikube cluster\n${RESET}"
minikube stop
minikube delete

# start minikube
printf "${YELLOW}❖ Starting minikube\n${RESET}"
minikube start --vm-driver=hyperkit --cpus=4 --memory=4400 --disk-size=40000mb 

# set the correct IP address in the source files
printf "${YELLOW}❖ Setting IP address in source files\n${RESET}"
LC_ALL=C find ./srcs -type d \( -path ./srcs/phpmyadmin/srcs/phpmyadmin -o -path ./srcs/wordpress/srcs/wp \) -prune -false -o -type f -exec sed -i "" "s|$(cat srcs/last_saved_minikube_ip.txt)|$(minikube ip)|g" {} +

# configure the docker cli to connect to the minikube’s docker daemon
printf "${YELLOW}❖ Configuring docker cli\n${RESET}"
eval $(minikube -p minikube docker-env)

# function to check if a docker image has been successfully created
f_check_img() {
    if [[ $(docker image ls | grep $1) ]]
    then
        printf "${GREEN}❖ - $1 created\n${RESET}"
    else
        printf "${RED}❖ - failed to create $1; exiting\n${RESET}"
        exit 1
    fi
}

# create the container images
printf "${YELLOW}❖ Creating container images\n${RESET}"
docker build ./srcs/nginx -t nginx_img > /dev/null 2>&1
f_check_img nginx_img
docker build ./srcs/mysql -t mysql_img > /dev/null 2>&1
f_check_img mysql_img
docker build ./srcs/phpmyadmin -t pma_img > /dev/null 2>&1
f_check_img pma_img
docker build ./srcs/wordpress -t wp_img > /dev/null 2>&1
f_check_img wp_img
docker build ./srcs/ftps -t ftps_img > /dev/null 2>&1
f_check_img ftps_img
docker build ./srcs/influxdb -t influx_img > /dev/null 2>&1
f_check_img influx_img
docker build ./srcs/grafana -t grafana_img > /dev/null 2>&1
f_check_img grafana_img
printf "${GREEN}❖ All images successfully created\n${RESET}"

# enable MetalLB addon
printf "${YELLOW}❖ Enabling MetalLB addon\n${RESET}"
minikube addons enable metallb

# create the kubernetes objects
printf "${YELLOW}❖ Creating kubernetes objects\n${RESET}"
kubectl apply -f ./srcs/metallbConfig.yaml > /dev/null 2>&1
kubectl apply -f ./srcs/nginx/nginx.yaml > /dev/null 2>&1
kubectl apply -f ./srcs/mysql/mysql.yaml > /dev/null 2>&1
kubectl apply -f ./srcs/phpmyadmin/pma.yaml > /dev/null 2>&1
kubectl apply -f ./srcs/wordpress/wp.yaml > /dev/null 2>&1
kubectl apply -f ./srcs/influxdb/influx.yaml > /dev/null 2>&1
kubectl apply -f ./srcs/grafana/grafana.yaml > /dev/null 2>&1
kubectl apply -f ./srcs/ftps/ftps.yaml > /dev/null 2>&1

# open the minikuke dashboard
printf "${YELLOW}❖ Opening minikube Dashboard\n${RESET}"
minikube dashboard
