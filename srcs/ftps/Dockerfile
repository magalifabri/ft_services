FROM alpine:3.12.0

RUN apk update && apk add \
    vsftpd \
    vim

COPY srcs/vsftpd.conf ./etc/vsftpd/
COPY srcs/start.sh ./

EXPOSE 21 30021

CMD sh start.sh