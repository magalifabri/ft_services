# ft_services - WORK IN PROGRESS
_Project of coding school 19 in Brussels (part of the 42 school network)_

## Instructions
- to install, run setup.sh
- to clean up, run `minikube stop` and `minikube delete`

### A few handy commands to interact with the cluster
- show all kubernetes objects: `kubectl get all`
- show details on an object: `kubectl describe <object name>`
- create/update an object with a .yaml file: `kubectl apply -f <path/to/yaml>`
- delete all the objects defined in a .yaml file: `kubectl delete -f <path/to/yaml>`
- open a terminal in a pod: `kubectl exec -it <full object name> -- bin/bash`
- check which pods have failed liveness probes: `kubectl describe pods | grep "^Name:\|Liveness probe failed"` (if no "Liveness probe failed" messages follow below the name of an image, it's healthy)

## Resources
- General
	- **[Kubernetes Tutorial for Beginners [FULL COURSE in 4 Hours]](https://www.youtube.com/watch?v=X48VuDVv0do) (watch & coding along until and including the Mongo demo project, to get started)**
	- [How to Run Locally Built Docker Images in Kubernetes](https://medium.com/swlh/how-to-run-locally-built-docker-images-in-kubernetes-b28fbc32cc1d)
	- [Accessing apps: How to access applications running within minikube # Using minikube tunnel](https://minikube.sigs.k8s.io/docs/handbook/accessing/#using-minikube-tunnel) (for use during development, before MetalLB has been set up to take on this job)
	- [Troubleshooting: Minikube is slow and unresponsive](https://stackoverflow.com/questions/56327843/minikube-is-slow-and-unresponsive)

- MetalLB
	- **[MetalLB Configuration in Minikube — To enable Kubernetes service of type “LoadBalancer”](https://medium.com/faun/metallb-configuration-in-minikube-to-enable-kubernetes-service-of-type-loadbalancer-9559739787df)**
	- [MetalLB (Network LoadBalancer ) & Minikube.](https://medium.com/@shoaib_masood/metallb-network-loadbalancer-minikube-335d846dfdbe)
	- [metallb.universe.tf: Installation](https://metallb.universe.tf/installation/)
	- [metallb.universe.tf: Configuration](https://metallb.universe.tf/configuration/)
	- [IP Address Sharing](https://metallb.universe.tf/usage/#ip-address-sharing) (colocate services on a single IP)

- MySQL
	- [MariaDB](https://wiki.alpinelinux.org/wiki/MariaDB)
	- [Troubleshooting: [HELP] Created a container from alpine, installed MariaDB. MariaDB won't start.](https://www.reddit.com/r/docker/comments/3ucc8y/help_created_a_container_from_alpine_installed/)
	- [Troubleshooting: Could not open mysql.plugin table. Some plugins may be not loaded](https://stackoverflow.com/questions/34198735/could-not-open-mysql-plugin-table-some-plugins-may-be-not-loaded)

- WordPress
	- [Editing wp-config.php](https://wordpress.org/support/article/editing-wp-config-php/#set-database-host)
	- [Debugging in WordPress](https://wordpress.org/support/article/debugging-in-wordpress/)
	- [Troubleshooting: NGINX downloads the index.php file](https://stackoverflow.com/questions/25591040/nginx-serves-php-files-as-downloads-instead-of-executing-them)
	- [Troubleshooting: Bad Gateway](https://medium.com/@armno/til-fixing-http-502-bad-gateway-error-nginx-wordpress-a591be919adf)

- phpMyAdmin
	- [Configuration](https://docs.phpmyadmin.net/en/latest/config.html)
	- [Troubleshooting: error mysqli::real_connect(): (HY000/2002): No such file or directory](https://stackoverflow.com/questions/29928109/getting-error-mysqlireal-connect-hy000-2002-no-such-file-or-directory-wh)

- NGINX
	- [Redirect HTTP to HTTPS in Nginx](https://linuxize.com/post/redirect-http-to-https-in-nginx/#:~:text=The%20preferred%20method%20to%20redirect,unpredictable%20behavior%20of%20the%20server.)
	- [Creating NGINX Rewrite Rules](https://www.nginx.com/blog/creating-nginx-rewrite-rules/)
	- [Beginner’s Guide](http://nginx.org/en/docs/beginners_guide.html)
	- [NGINX Reverse Proxy](https://docs.nginx.com/nginx/admin-guide/web-server/reverse-proxy/)

- FTPS
	- [How to install and configure VSFTPD](https://www.howtoforge.com/tutorial/how-to-install-and-configure-vsftpd/)
	- [VSFTPD.CONF](http://vsftpd.beasts.org/vsftpd_conf.html)
	- [Troubleshooting: "500 OOPS: priv_sock_get_cmd"](https://www.liquidweb.com/kb/error-500-oops-priv_sock_get_cmd-on-fedora-20-solved/)
	- [Troubleshooting: "Failed to retrieve directory listing"](https://serverfault.com/questions/555541/failed-to-retrieve-directory-listing-in-filezilla-connecting-to-vsftpd)
	- [Troubleshooting: Illegal PORT command](https://askubuntu.com/questions/358603/vsftpd-illegal-port-command)
	- [Configure VSFTPD with an SSL](https://www.liquidweb.com/kb/configure-vsftpd-ssl/)
	- [HOW TO : FTPS SERVER CONFIGURATION IN LINUX](https://www.linuxnix.com/ftps-server-configuration/)
	- [change root password using bash script](https://stackoverflow.com/questions/52211476/change-root-password-using-bash-script)

- Grafana
	- **& InfluxDB & Telegraf: [How to Install TIG Stack (Telegraf, InfluxDB, and Grafana) on Ubuntu 18.04 LTS](https://www.howtoforge.com/tutorial/how-to-install-tig-stack-telegraf-influxdb-and-grafana-on-ubuntu-1804/)**
	- [Provisioning Grafana](https://grafana.com/docs/grafana/latest/administration/provisioning/) (provisioning = providing premade dashboards and data sources)
	- [Provision dashboards and data sources](https://grafana.com/tutorials/provision-dashboards-and-data-sources/#1)
	- [Provisioning Grafana Datasources and Dashboards Automagically](https://blog.56k.cloud/provisioning-grafana-datasources-and-dashboards-automagically/)
	- [Troubleshooting: Plugin not found, no installed plugin with that id](https://community.grafana.com/t/plugin-not-found-no-installed-plugin-with-that-id/26646)

- InfluxDB
	- [Getting to know InfluxDB](https://oznetnerd.com/2017/06/11/getting-know-influxdb/) (viewing data in the database)

- Telegraf
	- [Configuring Telegraf](https://docs.influxdata.com/telegraf/v1.17/administration/configuration/)

- Persistent Volumes
	- [Example: Deploying WordPress and MySQL with Persistent Volumes](https://kubernetes.io/docs/tutorials/stateful-application/mysql-wordpress-persistent-volume/)
	- [How To Deploy InfluxDB / Telegraf / Grafana on K8s? # Mount a Data Volume](https://octoperf.com/blog/2019/09/19/kraken-kubernetes-influxdb-grafana-telegraf/#mount-a-data-volume)

- Liveness Probes
	- [Configure Liveness, Readiness and Startup Probes](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/)
	- [Multiple liveness probes in kuberenetes](https://stackoverflow.com/questions/49172671/multiple-liveness-probes-in-kuberenetes)
	- [Bash check if process is running or not on Linux / Unix](https://www.cyberciti.biz/faq/bash-check-if-process-is-running-or-notonlinuxunix/)

- Docker
	- [Docker Tip #18: Please Pin Your Docker Image Versions](https://nickjanetakis.com/blog/docker-tip-18-please-pin-your-docker-image-versions)

## STATE OF PROGRESSION

- √ Kubernetes web dashboard
- √ In case of a crash or stop of one of the two database containers, you will have to make shure the data persist.
- √? All your containers must restart in case of a crash or stop of one of its component parts.
	- FTPS:
		- vsftpd (foreground process)
		- telegraf (liveness probe)
	- Grafana:
		- grafana (foreground process)
		- telegraf (liveness probe)
	- InfluxDB:
		- telegraf (foreground process)
		- influxd (liveness probe)
	- MySQL:
		- telegraf (foreground process)
		- mysqld (liveness probe)
	- NGINX:
		- nginx (foreground process)
		- telegraf (liveness probe)
	- phpMyAdmin:
		- nginx (foreground process)
		- php-fpm (liveness probe)
		- telegraf (liveness probe)
	- WordPress:
		- nginx (foreground process)
		- php-fpm (liveness probe)
		- telegraf (liveness probe)

- √ NGINX:
	- √ Of type LoadBalancer
	- √ A container with an nginx server listening on ports 80 and 443.
	- √ Port 80 will be in http and should be a systematic redirection of type 301 to 443, which will be in https.
	- √ The page displayed does not matter as long as it is not an http error.
	- √ This container will allow access to a /wordpress route that makes a redirect 307 to IP:WPPORT.
	- √ It should also allow access to /phpmyadmin with a reverse proxy to IP:PMAPORT.
	- √ Telegraf
	- ~~You must be able to access the nginx container by logging into SSH.~~

- √ MySQL
	- √ Of type ClusterIP
	- √ Telegraf

- Wordpress:
	- √ Of type LoadBalancer
	- √ listening on port 5050
	- √ work with a MySQL database
	- √ Both services (wordpress & mysql) have to run in separate containers)
	- √ The WordPress website will have several users and an administrator
		- admin: R)kUxc1Kc%e2yEwRF5
		- user1: yXIw2ceh9z%)5)lu(SYKAK^a
		- user2: &xotFcVWxJJE109@j25h8di7
	- √ Wordpress needs its own nginx server
		- ? ssl?
	- √ The Load Balancer should be able to redirect directly to this service.
	- √ Telegraf

- phpMyAdmin:
	- √ Of type LoadBalancer
	- √ listening on port 5000
	- √ linked with the MySQL database
	- √ its own nginx server
		- ? ssl?
	- √ The Load Balancer should be able to redirect directly to this service.
	- √ Telegraf

- MetalLB (load balancer):
	- √? The Load Balancer which manages the external access of your services. It will be the only entry point to your cluster.
	- √ (so far) You must keep the ports associated with the service (IP:3000 for Grafana etc).
	- √ Load Balancer will have a single ip

- FTPS:
	- √ Of type LoadBalancer
	- √ ssl
	- √ can log in with FileZilla (un: root & pw: pass)
	- √ Telegraf
	- ??? improve configuration in respect to security?
	
- √ InfluxDB:
	- √ Of type ClusterIP
	- √ Telegraf

- √ Grafana:
	- √ Of type LoadBalancer
	- √ listening on port 3000
	- √ Telegraf
	- √ dashboards for each container
	- √ automated datasource & dashboard creation
