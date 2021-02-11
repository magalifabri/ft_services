FROM alpine:3.13.1

RUN apk update && apk add \
	vim \
	grafana=7.3.6-r0 \
	telegraf=1.17.0-r0

COPY /srcs/start.sh /srcs/telegraf.conf ./
COPY /srcs/provisioning/ /usr/share/grafana/conf/provisioning/
COPY /srcs/dashboards/ /var/lib/grafana/dashboards/

EXPOSE 3000

CMD /start.sh
