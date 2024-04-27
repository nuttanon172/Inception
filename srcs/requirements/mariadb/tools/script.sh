#!/bin/bash

service mariadb start

sleep 3

## Create a new database.
#CREATE DATABASE IF NOT EXISTS ${MYSQL_NAME};
## Create a new MySQL user account that we will use to operate on WordPress's new database, with username "wordpress_user"
#CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
## Link the user and DB together by granting our user access to the database
#GRANT ALL PRIVILEGES ON ${MYSQL_NAME}.* TO '${MYSQL_USER}'@'%';
## Flush the privileges so that MySQL knows about the user permissions we just added.
#FLUSH PRIVILEGES;

mariadb <<EOF
    CREATE DATABASE IF NOT EXISTS ${MYSQL_NAME};
    CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
    GRANT ALL PRIVILEGES ON ${MYSQL_NAME}.* TO '${MYSQL_USER}'@'%';
    FLUSH PRIVILEGES;
EOF

# Shut down the MariaDB service
service mariadb stop

chmod -R 777 /var/lib/mysql

# Restart the MariaDB service in the foreground
exec "$@"
