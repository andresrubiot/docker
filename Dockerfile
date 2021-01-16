# centos-apache tag 1.0
FROM centos:centos8.3.2011

RUN yum install httpd -y

WORKDIR /var/www/html

COPY html .

ENV contenido prueba

RUN echo "$contenido" > /var/www/html/prueba.html

CMD apachectl -DFOREGROUND