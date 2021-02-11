FROM alpine:3.13.1

RUN apk update && apk add \
	vim \
	mariadb=10.5.8-r0 \
	mariadb-client=10.5.8-r0 \
	telegraf=1.17.0-r0

COPY /srcs/ ./

EXPOSE 3306

CMD /start.sh
