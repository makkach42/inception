#!bin/bash

mkdir -p /etc/nginx/ssl

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/key.pem -out /etc/nginx/ssl/cert.pem -subj "/CN=${DB_ROOT}.42.fr"

new="127.0.0.1 ${DB_ROOT}.42.fr"

exec nginx -g "daemon off;"
if grep -q "${DB_ROOT}.42.fr" /etc/hosts; then exit(0);
fi

