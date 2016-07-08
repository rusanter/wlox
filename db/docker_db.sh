#!/bin/bash

if [ ! -z "${WLOX_URL}" ]; then
	echo "UPDATE app_configuration SET frontend_baseurl = \'${WLOX_URL}\';" >> /docker-entrypoint-initdb.d/02_docker.sql
else
	echo "UPDATE app_configuration SET frontend_baseurl = \'/\';" >> /docker-entrypoint-initdb.d/02_docker.sql
fi
