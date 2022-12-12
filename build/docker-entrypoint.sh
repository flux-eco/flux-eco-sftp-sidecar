#!/bin/bash
set -e

export USER_PWD=$(cat /run/secrets/sftp_share_password)

echo "generate ssh key..."
cd /etc/ssh
ssh-keygen -A

echo "create group share | gid 1000..."
groupadd --gid 1000 share

echo "create user share..."
useradd -d /home/share -g share share
echo share:$USER_PWD | chpasswd

echo "create home directory for user share..."
mkdir -p /home/share
chown -R share:share /home/share
chmod 700 -R /home/share

echo "Executing sshd..."
exec /usr/sbin/sshd -D -e