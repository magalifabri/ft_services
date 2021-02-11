FROM alpine:3.13.1

RUN apk update && apk add \
    vsftpd=3.0.3-r6 \
    openssl=1.1.1i-r0 \
    vim \
    telegraf=1.17.0-r0

COPY /srcs/vsftpd.conf ./etc/vsftpd/
COPY /srcs/start.sh /srcs/telegraf.conf ./

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/vsftpd/vsftpd.key -out /etc/vsftpd/vsftpd.crt \
    -subj "/C=BE/ST=Brussels/L=Brussels/O=42/OU=mfabri/CN=wp"

EXPOSE 21 30021

CMD /start.sh
