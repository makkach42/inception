FROM debian:bookworm

RUN apt update && apt install -y nginx

COPY conf/my.conf /etc/nginx/conf.d

COPY tools/script.sh .

RUN mkdir -p /etc/nginx/ssl

CMD ["bash", "script.sh"]