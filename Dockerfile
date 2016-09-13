FROM centos:6
MAINTAINER rmkn
RUN sed -i -e "s/en_US.UTF-8/ja_JP.UTF-8" /etc/sysconfig/i18n
RUN cp -p /usr/share/zoneinfo/Japan /etc/localtime && echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock
RUN yum -y update
RUN yum -y install httpd php php-mbstring

COPY security.sh /tmp/security.sh
RUN /tmp/security.sh && rm /tmp/security.sh

RUN sed -i -e 's/;date.timezone =/date.timezone = Asia\/Tokyo/' /etc/php.ini

EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

