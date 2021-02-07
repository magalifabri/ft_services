#! /bin/sh

# start InfluxDB in the background
influxd &

# wait for it to start up before continuing
sleep 5

# create a user and databases for Telegraf's input on the services
echo "create user user with password 'pass'" | influx
echo "create database influx_metrics_db" | influx
echo "create database nginx_metrics_db" | influx
echo "create database phpmyadmin_metrics_db" | influx
echo "create database wordpress_metrics_db" | influx
echo "create database mysql_metrics_db" | influx
echo "create database ftps_metrics_db" | influx
echo "create database grafana_metrics_db" | influx

# start Telegraf with the appropriate configutations
telegraf --config telegraf.conf
