FROM debian:bookworm

RUN apt update && apt install -y vsftpd ftp

RUN mkdir -p /var/run/vsftpd/empty && chmod 555 /var/run/vsftpd/empty

COPY script.sh .

COPY vsftpd.conf /etc/vsftpd.conf

CMD ["bash", "script.sh"]