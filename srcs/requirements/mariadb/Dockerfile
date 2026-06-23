FROM debian:bookworm

RUN apt update && apt install mariadb-server -y && apt install bash -y

RUN mkdir /run/mysqld

RUN chown mysql:mysql /run/mysqld

COPY script.sh .

CMD ["bash", "script.sh"]