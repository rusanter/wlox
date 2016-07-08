FROM php/wlox
MAINTAINER David Rodriguez <david@goldenfrogtech.com>


#Environment

ENV dbhost=dbwlox
ENV dbname=wloxdb
ENV dbuser=wloxuser
ENV dbpass=wloxpass







#directorio
WORKDIR /var/www/wlox/api/htdocs/

ADD . /var/www/wlox/api/htdocs/

RUN mv -v cfg/cfg.php.example cfg/cfg.php



