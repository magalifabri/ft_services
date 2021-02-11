FROM alpine:3.13.1

RUN apk update && apk add \
	vim \
	influxdb=1.8.3-r2 \
	telegraf=1.17.0-r0

COPY /srcs/start.sh /srcs/telegraf.conf ./

EXPOSE 8086

CMD /start.sh
