FROM alpine:3.13.1

RUN apk update && apk add \
    nginx \
    openssl \
    vim \
    telegraf \
    openssh-server

RUN mkdir -p /run/nginx \
    /usr/share/nginx/html/

COPY srcs/default.conf /etc/nginx/conf.d/
COPY srcs/index.html /usr/share/nginx/html/
COPY srcs/start.sh srcs/telegraf.conf ./

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt \
    -subj "/C=BE/ST=Brussels/L=Brussels/O=42/OU=mfabri/CN=wp"

EXPOSE 80 443 22

CMD sh start.sh
