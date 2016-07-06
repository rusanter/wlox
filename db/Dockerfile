FROM  mysql:5.7

# Install database
ADD ./wlox.sql /docker-entrypoint-initdb.d/wlox.sql

ENV MYSQL_RANDOM_ROOT_PASSWORD=yes
ENV MYSQL_DATABASE=wlox
ENV MYSQL_USER=wlox
ENV MYSQL_PASSWORD=wlox
