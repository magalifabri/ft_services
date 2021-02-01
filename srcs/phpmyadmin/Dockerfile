FROM alpine:3.12.0

RUN apk update && apk add vim \
    php \
    php-fpm \
    php-mysqli \
    php-mbstring \ 
    php-json \
    php-session
    # php7-common \
    # php7-iconv \
    # php7-json \
    # php7-gd \
    # php7-curl \
    # php7-xml \
    # php7-mysqli \
    # php7-imap \
    # php7-cgi \
    # fcgi \
    # php7-pdo \
    # php7-pdo_mysql \
    # php7-soap \
    # php7-xmlrpc \
    # php7-posix \
    # php7-mcrypt \
    # php7-gettext \
    # php7-ldap \
    # php7-ctype \
    # php7-dom \
    # mysql \
    # mysql-client \
    # php-mysql \
    # php-mysqli

RUN mkdir -p /usr/share/webapps/

COPY ./srcs/phpmyadmin /usr/share/webapps/phpmyadmin

COPY ./srcs/config.inc.php /usr/share/webapps/phpmyadmin/config.inc.php

EXPOSE 5000

# CMD tail -f /dev/null
CMD php -S 0.0.0.0:5000 -t /usr/share/webapps/phpmyadmin/