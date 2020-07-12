### kubectl Commands

- `kubectl version`: check if kubectl is installed. It prints the version of the client as well as the server.
- `kubectl cluster-info`: shows cluster details
- `kubectl get nodes`: view the nodes in the cluster. Shows all nodes that can be used to host our applications.
- `kubectl create deployment <name the deployment> <image address>`: create a Deployment that manages a Pod. The Pod runs a Container based on the provided Docker image. Example: `kubectl create deployment hello-node --image=k8s.gcr.io/echoserver:1.4`
- `kubectl apply -f <file name>.yaml`: Create pods with .yaml files
- `kubectl get deployments`: shows deployments with some details.
- `kubectl get pods`: shows pods with some details
- `kubectl get events`: view cluster events
- `kubectl config view`: view the kubectl configuration:
- `kubectl describe pods`: shows details about the Pod’s container: IP address, the ports used and a list of events related to the lifecycle of the Pod

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

### Minikube
Minikube is a lightweight Kubernetes implementation that creates a VM on your local machine and deploys a simple cluster containing only one node.

### minikube Commands
- `minikube version`: check that minikube is installed
- `minikube start`: start the cluster
- `minikube dashboard`: open the Kubernetes dashboard in a browser
- `minikube addons list`: list the currently supported addons
- `minikube addons enable <addon name>`: enables an addon
- `minikube addons disable <addon name>`: disables an addon





A Kubernetes Pod is a group of one or more Containers

A Kubernetes Deployment checks on the health of your Pod and restarts the Pod's Container if it terminates. Deployments are the recommended way to manage the creation and scaling of Pods.