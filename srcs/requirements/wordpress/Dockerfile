FROM debian:bookworm

RUN apt update && apt install php-fpm -y

EXPOSE 9000

CMD [ "php-fpm8.2", "-F"]