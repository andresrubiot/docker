# centos-apache tag 1.0
FROM centos:centos8.3.2011

LABEL name="centos-apache"
LABEL version="1.0"
LABEL description="Centos image"

RUN yum install httpd -y

COPY html /var/www/html
COPY run.sh /run.sh

CMD sh /run.sh