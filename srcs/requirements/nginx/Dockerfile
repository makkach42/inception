FROM debian:bookworm

RUN apt update && apt upgrade && apt install nginx -y

CMD [ "nginx", "-g", "daemon off;" ]