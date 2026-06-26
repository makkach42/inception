#!/bin/bash

if  ! command -v wp > /dev/null 2>&1  ;
then    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
        chmod +x wp-cli.phar && \
        mv wp-cli.phar /usr/local/bin/wp
        mkdir -p /wordpress
        cd /wordpress

        wp core download --allow-root

        wp config create --dbname=wordpress --dbuser=qwerty --dbpass=password --dbhost=maria --allow-root

        wp core install --allow-root --url=qwerty.42.fr --title=azerty --admin_user=qwertyu --admin_password=adpassword --admin_email=qwertyu@fuckyou.smd

        if ! wp user get qwerty --allow-root > /dev/null 2>&1; then
                wp user create qwerty qwerty@fuckyou.smd --role=author --user_pass=password --allow-root
        fi
fi

exec php-fpm8.2 -F