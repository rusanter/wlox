FROM tutum/apache-php
MAINTAINER David Rodriguez <david@goldenfrogtech.com>




ENV DB_NAME=wloxdb
ENV DB_USER=wloxuser
ENV DB_PASS=wloxpass
ENV DB_REMOTE_ROOT_NAME=root
ENV DB_REMOTE_ROOT_PASS=root


ENV dbhost=
ENV dbname=wloxdb
ENV dbuser=wloxuser
ENV dbpass=wloxpass




#directorio
WORKDIR /opt/wlox/backstage2/

ADD . /opt/wlox/backstage2/

RUN mv cfg.php.example cfg.php



