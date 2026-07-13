FROM debian:bookworm

RUN apt update && apt install nginx -y

COPY site /var/www/site

COPY my.conf /etc/nginx/conf.d/my.conf

CMD ["nginx", "-g", "daemon off;"]