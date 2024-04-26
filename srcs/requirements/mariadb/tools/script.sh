#!/bin/bash

service mariadb start

sleep 5


# Set the root password
#mysqladmin -u root password "${MYSQL_ROOT_PASSWORD}"

 mariadb <<EOF
    CREATE DATABASE IF NOT EXISTS ${MYSQL_NAME};
    CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
    GRANT ALL PRIVILEGES ON ${MYSQL_NAME}.* TO '${MYSQL_USER}'@'%';
    FLUSH PRIVILEGES;
EOF
## Create a new database.
#mysql -u root --password="${MYSQL_ROOT_PASSWORD}" -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_NAME}\`;"
## Create a new MySQL user account that we will use to operate on WordPress's new database, with username "wordpress_user"
#mysql -u root --password="${MYSQL_ROOT_PASSWORD}" -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
## Link the user and DB together by granting our user access to the database
#mysql -u root --password="${MYSQL_ROOT_PASSWORD}" -e "GRANT ALL PRIVILEGES ON \`${MYSQL_NAME}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
## Flush the privileges so that MySQL knows about the user permissions we just added.
#mysql -u root --password="${MYSQL_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"


# Shut down the MariaDB service
service mariadb stop

# Restart the MariaDB service in the foreground
mysqld
