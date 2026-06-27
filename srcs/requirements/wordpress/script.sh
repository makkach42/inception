#!/bin/bash

DB_PASS=$(cat /run/secrets/WP_PASSWORD)
ADMIN_PASSWORD=$(cat /run/secrets/WP_ADMIN_PASSWORD)
USER_PASSWORD=$(cat /run/secrets/WP_USER_PASSWORD)

if  ! command -v wp > /dev/null 2>&1  ;
then    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
        chmod +x wp-cli.phar && \
        mv wp-cli.phar /usr/local/bin/wp
        mkdir -p /wordpress
        cd /wordpress

        wp core download --allow-root
        wp config create --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASS} --dbhost=${DB_HOST} --allow-root

        wp core install --allow-root --url=${DB_ROOT}.42.fr --title=azerty --admin_user=${DB_ROOT} --admin_password=${ADMIN_PASSWORD} --admin_email=${DB_ROOT}@fuckyou.smd

        if ! wp user get qwerty --allow-root > /dev/null 2>&1; then
                wp user create qwerty qwerty@fuckyou.smd --role=author --user_pass=${USER_PASSWORD} --allow-root
        fi
fi

exec php-fpm8.2 -F