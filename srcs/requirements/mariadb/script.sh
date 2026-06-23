#!/bin/bash

mariadbd --user=mysql &

sleep 6

mariadb -u root <<EOF
CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER IF NOT EXISTS 'qwerty'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON wordpress.* TO 'qwerty'@'%';
FLUSH PRIVILEGES;
EOF

mysqladmin -u root shutdown

exec mariadbd --user=mysql --bind-address=0.0.0.0