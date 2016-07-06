FROM php:5.6-cli
MAINTAINER Jim Phillips <jim.phillips@goldenfrogtech.com>

# Update APT
RUN apt-get update

# Prepare PHP5
RUN apt-get install -y openssl libcurl4-openssl-dev libgd-dev libmcrypt-dev \
    && docker-php-ext-install curl gd mcrypt json pdo_mysql

# Install Cron
RUN apt-get install -y cron

# Create App Directory
WORKDIR /app
ADD . /app

# Install Configurations
COPY docker_cfg.php cfg.php
COPY crontab /etc/cron.d/wlox

# Set things up for Cron
RUN chmod 0644 /etc/cron.d/wlox
RUN crontab /etc/cron.d/wlox
RUN touch /var/log/cron.log

# Connect Wallet Transaction
VOLUME /app/transactions

CMD cron && tail -f /var/log/cron.log
