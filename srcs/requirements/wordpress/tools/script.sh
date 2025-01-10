#!/bin/bash

cd /var/www/html

if [ -f wp-config.php ]; then
    rm wp-config.php
fi

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOSTNAME --allow-root
./wp-cli.phar core install --url=$DOMAIN_NAME --title=Inception --admin_user=gomes --admin_password=$MYSQL_ROOT_PASSWORD --admin_email=admin@admin.com --allow-root
./wp-cli.phar user create $MYSQL_USER leugim@gmail.com --role='subscriber' --user_pass=$MYSQL_PASSWORD --allow-root

php-fpm7.4 -F
