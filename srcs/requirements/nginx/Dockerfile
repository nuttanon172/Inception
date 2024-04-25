# Use the Debian Bookworm base image
FROM debian:bookworm

# Update package lists and install Nginx and OpenSSL
RUN apt-get update -y && \
    apt-get install -y nginx openssl

# Copy the custom Nginx configuration file and script to the container
COPY conf/default.conf /etc/nginx/conf.d/default.conf
COPY tools/script.sh /

# Expose the HTTPS port
EXPOSE 443

# Start Nginx with the custom script when the container starts
CMD ["bash", "script.sh"]
