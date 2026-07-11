#!/bin/bash

mariadbd --user=mysql &

until mariadb -u root -e "SELECT 1" > /dev/null 2>&1; do
    sleep 0.5;
done

db_password=$(cat /run/secrets/DB_USER_PASSWORD)

mariadb -u root <<EOF
create database if not exists ${DB_NAME};
create user if not exists '${DB_USER}'@'%' identified by '$db_password';
grant all privileges on ${DB_NAME}.* to '${DB_USER}'@'%';
flush privileges;
EOF

mysqladmin -u root shutdown

exec mariadbd --user=mysql --bind-address=0.0.0.0