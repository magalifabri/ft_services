FROM alpine:3.12.0

RUN apk update && apk add \
	vim \
	mariadb \
	mariadb-client

COPY ./srcs/mysql_setup.sql ./srcs/start.sh ./srcs/create_tables.sql ./
COPY ./srcs/my.cnf ./
EXPOSE 3306

CMD /start.sh
