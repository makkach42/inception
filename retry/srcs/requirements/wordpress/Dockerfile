FROM debian:bookworm

RUN apt update && apt install -y php-fpm php php-mysql wget

COPY script.sh .

CMD ["bash", "script.sh"]