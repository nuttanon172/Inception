# Use the Debian Bookworm base image
FROM debian:bookworm

# Update package lists and install Nginx and OpenSSL
RUN apt-get update && \
    apt-get install -y nginx openssl \
    curl procps && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy the custom Nginx configuration file and script to the container
COPY conf/nginx.conf /etc/nginx/conf.d/
COPY tools/script.sh /usr/local/bin/script
RUN chmod +x /usr/local/bin/script

# Expose the HTTPS port
EXPOSE 443

# Start Nginx with the custom script when the container starts
ENTRYPOINT [ "script" ]

# Start Nginx in the foreground without daemon mode
CMD [ "nginx", "-g", "daemon off;" ]
