#!/bin/bash

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

if [ ! -f "/var/www/html/wp-config.php" ]; then
    wp core download --allow-root
    #create wp-config.php
    wp config create --allow-root --dbname=$DB_NAME --dbuser=$DB_USER  --dbpass=$DB_PASS --dbhost=mariadb 
    #install wordpress
    wp core install --allow-root --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL --skip-email
    #create a new user
    wp user create --allow-root $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASS  
fi
#Modify the PHP-FPM configuration
sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf
#!
# Create the directory /run/php if it doesn't already exist
mkdir /run/php
# Start the PHP-FPM service
php-fpm7.4 -F 