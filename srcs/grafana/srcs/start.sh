#! /bin/sh

# start Telegraf in the background with the appropriate configurations
# telegraf --config telegraf.conf &

# start grafana
grafana-server -config /usr/share/grafana/conf/defaults.ini -homepath /usr/share/grafana/
