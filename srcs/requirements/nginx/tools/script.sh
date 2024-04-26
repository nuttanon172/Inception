#!/bin/bash

# Generate a self-signed TLSv1.3 certificate and key
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/certs/ntairatt.42.fr.key -out $CERTS_ \
	-subj "/C=TH/L=BKK/O=42/OU=student/CN=ntairatt.42.fr"

# Start Nginx in the foreground without daemon mode
nginx -g "daemon off;"
