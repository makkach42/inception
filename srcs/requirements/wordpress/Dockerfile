FROM debian:bookworm

RUN apt update && apt upgrade && apt install php-fpm -y

CMD [ "php-fpm8.2", "-F"]