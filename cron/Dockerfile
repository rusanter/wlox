FROM php/wlox
MAINTAINER David Rodriguez <david@goldenfrogtech.com>

ENV dbhost=
ENV dbname=wloxdb
ENV dbuser=wloxuser
ENV dbpass=wloxpass

ENV DB_NAME=wloxdb
ENV DB_USER=wloxuser
ENV DB_PASS=wloxpass
ENV DB_REMOTE_ROOT_NAME=root
ENV DB_REMOTE_ROOT_PASS=root







#directorio
WORKDIR /opt/wlox/cron/

ADD . /var/www/wlox/cron/

RUN mv -v cfg.php.example cfg.php



