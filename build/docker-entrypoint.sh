#!/bin/bash
set -e

export USER_LOGIN=$(cat $(echo $SFTP_SHARE_LOGIN_FILE))
export USER_PASSWORD=$(cat $(echo $SFTP_SHARE_PASSWORD_FILE))

echo "create group " $USER_LOGIN " | gid 1000..."
groupadd --gid 1000 $USER_LOGIN

echo "create user " $USER_LOGIN "..."
useradd -d /home/share -g $USER_LOGIN $USER_LOGIN
echo $USER_LOGIN:$USER_PASSWORD | chpasswd

echo "create home directory for user " $USER_LOGIN "..."
mkdir -p /home/share
chown -R $USER_LOGIN:$USER_LOGIN /home/share
chmod 700 -R /home/share

echo "Executing sshd..."
exec /usr/sbin/sshd -D -e