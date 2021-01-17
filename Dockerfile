FROM nginx:1.19.6

LABEL version="1.0"

ENV archivo=docker

WORKDIR /usr/share/nginx/html

COPY kross .

RUN echo "${archivo}" > ./env.html

EXPOSE 90

RUN useradd andresrubiot

USER andresrubiot

RUN echo "Hola, soy $(whoami)" > /tmp/yo.html

USER root

RUN cp /tmp/yo.html .

VOLUME /var/log/nginx

CMD nginx -g 'daemon off;'