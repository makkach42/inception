FROM debian:bookworm

RUN apt update && apt install -y nginx

COPY my.conf /etc/nginx/conf.d

COPY script.sh .

RUN mkdir -p /etc/nginx/ssl

CMD ["bash", "script.sh"]