# Use the Debian Bookworm base image
FROM debian:bookworm

# Update package lists and install PHP 8.2, required extensions, and tools
RUN apt-get update && \
    apt-get install -y php8.2-fpm php8.2-mysql \
    curl procps && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy the custom WordPress configuration file and script to the container
COPY conf/wp-config.php /
COPY tools/script.sh /usr/local/bin/script

# Set permissions for the script
RUN chmod +x /usr/local/bin/script

# Create the directory for WordPress
RUN mkdir -p /var/www/html
WORKDIR /var/www/html

# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Start WordPress with the custom script when the container starts
ENTRYPOINT [ "script" ]

# Start the PHP-FPM service in the foreground
CMD [ "/usr/sbin/php-fpm8.2", "-F" ]
