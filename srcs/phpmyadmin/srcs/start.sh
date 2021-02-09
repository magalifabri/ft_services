#! /bin/sh

# start Telegraf in the background with the appropriate configurations
telegraf --config telegraf.conf &

# start php-fpm7 for processing php requests (in the background)
php-fpm7 &

# start NGINX (`deamon off` keeps the process running)
nginx -g "daemon off;"

# start PHP web server with the document root specified by -t
# php -S 0.0.0.0:5000 -t /usr/share/webapps/phpmyadmin/
