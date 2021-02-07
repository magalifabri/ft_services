FROM alpine:3.13.1

RUN apk update && apk add \
    vim \
    php \
    php-fpm \
    php-mysqli \
    php-mbstring \ 
    php-json \
    php-session \
    telegraf

RUN mkdir -p /usr/share/webapps/

COPY /srcs/phpmyadmin /usr/share/webapps/phpmyadmin
COPY /srcs/config.inc.php /usr/share/webapps/phpmyadmin/config.inc.php
COPY /srcs/start.sh /srcs/telegraf.conf ./

EXPOSE 5000

CMD sh start.sh
# CMD tail -f /dev/null
# CMD php -S 0.0.0.0:5000 -t /usr/share/webapps/phpmyadmin/
