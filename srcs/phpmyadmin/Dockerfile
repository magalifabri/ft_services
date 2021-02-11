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
    nginx=1.18.0-r13

RUN mkdir -p /usr/share/webapps/ \
    mkdir -p /run/nginx

COPY /srcs/phpmyadmin /usr/share/webapps/phpmyadmin
COPY /srcs/config.inc.php /usr/share/webapps/phpmyadmin/config.inc.php
COPY /srcs/start.sh /srcs/telegraf.conf /srcs/livenessProber.sh ./
COPY /srcs/default.conf /etc/nginx/conf.d/

EXPOSE 5000

CMD /start.sh
