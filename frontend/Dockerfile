FROM tutum/apache-php
MAINTAINER David Rodriguez <david@goldenfrogtech.com>

#update system
# install 
RUN  apt-get update && apt-get install -y vim curl git

#directorio frontend 
WORKDIR /opt/wlox/frontend/htdocs/

ADD . /opt/wlox/frontend/htdocs/



#Environment
ENV DB_NAME=wloxdb
ENV DB_USER=wloxuser
ENV DB_PASS=wloxpass
ENV DB_REMOTE_ROOT_NAME=root
ENV DB_REMOTE_ROOT_PASS=root

ENV api_url='http://your.api.server/api.php'
ENV auth_login_url='http://your.auth.server/login.php'
ENV auth_verify_token_url='http://your.auth.server/verify_token.php'

ENV dbhost=
ENV dbname=wloxdb
ENV dbuser=wloxuser
ENV dbpass=wloxpass


#change cfg
RUN mv -v cfg/cfg.php.example cfg/cfg.php


#Virtualhost configs
WORKDIR /etc/apache2/
COPY ../etc/apache2.conf.example /etc/apache2/apache2.conf





#RUN mv -v apache2.conf.example apache2.conf


#Directorio API

#WORKDIR /opt/wlox/api/htdocs/

#COPY ../api  /opt/wlox/api/htdocs/

#RUN mv -v ./cfg/cfg.php.example ./cfg/cfg.php



#Directorio Auth
#WORKDIR /opt/wlox/auth/htdocs/

#COPY ../auth/ /opt/wlox/auth/htdocs/

#RUN mv -v cfg.php.example cfg.php



#Directorio CRON

#WORKDIR /opt/wlox/cron/

#ADD ../cron/ /opt/wlox/cron/

#RUN mv -v cfg.php.example cfg.php


#Directorio Backstage2

#WORKDIR /opt/wlox/backstage2/

#ADD ../backstage2/ /opt/wlox/backstage2/

#RUN mv -v cfg.php.example cfg.php
#


#Virtualhost configs
#WORKDIR /etc/apache2/
#ADD ../etc/ /etc/apache2/

#RUN mv -v apache2.conf.example apache2.conf

#RUN service apache2 restart

