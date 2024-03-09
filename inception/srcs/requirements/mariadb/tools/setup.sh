#!/bin/bash

service mariadb start;
mariadb -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
mariadb -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';"
mariadb -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';"
mariadb -e "FLUSH PRIVILEGES;"
service mariadb stop;
sed -i "s/bind-address            = 127.0.0.1/bind_address = 0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf
mysqld_safe