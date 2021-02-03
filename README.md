# ft_services - WORK IN PROGRESS
_Project of coding school 19 in Brussels (part of the 42 school network)_

## Resources
- [Kubernetes Tutorial for Beginners [FULL COURSE in 4 Hours]](https://www.youtube.com/watch?v=X48VuDVv0do)

- [How to Run Locally Built Docker Images in Kubernetes](https://medium.com/swlh/how-to-run-locally-built-docker-images-in-kubernetes-b28fbc32cc1d)
- [Accessing apps: How to access applications running within minikube # Using minikube tunnel](https://minikube.sigs.k8s.io/docs/handbook/accessing/#using-minikube-tunnel)

- MetalLB
	- [MetalLB (Network LoadBalancer ) & Minikube.](https://medium.com/@shoaib_masood/metallb-network-loadbalancer-minikube-335d846dfdbe)
	- [MetalLB Configuration in Minikube — To enable Kubernetes service of type “LoadBalancer”](https://medium.com/faun/metallb-configuration-in-minikube-to-enable-kubernetes-service-of-type-loadbalancer-9559739787df)
	- [metallb.universe.tf: Installation](https://metallb.universe.tf/installation/)
	- [metallb.universe.tf: Configuration](https://metallb.universe.tf/configuration/)
	- [IP Address Sharing](https://metallb.universe.tf/usage/#ip-address-sharing)

- MySQL
	- [MariaDB](https://wiki.alpinelinux.org/wiki/MariaDB)
	- [installing MySQL on Alpine](https://wiki.alpinelinux.org/wiki/Mysql)
	- [[HELP] Created a container from alpine, installed MariaDB. MariaDB won't start.](https://www.reddit.com/r/docker/comments/3ucc8y/help_created_a_container_from_alpine_installed/)
	- [Could not open mysql.plugin table. Some plugins may be not loaded](https://stackoverflow.com/questions/34198735/could-not-open-mysql-plugin-table-some-plugins-may-be-not-loaded)

- WordPress
	- [Editing wp-config.php](https://wordpress.org/support/article/editing-wp-config-php/#set-database-host)
	- [Debugging in WordPress](https://wordpress.org/support/article/debugging-in-wordpress/)

- phpMyAdmin
	- [error mysqli::real_connect(): (HY000/2002): No such file or directory](https://stackoverflow.com/questions/29928109/getting-error-mysqlireal-connect-hy000-2002-no-such-file-or-directory-wh)
	- [Configuration](https://docs.phpmyadmin.net/en/latest/config.html)

- NGINX
	- [Redirect HTTP to HTTPS in Nginx](https://linuxize.com/post/redirect-http-to-https-in-nginx/#:~:text=The%20preferred%20method%20to%20redirect,unpredictable%20behavior%20of%20the%20server.)
	- [Creating NGINX Rewrite Rules](https://www.nginx.com/blog/creating-nginx-rewrite-rules/)
	- [Beginner’s Guide](http://nginx.org/en/docs/beginners_guide.html)
	- [NGINX Reverse Proxy](https://docs.nginx.com/nginx/admin-guide/web-server/reverse-proxy/)

## STATE OF PROGRESSION
- nginx:
	- pod is running
	- both port 80 and 443 load in the browser
	- ssl seems to work
	- √ A container with an nginx server listening on ports 80 and 443.
	- √ Port 80 will be in http and should be a systematic redirection of type 301 to 443, which will be in https.
	- x The page displayed does not matter as long as it is not an http error.
	- √ This container will allow access to a /wordpress route that makes a redirect 307 to IP:WPPORT.
	- ~ It should also allow access to /phpmyadmin with a reverse proxy to IP:PMAPORT.
		- logging in via proxy gives 404

- mysql:
	- pod is running
	- mysql seems to be running

- wordpress:
	- pod is running
	- loads in the browser (depends on "php -S"; don't know if that's a good solution)
	- seems functional (need to verify database use with phpmyadmin once that is up and running)
	- √ listening on port 5050
	- √ work with a MySQL database
	- √ Both services (wordpress & mysql) have to run in separate containers)
	- x The WordPress website will have several users and an administrator
	- x Wordpress needs its own nginx server
	- √ The Load Balancer should be able to redirect directly to this service.

- phpmyadmin:
	- pod is running
	- loads in the browser (depends on "php -S"; don't know if that's a good solution)
	- seems functional
	- √ listening on port 5000
	- √ linked with the MySQL database
	- x its own nginx server
	- √ The Load Balancer should be able to redirect directly to this service.

- MetalLB (load balancer):
	- √? The Load Balancerwhich manages the external access of your services. It will be the only entry point to your cluster.
	- √ (so far) You must keep the ports associated with the service (IP:3000 for Grafana etc).
	- √ Load Balancer will have a single ip