FROM debian:bookworm

RUN apt update && apt install nginx -y

COPY tools/site /var/www/site

COPY conf/my.conf /etc/nginx/sites-enabled/default

CMD ["nginx", "-g", "daemon off;"]