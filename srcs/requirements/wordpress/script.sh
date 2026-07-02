#!/bin/bash

if ! command -v wp > /dev/null 2>&1 ; then

    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

    chmod +x wp-cli.phar

    mv wp-cli.phar /usr/local/bin/wp

    wp core download --path=/wordpress --allow-root

    db_password=$(cat /run/secrets/WP_PASSWORD)
    wp_sec_password=$(cat /run/secrets/WP_SEC_USER_PASS)
    admin_password=$(cat /run/secrets/ADMIN_USER_PASS)

    wp config create --dbname=${DB_NAME} --dbuser=${DB_USER} --dbhost=mariadb --dbpass=$db_password --path=/wordpress --allow-root

    wp core install --url=${DOMAIN} --title=${TITLE} --admin_user=${ADMIN_USER} --admin_email=${ADMIN_EMAIL} --admin_password=$admin_password --path=/wordpress --allow-root

    wp user create ${WP_SEC_USER} ${WP_SEC_USER_MAIL} --user_pass=${wp_sec_password}  --path=/wordpress --allow-root

fi

exec php-fpm8.2 --nodaemonize