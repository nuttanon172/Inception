# Use the Debian Bookworm base image
FROM debian:bookworm

# Update package lists and install MariaDB
RUN apt-get update -y && \
    apt-get install -y mariadb-server mariadb-client

# Copy the custom MariaDB configuration file and script to the container
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY tools/script.sh /

# Expose port 3306 to allow external services to connect to the MariaDB server
EXPOSE 3306

# Start MariaDB with the custom script when the container starts
CMD ["bash", "script.sh"]
