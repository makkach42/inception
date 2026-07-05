#!/bin/bash

echo "root:0" | chpasswd

exec /usr/sbin/sshd -D