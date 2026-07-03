#!/bin/bash

mariadbd --user=mysql &

until mariadb -u root -e "SELECT 1" &> /dev/null; do
    sleep 0.5
done;

password=$(cat /run/secrets/DB_USER_PASSWORD)

mariadb -u root <<EOF
CREATE DATABASE IF NOT EXISTS ${DATABASE_NAME};
CREATE USER IF NOT EXISTS '${USER_NAME}'@'%' IDENTIFIED BY '${password}';
GRANT ALL PRIVILEGES ON wordpress.* TO '${USER_NAME}'@'%';
FLUSH PRIVILEGES;
EOF

mysqladmin -u root shutdown

exec mariadbd --user=mysql --bind-address=0.0.0.0