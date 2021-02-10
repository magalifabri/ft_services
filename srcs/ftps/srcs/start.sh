#! /bin/sh

# start Telegraf with the appropriate configurations (`&` causes the script to continue executing)
telegraf --config telegraf.conf &

# set password for root, for whatever reason this is required by FileZilla to connect to the server properly
echo root:pass | chpasswd

# start vsftpd with the appropriate configuration file
vsftpd etc/vsftpd/vsftpd.conf
