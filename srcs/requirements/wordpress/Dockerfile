# Use the Debian Bookworm base image
FROM debian:bookworm

# Update package lists and install php and curl
RUN apt-get update -y && \
	apt-get install -y php-fpm php-mysql

RUN apt-get install -y curl

# Copy the custom WordPress configuration file and script to the container
COPY conf/wp-config.php /
COPY tools/script.sh /

# Expose port 9000 to allow PHP-FPM (FastCGI Process Manager) to handle PHP requests in WordPress
EXPOSE 9000

# Start WordPress with the custom script when the container starts
CMD ["bash", "script.sh"]
