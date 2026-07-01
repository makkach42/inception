FROM debian:bookworm

RUN apt update && apt install -y nginx

COPY my.conf /etc/nginx/conf.d

CMD ["nginx", "-g", "daemon off;"]