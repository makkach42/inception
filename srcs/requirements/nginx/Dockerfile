FROM debian:bookworm

RUN apt update && apt install nginx -y

COPY file.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD [ "nginx", "-g", "daemon off;" ]