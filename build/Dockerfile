FROM alpine:latest

RUN apk add --upgrade \
    bash \
    shadow \
    openssh \
    openssh-sftp-server

COPY sshd_config /etc/ssh/sshd_config
COPY docker-entrypoint.sh /app/docker-entrypoint.sh
RUN chmod +x /app/docker-entrypoint.sh

EXPOSE 22

ENTRYPOINT ["/app/docker-entrypoint.sh"]