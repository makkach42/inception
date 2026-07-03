FROM debian:bookworm

RUN apt update && apt install -y php-fpm php php-mysql wget bash

COPY script.sh .

COPY www.conf /etc/php/8.2/fpm/pool.d/www.conf

RUN chmod +x script.sh

CMD [ "bash", "script.sh"]