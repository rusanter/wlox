FROM sameersbn/mysqlwlox

#VOLUME ["/etc/mysql", "/var/lib/mysql"]

# Define working directory.
#WORKDIR /data

# Install database
ADD ./wlox.sql /docker-entrypoint-initdb.d/wlox.sql

ENV DB_NAME=wloxdb
ENV DB_USER=wloxuser
ENV DB_PASS=wloxpass
ENV DB_REMOTE_ROOT_NAME=root
ENV DB_REMOTE_ROOT_PASS=root


