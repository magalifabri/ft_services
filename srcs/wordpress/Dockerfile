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

RUN mkdir -p /var/www/html/wp

COPY /srcs/wp /var/www/html/wp
COPY /srcs/wp-config.php /var/www/html/wp/
COPY /srcs/start.sh /srcs/telegraf.conf ./

EXPOSE 5050

CMD sh start.sh
