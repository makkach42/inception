FROM debian:bookworm

RUN apt update && apt install -y php-fpm php php-mysql wget bash

COPY script.sh .

RUN chmod +x script.sh

CMD [ "bash", "script.sh"]