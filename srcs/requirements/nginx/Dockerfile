# Use the Debian Bookworm base image
FROM debian:bookworm

# Update package lists and install Nginx and OpenSSL
RUN apt-get update -y && \
    apt-get install -y nginx openssl

RUN apt-get install -y procps

# Copy the custom Nginx configuration file and script to the container
COPY /conf/default.conf /etc/nginx/conf.d/

COPY /tools/script.sh /usr/local/bin/script

RUN chmod +x /usr/local/bin/script

# Expose the HTTPS port
EXPOSE 443

# Start Nginx with the custom script when the container starts
ENTRYPOINT [ "script" ]

# Start Nginx in the foreground without daemon mode
CMD [ "nginx", "-g", "daemon off;" ]
