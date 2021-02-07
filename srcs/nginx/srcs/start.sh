#! /bin/sh

# start Telegraf with the appropriate configurations (`&` causes the script to continue executing)
telegraf --config telegraf.conf &

# start NGINX (`deamon off` keeps the process running)
nginx -g "daemon off;"
