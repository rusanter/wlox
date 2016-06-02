FROM php/wlox
MAINTAINER David Rodriguez <david@goldenfrogtech.com>

#update system
# install sshd
RUN \
  apt-get update 


#directorio
WORKDIR /var/www/html/

ADD . /var/www/html/ 

RUN mv -v cfg/cfg.php.example cfg/cfg.php

#puertos expuestos
EXPOSE 22 8022 3306 33060


