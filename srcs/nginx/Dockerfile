FROM alpine:3.13.1

RUN apk update && apk add \
    nginx=1.18.0-r13 \
    openssl=1.1.1j-r0 \
    vim \
    telegraf=1.17.0-r0

RUN mkdir -p /run/nginx \
    /usr/share/nginx/html/

COPY /srcs/default.conf /etc/nginx/conf.d/
COPY /srcs/index.html /srcs/css.css /usr/share/nginx/html/
COPY /srcs/start.sh /srcs/telegraf.conf ./

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt \
    -subj "/C=BE/ST=Brussels/L=Brussels/O=42/OU=mfabri/CN=wp"

EXPOSE 80 443

CMD /start.sh
