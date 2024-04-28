# Use the Debian Bookworm base image
FROM debian:bookworm

# Update package lists and install php and curl
RUN apt-get update -y && \
	apt-get install -y php-fpm php-mysql

RUN apt-get install -y curl procps

# Copy the custom WordPress configuration file and script to the container
COPY /conf/wp-config.php /

COPY /tools/script.sh /usr/local/bin/script

RUN chmod +x /usr/local/bin/script

RUN mkdir -p /var/www/html

WORKDIR /var/www/html

# Expose port 9000 to allow PHP-FPM (FastCGI Process Manager) to handle PHP requests in WordPress
EXPOSE 9000

# Start WordPress with the custom script when the container starts
ENTRYPOINT [ "script" ]

# Start the PHP-FPM service for PHP version 8.2 in the foreground
CMD [ "/usr/sbin/php-fpm8.2", "-F" ]
