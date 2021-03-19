# ft_services - WORK IN PROGRESS
_Project of coding school 19 in Brussels (part of the 42 school network)_

---

## Description

*'Ft_services will introduce you to Kubernetes. You will discover cluster management and deployment with Kubernetes. You will virtualize a network and do "clustering".'* - en.subject.pdf

---

It's good to split up your (macro?) service into micro services, because of reasons. So instead of installing your WordPress, NGINX, phpMyAdmin, MySQL, etc. all in one container, you give them their own seperate containers. This cluster of containers is what Kubernetes helps you manage. 

The following services are contained in the cluster for this project:

**LEMP Stack (Linux, NGINX, MySQL & phpMyAdmin):**
- **NGINX** is our web server. It forms the primary front-end of the ft_services project, receiving traffic requests on the default ports: 80 and 443. It also redirects to the WordPress and phpMyAdmin sites.
- **MySQL** provides the databases for the WordPress and phpMyAdmin sites.
- **phpMyAdmin** is an administration tool for the MySQL database. It's hosted on NGINX in it's own container.
- (The "L" part of the LEMP stack is in the Alpine Linux OS that the containers run on.)

**WordPress** is perched on top of the LEMP stack: hosted on NGINX, connected to the MySQL database, and supported by phpMyAdmin. It directly installed with an admin and two users.

**TIG Stack (Telegraf, InfluxDB & Grafana):**
- **Telegraf** is installed in every container in the cluster and sends metrics (usage of CPU, memory and the like) on each container to InfluxDB.
- **InfluxDB** contains a database for each container in which it stores the data it receives from Telegraf.
- **Grafana** fetches the data on all our containers from InfluxDB and let's us visualize it in fancy tables, graphs, etc. on a web GUI. 

**FTPS** stands for something like *"File Transfer Protocol - Secure"*. Setting up the FTPS server in our cluster allows us to connect to it from outside the cluster (with e.g. a FileZilla client) to transfer files to and from the server.

---

## Instructions
- to install, run setup.sh (minikube, kubectl and hyperkit need to be installed)

- when the installation has finished, the kubernetes dashboard will automatically open in the browser, informing us on how all the parts of the cluster are doing and providing links to services with a web-hosted front-end
- to clean up, first run the command `minikube stop` and then `minikube delete`

