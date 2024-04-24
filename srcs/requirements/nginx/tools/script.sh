#!/bin/bash

# Generate a self-signed TLSv1.3 certificate and key
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/certs/ntairatt.42.fr.key -out /etc/ssl/certs/ntairatt.42.fr.crt \
	-subj "/C=TH/L=BKK/O=42/OU=student/CN=ntairatt.42.fr"

## Update the Nginx configuration to use the generated certificate and enable TLSv1.3 only
#echo "server {
#    listen 443 ssl;
#    listen [::]:443 ssl;

#    ssl_certificate /etc/ssl/certs/ntairatt.42.fr.crt;
#    ssl_certificate_key /etc/ssl/certs/ntairatt.42.fr.key;
#    ssl_protocols TLSv1.3;

#	root /var/www/html;
#	index index.php;

#}" > /etc/nginx/conf.d/default.conf

# Start Nginx in the foreground without daemon mode
nginx -g daemon off

echo "Nginx is now running with TLSv1.3 support."
