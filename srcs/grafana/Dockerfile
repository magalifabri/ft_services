FROM alpine:3.13.1

RUN apk update && apk add \
	vim \
	grafana \
	telegraf

# COPY srcs/grafana.ini ./etc/
COPY /srcs/start.sh /srcs/telegraf.conf ./
COPY /srcs/provisioning/ /usr/share/grafana/conf/provisioning/

EXPOSE 3000

CMD sh start.sh
