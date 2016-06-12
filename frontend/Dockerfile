FROM debian:jessie
MAINTAINER David Rodriguez <david@goldenfrogtech.com>

#update system
# install 
RUN  apt-get update && apt-get install -y apache2 vim curl php5-common php5-cli php5-fpm php5-mcrypt php5-mysql php5-apcu php5-gd php5-imagick php5-curl php5-intl


#directorio
WORKDIR /var/www/html/

ADD . /var/www/html/

RUN mv -v ./cfg/cfg.php.example ./cfg/cfg.php

#comandos





