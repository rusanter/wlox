FROM php/wlox
MAINTAINER David Rodriguez <david@goldenfrogtech.com>



ENV DB_USER=wloxuser
ENV DB_PASS=wloxpass
ENV DB_REMOTE_ROOT_NAME=root
ENV DB_REMOTE_ROOT_PASS=root

ENV dbhost=db-wlox
ENV dbname=wloxdb
ENV dbuser=wloxuser
ENV dbpass=wloxpass



#directorio
WORKDIR /opt/wlox/auth/htdocs/

ADD . /var/www/html/ 

RUN mv -v cfg.php.example cfg.php



