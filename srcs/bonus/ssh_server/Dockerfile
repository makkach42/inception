FROM debian:bookworm

RUN apt update && apt install -y openssh-server

RUN mkdir /run/sshd

COPY sshd_config /etc/ssh/sshd_config

COPY script.sh .

CMD ["bash", "script.sh"]