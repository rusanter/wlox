FROM  tutum/mysql
MAINTAINER David Rodriguez <david@goldenfrogtech.com>

# Install latest updates
RUN apt-get update && apt-get upgrade -y

# Install mysql client and server
RUN apt-get -y install mysql-client mysql-server curl vim openssh-client openssh-server

# Enable remote access (default is localhost only, we change this
# otherwise our database would not be reachable from outside the container)
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf


# Install database
#ADD ./wlox.sql /docker-entrypoint-initdb.d/wlox.sql
COPY wlox.sql /tmp/
STARTUP_SQL="/tmp/<wlox.sql>"




EXPOSE 22 8022 3306 33060

