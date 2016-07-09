#!/bin/bash

if [ ! -z "${WLOX_URL}" ]; then
	echo "UPDATE app_configuration SET frontend_baseurl = '${WLOX_URL}';" >> /tmp/envvars.sql
else
	echo "UPDATE app_configuration SET frontend_baseurl = '/';" >> /tmp/envvars.sql
fi

/usr/bin/mysql -u ${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE} < /tmp/envvars.sql 
