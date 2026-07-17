#!/bin/bash

useradd -d /wordpress ${FTP_USER}
password=$(cat /run/secrets/FTP_USER_PASS)
echo "${FTP_USER}:$password" | chpasswd

exec vsftpd /etc/vsftpd.conf