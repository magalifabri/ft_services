FROM alpine:3.13.1

RUN apk update && apk add \
	vim \
	grafana

# COPY srcs/grafana.ini ./etc/
COPY srcs/start.sh ./

EXPOSE 3000

CMD sh start.sh
