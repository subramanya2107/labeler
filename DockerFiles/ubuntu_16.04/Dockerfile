FROM ubuntu:16.04

# update ubuntu config
RUN apt-get update -y
RUN DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade
USER root

# install dependencies for labelme
RUN apt-get install -y \
 				apache2 \
 				git \
 				libapache2-mod-perl2 \
 				libcgi-session-perl \
 				libapache2-mod-php \
 				make \
 				php

# Throws error 				
#RUN apt-get install php5 libapache2-mod-php5 -y

# Config apache
RUN a2enmod include && a2enmod rewrite && a2enmod cgi && a2enmod lbmethod_byrequests

# apache2 configuration: enabling SSI and perl/CGI scripts
COPY ports.conf /etc/apache2/ports.conf 
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
COPY apache2.conf /etc/apache2/apache2.conf

#Clone LabelMe,move it and make
RUN git clone https://github.com/subramanya2107/labeler.git &&  mv ./labeler/ /var/www/html/LabelMeAnnotationTool/ && cd /var/www/html/LabelMeAnnotationTool/ && make && chown -R www-data:www-data /var/www/html

RUN chown root:root /usr/sbin/apache2ctl
RUN chmod 755 /usr/sbin/apache2ctl
# port binding
EXPOSE 8080

# run
CMD ["/usr/sbin/apache2ctl","-D","FOREGROUND"]
