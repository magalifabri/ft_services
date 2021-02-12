FROM alpine:3.13.1

RUN apk update && apk add \
    vim \
    php7=7.4.15-r0 \
    php7-fpm=7.4.15-r0 \
    php7-mysqli=7.4.15-r0 \
    php7-mbstring=7.4.15-r0\ 
    php7-json=7.4.15-r0 \
    php7-session=7.4.15-r0 \
    telegraf=1.17.0-r0 \
    openssl=1.1.1i-r0 \
    nginx=1.18.0-r13

RUN mkdir -p /var/www/html/wp \
    mkdir -p /run/nginx

COPY /srcs/wp /var/www/html/wp
COPY /srcs/wp-config.php /var/www/html/wp/
COPY /srcs/start.sh /srcs/telegraf.conf srcs/livenessProber.sh ./
COPY /srcs/default.conf /etc/nginx/conf.d/

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt \
    -subj "/C=BE/ST=Brussels/L=Brussels/O=42/OU=mfabri/CN=wp"

EXPOSE 5050

CMD /start.sh
