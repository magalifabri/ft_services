#! /bin/sh

# start Telegraf in the background with the appropriate configurations
telegraf --config telegraf.conf &

# start NGINX (`deamon off` keeps the process running)
nginx -g "daemon off;"
