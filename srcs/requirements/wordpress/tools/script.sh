#!/bin/bash

mkdir -p /var/www
mkdir -p /var/www/html
cd /var/www/html

# Install WordPress Command-line interface
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# Make the file executable
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

if [-f /var/www/html/wp-config.php ]; then
	echo "WordPress file already exists"
else
	# Download WordPress
	wp core download --allow-root

	mv wp-config-sample.php wp-config.php
	mv /wp-config.php /var/www/html/

	sed -i -r "s/database_name_here/$MYSQL_DATABASE/1" wp-config.php
    sed -i -r "s/username_here/$MYSQL_USER/1" wp-config.php
    sed -i -r "s/password_here/$MYSQL_PASSWORD/1" wp-config.php
    sed -i -r "s/localhost/mariadb/1" wp-config.php

	# WordPress will be installed on the specified domain with the provided admin user details
	wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USER \
		--admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

	# Create a user for WordPress
	wp user create $WP_USERNAME $WP_USERNAME_EMAIL --role=author \
		--user_pass=$WP_USERNAME_PASSWORD --allow-root
fi

# Modify the PHP-FPM configuration to listen on port 9000 for incoming requests
sed -i 's/listen = \/run\/php\/php8.2-fpm.sock/listen = 0.0.0.0:9000/g' /etc/php/8.2/fpm/pool.d/www.conf

# Start the PHP-FPM service for PHP version 8.2 in the foreground
/usr/sbin/php-fpm8.2 -F
