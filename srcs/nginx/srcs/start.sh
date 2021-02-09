#! /bin/sh

# make some keys for the SSH daemon to play with (otherwise it won't start) and start it
ssh-keygen -A
/usr/sbin/sshd

# create a user to connect to with SSH
adduser -D magali
echo magali:pass | chpasswd

# start Telegraf in the background with the appropriate configurations
telegraf --config telegraf.conf &

# start NGINX (`deamon off` keeps the process running)
nginx -g "daemon off;"
