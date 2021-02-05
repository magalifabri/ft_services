FROM alpine:3.13.1

RUN apk update && apk add \
	vim \
	influxdb \
	telegraf

COPY srcs/start.sh srcs/telegraf.conf ./

EXPOSE 8086

CMD sh start.sh
