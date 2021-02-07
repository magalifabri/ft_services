FROM alpine:3.13.1

RUN apk update && apk add \
	vim \
	mariadb \
	mariadb-client \
	telegraf

COPY srcs/mysql_setup.sql srcs/start.sh srcs/create_tables.sql ./
COPY srcs/my.cnf srcs/telegraf.conf ./

EXPOSE 3306

CMD /start.sh
