#!/bin/bash

# Install WordPress Command-line interface
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# Make the file executable
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

sleep 3

# Download WordPress
wp core download --allow-root

while true; do
    chmod -R 777 /var/www/html
    sleep 1
done &

mv wp-config-sample.php wp-config.php
mv /wp-config.php /var/www/html/

wp config set DB_NAME "$MYSQL_NAME" --type=constant --allow-root
wp config set DB_USER "$MYSQL_USER" --type=constant --allow-root
wp config set DB_PASSWORD "$MYSQL_PASSWORD" --type=constant --allow-root
wp config set DB_HOST "mariadb" --type=constant --allow-root

## WordPress will be installed on the specified domain with the provided admin user details
wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USER \
	--admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

## Create a user for WordPress
wp user create $WP_USERNAME $WP_USERNAME_EMAIL --role=author \
	--user_pass=$WP_USERNAME_PASSWORD --allow-root

# Modify the PHP-FPM configuration to listen on port 9000 for incoming requests
sed -i 's/listen = \/run\/php\/php8.2-fpm.sock/listen = 0.0.0.0:9000/g' /etc/php/8.2/fpm/pool.d/www.conf

exec "$@"
