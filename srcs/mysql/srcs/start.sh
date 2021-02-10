#! /bin/sh

# "initializes the MySQL data directory and creates the system tables that it contains" - https://dev.mysql.com/doc/refman/5.6/en/mysql-install-db.html
mysql_install_db

# start the MariaDB daemon
/usr/bin/mysqld_safe --datadir='./data'

# replace the current my.cnf file with my own, setting MySQL's port to 3306
mv my.cnf /etc/

# start MySQL in the background
mysqld -u root --datadir=/data &

# wait for MySQL to start up
sleep 5

# create the WordPress and phpMyAdmin databases and fill the phpMyAdmin database with the necessary tables
mysql < mysql_setup.sql

# keep a process running so the pod keeps running
# tail -f /dev/null

# start Telegraf in the background with the appropriate configurations
telegraf --config telegraf.conf
