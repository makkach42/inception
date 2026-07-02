#!/bin/bash

apt install openssl -y

openssl req -x509 -nodes -days 365 \
  -newkey rsa:2048 \
  -keyout /etc/nginx/ssl/makkach.42.fr.key \
  -out /etc/nginx/ssl/makkach.42.fr.crt \
  -subj "/C=MA/ST=Morocco/L=Khouribga/O=42/CN=makkach.42.fr"

exec nginx -g "daemon off;"