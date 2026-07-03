FROM debian:bookworm

RUN apt update && apt install nginx openssl -y

COPY file.conf /etc/nginx/nginx.conf

COPY script.sh .

RUN chmod +x script.sh

EXPOSE 443

CMD [ "bash", "script.sh"]