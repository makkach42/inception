FROM debian:bookworm

RUN apt update && apt install -y vsftpd ftp

RUN mkdir -p /var/run/vsftpd/empty && chmod 555 /var/run/vsftpd/empty

COPY tools/script.sh .

COPY conf/vsftpd.conf /etc/vsftpd.conf

CMD ["bash", "script.sh"]