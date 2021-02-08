-- COPIED FROM FT_SERVER

-- create database for wordpress
CREATE DATABASE wordpress_db;

-- create user for wordpress
GRANT ALL PRIVILEGES ON wordpress_db.* TO 'user'@'%' IDENTIFIED BY 'pass';

-- create controluser for pma (required by pma) & grand privs in one breath 
-- (the 'phpmyadmin' database itself will be created with the create_tables.sql script)
GRANT ALL PRIVILEGES ON phpmyadmin.* TO 'user'@'%' IDENTIFIED BY 'pass';

-- run script that will create the phpmyadmin database and populate it with the required tables
\. create_tables.sql

-- run script that will put all the tables in place to create the WordPress site
\. wordpress_db.sql

exit