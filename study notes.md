### Minikube
Minikube is a lightweight Kubernetes implementation that creates a VM on your local machine and deploys a simple cluster containing only one node.

### minikube Commands
- `minikube version`: check that minikube is installed
- `minikube start`: start the cluster
- `minikube dashboard`: open the Kubernetes dashboard in a browser
- `minikube addons list`: list the currently supported addons
- `minikube addons enable <addon name>`: enables an addon
- `minikube addons disable <addon name>`: disables an addon

### kubectl Commands

Manipulating Objects
- `kubectl create -f <file>.yaml`: create a Kubernetes Object with a .yaml file
- `kubectl create deployment <name the deployment> <image address>`: create a Deployment that manages a Pod. The Pod runs a Container based on the provided Docker image. Example: `kubectl create deployment hello-node --image=k8s.gcr.io/echoserver:1.4`
- `kubectl apply -f <file name>.yaml`: apply updates to existing definitions
- `kubectl delete <object type: service / deployment / pod> <object name>`: delete the specified object, e.g. `kubectl delete deployment depl.yaml`

Requesting Info
- `kubectl version`: check if kubectl is installed. It prints the version of the client as well as the server.
- `kubectl get <object type: nodes / pods / deployments / services / rc>`: shows the specified object with some info
- `kubectl get events`: view cluster events
- `kubectl describe <object type: nodes / pods / deployments / services>`: shows more info about the specified objects
- `kubectl config view`: view the kubectl configuration:
- `kubectl cluster-info`: shows cluster details

### Containers, Pods & Nodes
When you create a Deployment, Kubernetes creates a Pod to host your application instance. 
A Pod is a group of one or more application containers (such as Docker or rkt) and includes shared storage (volumes), IP address and information about how to run them.

Containers should only be scheduled together in a single Pod if they are tightly coupled and need to share resources such as disk.

Pods that are running inside Kubernetes are running on a private, isolated network. By default they are visible from other pods and services within the same kubernetes cluster, but not outside that network. When we use kubectl, we're interacting through an API endpoint to communicate with our application.

A Pod always runs on a Node. A Node is a worker machine in Kubernetes and may be either a virtual or a physical machine, depending on the cluster. Each Node is managed by the Master. A Node can have multiple pods, and the Kubernetes master automatically handles scheduling the pods across the Nodes in the cluster.

### Services
Services are the abstraction that allow pods to die and replicate in Kubernetes without impacting your application. 
A Kubernetes Service defines a set of Pods (e.g. all the pods in your cluster that are running nginx) and enables external traffic exposure, load balancing and service discovery for those Pods.
A Service selects a set of Pods by their labels.
Labels are key/value pairs that are attached to objects, such as pods.

![node overview with labels](https://d33wubrfki0l68.cloudfront.net/b964c59cdc1979dd4e1904c25f43745564ef6bee/f3351/docs/tutorials/kubernetes-basics/public/images/module_04_labels.svg)

**Node Overview**
![node overview](https://d33wubrfki0l68.cloudfront.net/5cb72d407cbe2755e581b6de757e0d81760d5b86/a9df9/docs/tutorials/kubernetes-basics/public/images/module_03_nodes.svg)


A Kubernetes Pod is a group of one or more Containers

A Kubernetes Deployment checks on the health of your Pod and restarts the Pod's Container if it terminates. Deployments are the recommended way to manage the creation and scaling of Pods.


--------------------------

# Setting up Nginx on Alpine in a Docker container


---------------
√ Running nginx in a Docker container: `docker run --name docker-nginx -p 80:80 -d nginx`

Open a shell in it: `docker exec -it docker-nginx bash`

---------------
√ Running Alpine in a Docker container and opening a shell in it: `docker run -it --name docker-alpine -p 80:80 -d alpine && docker attach docker-alpine`

--------------
√ Write a Dockerfile that creates an image that builds a container that runs Alpine

vim Dockerfile
iFROM alpine:3.12.0

docker build -t docker-alpine-image .
docker run -it --name docker-alpine -p 80:80 -d docker-alpine-image
docker attach docker-alpine

exit 
docker start -i docker-alpine

-------------------
√ METHOD 1 FOR GETTING NGINX TO WORK ON ALPINE
- mkdir -p /run/nginx, otherwise you get pid issues
- replace /etc/nginx/nginx.conf
- add and index.html file to /var/www/localhost/htdocs


vim nginx.conf
ihttp {
	sendfile on;
	server {
	    listen 80 default_server;

	    root /var/www/localhost/htdocs;

	    index index.html index.htm index.nginx-debian.html index.php;
	}
}

events
{

}


```
vim index.html
i<html>
  <head>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet" integrity="sha256-MfvZlkHCEqatNoGiOXveE8FIwMzZg4W85qfrfIFBfYc= sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ==" crossorigin="anonymous">
    <title>Docker nginx Tutorial</title>
  </head>
  <body>
    <div class="container">
      <h1>Hello Digital Ocean</h1>
      <p>This nginx page is brought to you by Docker and Digital Ocean</p>
    </div>
  </body>
</html> 
```

vim Dockerfile
iFROM alpine:3.12.0

RUN apk update && apk add nginx vim

RUN mkdir -p /run/nginx

RUN rm /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/

COPY index.html /var/www/localhost/htdocs/

EXPOSE 80




docker build -t docker-alpine-image . && docker run -it --name docker-alpine -p 80:80 -d docker-alpine-image && docker attach docker-alpine

docker build -t docker-alpine-image .
docker run -it --name docker-alpine -p 80:80 -d docker-alpine-image
docker attach docker-alpine

exit 
docker start -i docker-alpine


-----------------------

√ METHOD 2 FOR GETTING NGINX TO WORK ON ALPINE (less intrusive)

vim Dockerfile
i
<insert Dockerfile>

vim default.conf
i
<insert default.conf>

vim index.html
i
<insert index.html>

docker build -t alpine-img . && docker run -it --name alpine -p 80:80 -d alpine-img

docker attach alpine
