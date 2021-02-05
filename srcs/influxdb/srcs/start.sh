#! /bin/sh

# start InfluxDB ("& sleep 5" to regain cli prompt)
influxd & sleep 5

# create database and user for Telegraf
echo "create database telegraf" | influx
echo "create user telegraf with password 'pass'" | influx

# put the telegraf.conf file where it'll find it
mkdir etc/telegraf
mv telegraf.conf etc/telegraf
# cp etc/telegraf.conf etc/telegraf/

# start telegraf
telegraf

tail -f /dev/null
# mv etc/telegraf/telegraf.conf etc/telegraf/telegraf.conf.default


# grafana-server -config /usr/share/grafana/conf/defaults.ini -homepath /usr/share/grafana/