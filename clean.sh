#! /bin/bash

# A script that will clean up everything created with setup.sh

kubectl delete -f ./nginx/nginx.yaml \
&& echo 'waiting 5 seconds for things to terminate in minikube before removing the docker image' \
&& sleep 5 \
&& docker image rm nginx_img
