FROM centos:6
MAINTAINER rmkn
RUN yum -y update
RUN yum -y install httpd php php-mbstring

COPY security.sh /tmp/security.sh
RUN /tmp/security.sh && rm /tmp/security.sh

EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

