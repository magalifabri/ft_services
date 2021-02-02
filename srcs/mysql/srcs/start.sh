#! /bin/sh

# "initializes the MySQL data directory and creates the system tables that it contains" - https://dev.mysql.com/doc/refman/5.6/en/mysql-install-db.html
mysql_install_db

# start the MariaDB daemon
/usr/bin/mysqld_safe --datadir='./data'

# replace the current my.cnf file with my own, setting MySQL's port to 3306
mv my.cnf /etc/

# start mysql
mysqld -u root --datadir=/data & sleep 5

# create some stuff in the mysql database
mysql < mysql_setup.sql

# keep a process running so the pod keeps running
tail -f /dev/null