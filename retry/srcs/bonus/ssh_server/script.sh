#!/bin/bash

pass=$(cat /run/secrets/ROOT_PASS)
echo "root:${pass}" | chpasswd

exec /usr/sbin/sshd -D