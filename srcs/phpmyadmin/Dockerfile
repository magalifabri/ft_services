FROM alpine:3.13.1

RUN apk update && apk add \
    vim \
    php \
    php-fpm \
    php-mysqli \
    php-mbstring \ 
    php-json \
    php-session \
    telegraf \
    nginx

RUN mkdir -p /usr/share/webapps/ \
    mkdir -p /run/nginx

COPY /srcs/phpmyadmin /usr/share/webapps/phpmyadmin
COPY /srcs/config.inc.php /usr/share/webapps/phpmyadmin/config.inc.php
COPY /srcs/start.sh /srcs/telegraf.conf /srcs/livenessProber.sh ./
COPY srcs/default.conf /etc/nginx/conf.d/

EXPOSE 5000

CMD /start.sh
