#! /bin/sh

# start Telegraf with the appropriate configurations (in the background)
telegraf --config telegraf.conf &

# start php-fpm7 for processing php requests (in the background)
php-fpm7 &

# start NGINX (`deamon off` keeps the process running)
nginx -g "daemon off;"
