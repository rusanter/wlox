FROM debian:jessie
MAINTAINER David Rodriguez <david@goldenfrogtech.com>

RUN apt-get update && apt-get -y install apache2 curl \
        libapache2-mod-php5 \
        php5-mysql \
        php5-mcrypt \
        php5-gd \
        php5-curl \
        php-pear \
        vim \
        git \
        php-apc && \
        apt-get clean && rm -rf /var/lib/apt/lists/*

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

#habilitar el virtualhost
COPY api-default.conf /etc/apache2/sites-available/000-default.conf
COPY api-default.conf /etc/apache2/sites-enable/000-default.conf
#RUN /usr/sbin/a2ensite api-default


#usando ssl
#RUN /usr/sbin/a2ensite default-ssl
#RUN /usr/sbin/a2enmod ssl



#Environment

ENV dbhost=dbwlox
ENV dbname=wloxdb
ENV dbuser=wloxuser
ENV dbpass=wloxpass


#directorio
WORKDIR /opt/wlox/api/htdocs/

ADD . /opt/wlox/api/

#Renombrando configuracion
RUN mv -v ../cfg/cfg.php.example ../cfg/cfg.php



EXPOSE 80
EXPOSE 443

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]


