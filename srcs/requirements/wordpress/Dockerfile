FROM debian:bookworm

RUN apt update && apt install -y php-fpm php php-mysql wget

COPY tools/script.sh .

COPY conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

CMD ["bash", "script.sh"]