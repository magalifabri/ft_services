FROM alpine:3.12.0

RUN apk update && apk add \
    vsftpd \
    openssl \
    vim

COPY srcs/vsftpd.conf ./etc/vsftpd/
COPY srcs/start.sh ./

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/vsftpd/vsftpd.key -out /etc/vsftpd/vsftpd.crt \
-subj "/C=BE/ST=Brussels/L=Brussels/O=42/OU=mfabri/CN=wp"

EXPOSE 21 30021

CMD sh start.sh