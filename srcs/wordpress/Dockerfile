FROM alpine:3.12.0

RUN apk update && apk add \
    vim \
    php \
    php-fpm \
    php-mysqli \
    php-mbstring \ 
    php-json \
    php-session

RUN mkdir -p /var/www/html/wp

COPY ./srcs/wp                  /var/www/html/wp
COPY ./srcs/wp-config.php       var/www/html/wp/

EXPOSE 5050

CMD /usr/bin/php -S 0.0.0.0:5050 -t /var/www/html/wp/

# mv var/www/html/wp/wp-config-sample.php var/www/html/wp/wp-config.php

# /usr/bin/php -S 0.0.0.0:80 -t /var/www/html/wp/

# minikube service wp-service

