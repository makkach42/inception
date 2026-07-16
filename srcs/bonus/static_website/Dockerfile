FROM debian:bookworm

RUN apt update && apt install nginx -y

COPY site /var/www/site

COPY my.conf /etc/nginx/sites-enabled/default

CMD ["nginx", "-g", "daemon off;"]