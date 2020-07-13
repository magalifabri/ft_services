# ft_services - WORK IN PROGRESS
_Project of coding school 19 in Brussels (part of the 42 school network)_

## Project Parts
1. write a Dockerfile for each service
2. write a .yaml files for each service with both a Service and Deployment Object
3. write a script to start a Kubernetes Cluster and execute the Dockerfiles and .yaml files
	- launch minikube

## Resources
Get a high level idea of what Kubernetes is and does:
- [**video: Kubernetes in 5 mins**](https://www.youtube.com/watch?v=PH-2FfFD2PU)
- [**article + videos: Kubernetes**](https://www.ibm.com/cloud/learn/kubernetes?cm_mmc=OSocial_Youtube-_-Cloud+and+Data+Platform_Cloud+Platform+Digital-_-WW_WW-_-YTDescription-101-Container-Orchestration-LH-Kubernetes-Complete-Guide&cm_mmca1=000023UA&cm_mmca2=10010608): high level overview of Kubernetes

	Direct links to contained videos:
	- [Container Orchestration Explained](https://www.youtube.com/watch?v=kBF6Bvth0zw&list=PLOspHqNVtKABAVX4azqPIu6UfsPzSu2YN&index=7)
	- [Kubernetes Explained](https://www.youtube.com/watch?v=aSrqRSk43lY&list=PLOspHqNVtKABAVX4azqPIu6UfsPzSu2YN)
	- [Kubernetes Deployments: Get Started Fast](https://www.youtube.com/watch?v=Sulw5ndbE88)
	- [Kubernetes vs. Docker: It's Not an Either/Or Question](https://www.youtube.com/watch?v=2vMEQ5zs1ko)

Get a good grip on the concepts of:
- [pods](https://kubernetes.io/docs/concepts/workloads/pods/pod/) ("What is a Pod?")
- [deployments](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/) ("Creating a Deployment")
- [services](https://kubernetes.io/docs/concepts/services-networking/service/) (up to "Services without selectors")


Play around with Kubernetes in a controlled environment
- [**interactive tutorial: Hello Minikube**](https://kubernetes.io/docs/tutorials/hello-minikube/)
- [**interactive tutorial: Learn Kubernetes Basics**](https://kubernetes.io/docs/tutorials/kubernetes-basics/) (Modules 1 through 4)
- [**more interactive tutorials on katacoda**](https://www.katacoda.com/courses/kubernetes),
	
	notably:
	- [Launch A Single Node Cluster](https://www.katacoda.com/courses/kubernetes/launch-single-node-cluster)
	- [Deploy Containers Using Kubectl](https://www.katacoda.com/courses/kubernetes/kubectl-run-containers)
	- [Deploy Containers Using YAML](https://www.katacoda.com/courses/kubernetes/creating-kubernetes-yaml-definitions)
	- [Deploy Guestbook Web App Example](https://www.katacoda.com/courses/kubernetes/guestbook)

Some more reading material to further cement the understanding important concepts and abstractions in Kubernetes:
- [**Understanding Kubernetes Objects**](https://kubernetes.io/docs/concepts/overview/working-with-objects/kubernetes-objects/): Basics of writing a .yaml file for a Kubernetes Object (e.g. Deployment or Service)
- [An Introduction to Kubernetes](https://www.digitalocean.com/community/tutorials/an-introduction-to-kubernetes)

Using Kubernetes in own environment.
(Lightweight alternative for shitty pc's: [Katacoda's Kubernetes Playground](https://www.katacoda.com/courses/kubernetes/playground#!))

- [Install Minikube](https://kubernetes.io/docs/tasks/tools/install-minikube/)
- [guide: Create and Deploy a Docker Container Image to a Kubernetes Cluster](https://www.linode.com/docs/kubernetes/deploy-container-image-to-kubernetes/)

## Additional Resources
- [API Overview](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.18/): extensive Kubernetes documentation
- [The Linux Foundation: Introduction to Kubernetes](https://training.linuxfoundation.org/training/introduction-to-kubernetes/): extensive course