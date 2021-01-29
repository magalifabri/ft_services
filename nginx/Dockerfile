FROM alpine:3.12.0

RUN apk update && apk add nginx vim

RUN mkdir -p /run/nginx

COPY srcs/default.conf /etc/nginx/conf.d/

RUN mkdir -p /usr/share/nginx/html/

COPY srcs/index.html /usr/share/nginx/html/

EXPOSE 80

CMD nginx -g "daemon off;"