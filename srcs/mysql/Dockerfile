FROM alpine:3.12.0

RUN apk update && apk add mariadb mariadb-client vim

COPY ./srcs/mysql_setup.sql ./srcs/start.sh ./

EXPOSE 90

CMD /start.sh
