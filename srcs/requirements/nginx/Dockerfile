FROM debian:bookworm

# Update package lists and install Nginx
RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean

# Copy the custom Nginx configuration file to the container
COPY /conf/nginx.conf /etc/nginx/nginx.conf

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]
