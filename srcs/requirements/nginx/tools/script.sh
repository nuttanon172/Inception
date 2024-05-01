#!/bin/bash

# Generate a self-signed TLSv1.3 certificate and key
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/certs/$DOMAIN_NAME.key -out /etc/ssl/certs/$DOMAIN_NAME.crt \
	-subj "/C=TH/L=BKK/O=42/OU=student/CN=$DOMAIN_NAME"

# Update Environment variable to NGINX Configuration File
echo "server {
    listen 443 ssl;
    listen [::]:443 ssl;

    server_name $DOMAIN_NAME;

    ssl_certificate /etc/ssl/certs/$DOMAIN_NAME.crt;
    ssl_certificate_key /etc/ssl/certs/$DOMAIN_NAME.key;
    ssl_protocols TLSv1.3;

    root /var/www/html;
    index index.php;
    error_log /var/log/nginx/error.log;
    access_log /var/log/nginx/access.log;" > /etc/nginx/conf.d/nginx.conf

echo '
    location ~ \.php$ {
            fastcgi_pass wordpress:9000;
            fastcgi_index index.php;
            include fastcgi_params;
            fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }
}' >> /etc/nginx/conf.d/nginx.conf

exec "$@"
