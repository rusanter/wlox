#!/bin/sh

PHP=/usr/local/bin/php
DIR=$(cd "$( dirname "$0" )" && pwd)

cd ${DIR}
${PHP} receive_bitcoin.php
${PHP} send_bitcoin.php
