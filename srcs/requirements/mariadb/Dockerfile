FROM debian:bookworm

RUN apt update && apt install -y mariadb-server

RUN mkdir -p /run/mysqld && chown mysql:mysql /run/mysqld

COPY tools/script.sh .

CMD ["bash", "script.sh"]