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

- MySQL
	- [MariaDB](https://wiki.alpinelinux.org/wiki/MariaDB)
	- [installing MySQL on Alpine](https://wiki.alpinelinux.org/wiki/Mysql)
	- [[HELP] Created a container from alpine, installed MariaDB. MariaDB won't start.](https://www.reddit.com/r/docker/comments/3ucc8y/help_created_a_container_from_alpine_installed/)
	- [Could not open mysql.plugin table. Some plugins may be not loaded](https://stackoverflow.com/questions/34198735/could-not-open-mysql-plugin-table-some-plugins-may-be-not-loaded)

- WordPress
	- [Editing wp-config.php](https://wordpress.org/support/article/editing-wp-config-php/#set-database-host)
	- [Debugging in WordPress](https://wordpress.org/support/article/debugging-in-wordpress/)

## STATE OF PROGRESSION
- nginx:
	- pod is running
	- both port 80 and 443 load in the browser
	- ssl seems to work
- mysql:
	- pod is running
	- mysql seems to be running
- wordpress:
	- pod is running
	- loads in the browser (depends on "php -S"; don't know if that's a good solution)
	- seems functional (need to verify database use with phpmyadmin once that is up and running)
- phpmyadmin:
	- pod is running
	- loads in the browser (depends on "php -S"; don't know if that's a good solution)
	- can't log in yet: doesn't seem properly connected to the mysql database
