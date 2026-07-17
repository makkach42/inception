FROM debian:bookworm

RUN apt update && apt install -y openssh-server

RUN mkdir /run/sshd

COPY conf/sshd_config /etc/ssh/sshd_config

COPY tools/script.sh .

CMD ["bash", "script.sh"]