### Login Credentials
- WordPress:
	- admin / R)kUxc1Kc%e2yEwRF5
	- user1 / yXIw2ceh9z%)5)lu(SYKAK^a
	- user2 / &xotFcVWxJJE109@j25h8di7
- PhpMyAdmin: user / pass
- Grafana: admin / admin
- FTPS: root / pass

### A few handy commands to interact with the cluster from the CLI
- start minikube: `minikube start`
- show all kubernetes objects: `kubectl get all`
- show all kubernetes objects of one type: `kubectl get <po (pods) / svc (services) / deploy (deployments) / pv(c) (persistent volumes (claims))>`
- show details on an object: `kubectl describe <object name>`
- create/update the objects defined in a .yaml file: `kubectl apply -f <path/to/yaml>`
- delete the objects defined in a .yaml file: `kubectl delete -f <path/to/yaml>`
- open a terminal in a pod: `kubectl exec -it <full pod name> -- bin/sh`
	- to more easily switch between different objects without all the copy/pasting, use `kubectl exec -it  $(kubectl get pods | grep ^<first letter of the pod's name>) -- bin/sh`

---

## Resources

(Very usefull resources in bold.)

### Kubernetes & minikube
- **[Kubernetes Tutorial for Beginners [FULL COURSE in 4 Hours]](https://www.youtube.com/watch?v=X48VuDVv0do) (watch & code along until and including the Mongo demo project, to get started)**
- [How to Run Locally Built Docker Images in Kubernetes](https://medium.com/swlh/how-to-run-locally-built-docker-images-in-kubernetes-b28fbc32cc1d)
- [Accessing apps: How to access applications running within minikube # Using minikube tunnel](https://minikube.sigs.k8s.io/docs/handbook/accessing/#using-minikube-tunnel) (for use during development, before MetalLB has been set up to take on this job)
- [Troubleshooting: Minikube is slow and unresponsive](https://stackoverflow.com/questions/56327843/minikube-is-slow-and-unresponsive)

- Persistent Volumes
	- [Example: Deploying WordPress and MySQL with Persistent Volumes](https://kubernetes.io/docs/tutorials/stateful-application/mysql-wordpress-persistent-volume/)
	- [How To Deploy InfluxDB / Telegraf / Grafana on K8s? # Mount a Data Volume](https://octoperf.com/blog/2019/09/19/kraken-kubernetes-influxdb-grafana-telegraf/#mount-a-data-volume)

- Liveness Probes
	- [Configure Liveness, Readiness and Startup Probes](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/)
	- [Multiple liveness probes in kuberenetes](https://stackoverflow.com/questions/49172671/multiple-liveness-probes-in-kuberenetes)
	- [Bash check if process is running or not on Linux / Unix](https://www.cyberciti.biz/faq/bash-check-if-process-is-running-or-notonlinuxunix/)

### MetalLB
- **[MetalLB Configuration in Minikube — To enable Kubernetes service of type “LoadBalancer”](https://medium.com/faun/metallb-configuration-in-minikube-to-enable-kubernetes-service-of-type-loadbalancer-9559739787df)**
- [MetalLB (Network LoadBalancer ) & Minikube.](https://medium.com/@shoaib_masood/metallb-network-loadbalancer-minikube-335d846dfdbe)
- [metallb.universe.tf: Installation](https://metallb.universe.tf/installation/)
- [metallb.universe.tf: Configuration](https://metallb.universe.tf/configuration/)
- [IP Address Sharing](https://metallb.universe.tf/usage/#ip-address-sharing) (colocate services on a single IP)

### MySQL
- [MariaDB](https://wiki.alpinelinux.org/wiki/MariaDB)
- [Troubleshooting: [HELP] Created a container from alpine, installed MariaDB. MariaDB won't start.](https://www.reddit.com/r/docker/comments/3ucc8y/help_created_a_container_from_alpine_installed/)
- [Troubleshooting: Could not open mysql.plugin table. Some plugins may be not loaded](https://stackoverflow.com/questions/34198735/could-not-open-mysql-plugin-table-some-plugins-may-be-not-loaded)

### WordPress
- [Editing wp-config.php](https://wordpress.org/support/article/editing-wp-config-php/#set-database-host)
- [Debugging in WordPress](https://wordpress.org/support/article/debugging-in-wordpress/)
- [Troubleshooting: NGINX downloads the index.php file](https://stackoverflow.com/questions/25591040/nginx-serves-php-files-as-downloads-instead-of-executing-them)
- [Troubleshooting: Bad Gateway](https://medium.com/@armno/til-fixing-http-502-bad-gateway-error-nginx-wordpress-a591be919adf)
- [Troubleshooting: Publishing failed. You are probably offline.](https://wordpress.org/support/topic/publishing-failed-you-are-probably-offline/) (change the URL in Settings on WordPress)

### phpMyAdmin
- [Configuration](https://docs.phpmyadmin.net/en/latest/config.html)
- [Troubleshooting: error mysqli::real_connect(): (HY000/2002): No such file or directory](https://stackoverflow.com/questions/29928109/getting-error-mysqlireal-connect-hy000-2002-no-such-file-or-directory-wh)
- [Troubleshooting: Prevent Nginx to remove port number](https://serverfault.com/questions/542202/prevent-nginx-to-remove-port-number)

### NGINX
- [Redirect HTTP to HTTPS in Nginx](https://linuxize.com/post/redirect-http-to-https-in-nginx/#:~:text=The%20preferred%20method%20to%20redirect,unpredictable%20behavior%20of%20the%20server.)
- [Creating NGINX Rewrite Rules](https://www.nginx.com/blog/creating-nginx-rewrite-rules/)
- [Beginner’s Guide](http://nginx.org/en/docs/beginners_guide.html)
- [NGINX Reverse Proxy](https://docs.nginx.com/nginx/admin-guide/web-server/reverse-proxy/)

### FTPS
- [How to install and configure VSFTPD](https://www.howtoforge.com/tutorial/how-to-install-and-configure-vsftpd/)
- [VSFTPD.CONF](http://vsftpd.beasts.org/vsftpd_conf.html)
- [Troubleshooting: "500 OOPS: priv_sock_get_cmd"](https://www.liquidweb.com/kb/error-500-oops-priv_sock_get_cmd-on-fedora-20-solved/)
- [Troubleshooting: "Failed to retrieve directory listing"](https://serverfault.com/questions/555541/failed-to-retrieve-directory-listing-in-filezilla-connecting-to-vsftpd)
- [Troubleshooting: Illegal PORT command](https://askubuntu.com/questions/358603/vsftpd-illegal-port-command)
- [Configure VSFTPD with an SSL](https://www.liquidweb.com/kb/configure-vsftpd-ssl/)
- [change root password using bash script](https://stackoverflow.com/questions/52211476/change-root-password-using-bash-script)

### Grafana
- **& InfluxDB & Telegraf: [How to Install TIG Stack (Telegraf, InfluxDB, and Grafana) on Ubuntu 18.04 LTS](https://www.howtoforge.com/tutorial/how-to-install-tig-stack-telegraf-influxdb-and-grafana-on-ubuntu-1804/)**
- [Provisioning Grafana](https://grafana.com/docs/grafana/latest/administration/provisioning/) (provisioning = providing premade dashboards and data sources)
- [Provision dashboards and data sources](https://grafana.com/tutorials/provision-dashboards-and-data-sources/#1)
- [Provisioning Grafana Datasources and Dashboards Automagically](https://blog.56k.cloud/provisioning-grafana-datasources-and-dashboards-automagically/)
- [Troubleshooting: Plugin not found, no installed plugin with that id](https://community.grafana.com/t/plugin-not-found-no-installed-plugin-with-that-id/26646)

### InfluxDB
- [Getting to know InfluxDB](https://oznetnerd.com/2017/06/11/getting-know-influxdb/) (viewing data in the database)

### Telegraf
- [Configuring Telegraf](https://docs.influxdata.com/telegraf/v1.17/administration/configuration/)
