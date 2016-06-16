FROM tutum/apache-php
MAINTAINER David Rodriguez <david@goldenfrogtech.com>

#update system
# install 
RUN  apt-get update && apt-get install -y vim curl git

#directorio frontend 
WORKDIR /opt/wlox/wlox/frontend/htdocs/

ADD . /opt/wlox/wlox/frontend/htdocs/

#RUN mv -v cfg/cfg.php.example cfg/cfg.php

#Directorio API

WORKDIR /opt/wlox/wlox/api/htdocs/

COPY ../api  /opt/wlox/wlox/api/htdocs/

#RUN mv -v ./cfg/cfg.php.example ./cfg/cfg.php



#Directorio Auth
WORKDIR /opt/wlox/wlox/auth/htdocs/

COPY ../auth/ /opt/wlox/wlox/auth/htdocs/

#RUN mv -v ./cfg/cfg.php.example ./cfg/cfg.php



#Directorio CRON

WORKDIR /opt/wlox/wlox/cron/

ADD ../cron/ /opt/wlox/wlox/cron/

#RUN mv -v ./cfg/cfg.php.example ./cfg/cfg.php


#Directorio Backstage2

WORKDIR /opt/wlox/wlox/backstage2/

ADD ../backstage2/ /opt/wlox/wlox/backstage2/

#RUN mv -v ./cfg/cfg.php.example ./cfg/cfg.php



#Virtualhost configs
WORKDIR /etc/apache2/
ADD ../etc/ /etc/apache2/

RUN mv -v apache2.conf.example apache2.conf

RUN service apache2 restart

