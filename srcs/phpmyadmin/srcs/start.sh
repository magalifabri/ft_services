#! /bin/sh

# start Telegraf in the background with the appropriate configurations
telegraf --config telegraf.conf &

# start PHP web server with the document root specified by -t
php -S 0.0.0.0:5000 -t /usr/share/webapps/phpmyadmin/
