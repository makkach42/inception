FROM debian:bookworm

RUN apt update && apt install -y php-fpm php php-mysql wget

COPY script.sh .

COPY www.conf /etc/php/8.2/fpm/pool.d/www.conf

CMD ["bash", "script.sh"]