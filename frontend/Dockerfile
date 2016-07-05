FROM ubuntu:trusty
MAINTAINER David Rodriguez <david@goldenfrogtech.com>

# Install base packages
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -yq install \
        curl \
        apache2 \
        libapache2-mod-php5 \
        php5-mysql \
        php5-mcrypt \
        php5-gd \
        php5-curl \
        php-pear \
        vim \ 
        git \
        php-apc && \
    rm -rf /var/lib/apt/lists/* && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN /usr/sbin/php5enmod mcrypt
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf && \
    sed -i "s/variables_order.*/variables_order = \"EGPCS\"/g" /etc/php5/apache2/php.ini

ENV ALLOW_OVERRIDE **False**


#Environment
ENV DB_NAME=wloxdb
ENV DB_USER=wloxuser
ENV DB_PASS=wloxpass
ENV DB_REMOTE_ROOT_NAME=root
ENV DB_REMOTE_ROOT_PASS=root

#ENV api_url='http://your.api.server/api.php'
#ENV auth_login_url='http://your.auth.server/login.php'
#ENV auth_verify_token_url='http://your.auth.server/verify_token.php'

#ENV dbhost=
#ENV dbname=wloxdb
#ENV dbuser=wloxuser
#ENV dbpass=wloxpass


#Virtualhost configs
WORKDIR /etc/apache2/
COPY apache2.conf.example /etc/apache2/sites-available/000-default.conf


# Add image configuration and scripts
ADD run.sh /run.sh
RUN chmod 755 /*.sh

# Configure /app folder with sample app
RUN mkdir -p /opt/wlox/frontend/htdocs/ && rm -fr /var/www/html && ln -s /opt/wlox/frontend/htdocs/ /var/www/html
WORKDIR /opt/wlox/frontend/htdocs
ADD . /opt/wlox/frontend/
COPY cfg/cfg.php.example cfg/cfg.php
#change cfg
#RUN mv -v cfg/cfg.php.example cfg/cfg.php

EXPOSE 80
CMD ["/run.sh"]






