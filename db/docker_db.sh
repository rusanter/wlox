#!/bin/bash


if [ ! -z "${exchange_name}" ]; then
	echo "UPDATE app_configuration SET exchange_name = '${exchange_name}';" >> /tmp/envvars.sql
else
	echo "UPDATE app_configuration SET exchange_name = 'WLOX';" >> /tmp/envvars.sql
fi
if [ ! -z "${contact_email}" ]; then
	echo "UPDATE app_configuration SET contact_email = '${contact_email}';" >> /tmp/envvars.sql
else
	echo "UPDATE app_configuration SET contact_email = 'info@goldenfrogtech.com';" >> /tmp/envvars.sql
fi
if [ ! -z "${wallet_host}" ]; then
	echo "UPDATE app_configuration SET bitcoin_host = '${wallet_host}';" >> /tmp/envvars.sql
else
	echo "UPDATE app_configuration SET bitcoin_host = 'wallet';" >> /tmp/envvars.sql
fi
if [ ! -z "${wallet_port}" ]; then
	echo "UPDATE app_configuration SET bitcoin_port = '${wallet_port}';" >> /tmp/envvars.sql
else
	echo "UPDATE app_configuration SET bitcoin_port = '8332';" >> /tmp/envvars.sql
fi
if [ ! -z "${wallet_user}" ]; then
	echo "UPDATE app_configuration SET bitcoin_username = '${wallet_user}';" >> /tmp/envvars.sql
else
	echo "UPDATE app_configuration SET bitcoin_username = 'wlox';" >> /tmp/envvars.sql
fi
if [ ! -z "${wallet_pass}" ]; then
	echo "UPDATE app_configuration SET bitcoin_passphrase = '${wallet_pass}';" >> /tmp/envvars.sql
else
	echo "UPDATE app_configuration SET bitcoin_passphrase = 'wlox';" >> /tmp/envvars.sql
fi
if [ ! -z "${smtp_host}" ]; then
	echo "UPDATE app_configuration SET email_smtp_host = '${smtp_host}';" >> /tmp/envvars.sql
else
	echo "UPDATE app_configuration SET email_smtp_host = 'smtp-relay.gmail.com';" >> /tmp/envvars.sql
fi
if [ ! -z "${smtp_from}" ]; then
	echo "UPDATE app_configuration SET email_smtp_send_from = '${smtp_from}';" >> /tmp/envvars.sql
else
	echo "UPDATE app_configuration SET email_smtp_send_from = 'info@goldenfrogtech.com';" >> /tmp/envvars.sql
fi
if [ ! -z "${recaptcha_key}" ]; then
	echo "UPDATE app_configuration SET google_recaptch_api_key = '${recaptcha_key}';" >> /tmp/envvars.sql
else
	echo "UPDATE app_configuration SET google_recaptch_api_key = '';" >> /tmp/envvars.sql
fi
if [ ! -z "${recaptcha_secret}" ]; then
	echo "UPDATE app_configuration SET google_recaptch_api_secret = '${recaptcha_secret}';" >> /tmp/envvars.sql
else
	echo "UPDATE app_configuration SET google_recaptch_api_secret = '';" >> /tmp/envvars.sql
fi
if [ ! -z "${WLOX_URL}" ]; then
	echo "UPDATE app_configuration SET frontend_baseurl = '${WLOX_URL}';" >> /tmp/envvars.sql
else
	echo "UPDATE app_configuration SET frontend_baseurl = '/';" >> /tmp/envvars.sql
fi

/usr/bin/mysql -u ${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE} < /tmp/envvars.sql 
