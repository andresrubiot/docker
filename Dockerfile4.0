FROM centos:7

LABEL version="1.0"
LABEL description="Imagen con centos V7, php y SSL autofirmado"

WORKDIR /var/www/html

RUN yum -y install \
  httpd \
  php \
  php-cli \
  php-common \
  mod_ssl \
  openssl

RUN echo "<?php phpinfo(); ?>" > ./info.php

COPY kross .

COPY docker.crt /docker.crt

COPY docker.key /docker.key

COPY ssl.conf /etc/httpd/conf.d/default.conf

EXPOSE 443

CMD apachectl -DFOREGROUND