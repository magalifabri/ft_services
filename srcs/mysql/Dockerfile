FROM alpine:3.13.1

RUN apk update && apk add \
	vim \
	mariadb \
	mariadb-client \
	telegraf

COPY /srcs/ ./

EXPOSE 3306

CMD /start.sh
