FROM  sameersbn/mysql

#VOLUME ["/etc/mysql", "/var/lib/mysql"]

# Define working directory.
#WORKDIR /data

#COPY entrypoint.sh /sbin/entrypoint.sh
#RUN chmod 755 /sbin/entrypoint.sh

#ENTRYPOINT ["/sbin/entrypoint.sh"]
#CMD ["/usr/bin/mysqld_safe"]


RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

# Install database
ADD ./wlox.sql /docker-entrypoint-initdb.d/wlox.sql

ENV DB_NAME=wloxdb
ENV DB_USER=wloxuser
ENV DB_PASS=wloxpass
ENV DB_REMOTE_ROOT_NAME=root
ENV DB_REMOTE_ROOT_PASS=root

WORKDIR /docker-entrypoint-initdb.d/
RUN dump mysql -uroot -proot < wlox.sql