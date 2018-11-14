################################################################################
# Base image
################################################################################

FROM ubuntu:18.04
MAINTAINER  Oscar Gallardo "oscar.gallardo@outlook.com"

################################################################################
# Build instructions
################################################################################

# Remove default nginx configs.
RUN rm -f /etc/nginx/conf.d/*

ENV DEBIAN_FRONTEND=noninteractive

# Install packages
RUN apt-get update && apt-get install -my software-properties-common && add-apt-repository ppa:ondrej/php
RUN apt-get update && apt-get install -my --yes \
  supervisor \
  openssh-server \
  nginx \
  vim \
  htop \
  curl \
  wget \
  git \
  zip \
  unzip \
  php-pgsql \
  php-common \
  php-fpm \
  php-curl \
  php-gd \
  php-json \
  php-cli \
  php-xml \
  php-mbstring \
  php-zip \
  php-xdebug \
  php-memcached

# Install composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

# Add configuration files
COPY conf/nginx.conf /etc/nginx/
COPY conf/supervisord.conf /etc/supervisor/conf.d/

# Configure openssh
RUN mkdir /var/run/sshd
RUN echo 'root:docker' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Ensure that PHP FPM is run as root.
RUN sed -i "s/user = www-data/user = root/" /etc/php/7.2/fpm/pool.d/www.conf
RUN sed -i "s/group = www-data/group = root/" /etc/php/7.2/fpm/pool.d/www.conf

# Pass all docker environment
RUN sed -i '/^;clear_env = no/s/^;//' /etc/php/7.2/fpm/pool.d/www.conf

# Get access to FPM-ping page /ping
RUN sed -i '/^;ping\.path/s/^;//' /etc/php/7.2/fpm/pool.d/www.conf
# Get access to FPM_Status page /status
RUN sed -i '/^;pm\.status_path/s/^;//' /etc/php/7.2/fpm/pool.d/www.conf

# Create folder for pid and socket files
RUN mkdir /var/run/php

# Add configuration files
COPY conf/php.ini /etc/php5/fpm/conf.d/40-custom.ini

################################################################################
# Volumes
################################################################################

VOLUME ["/var/www", "/etc/nginx/conf.d"]

################################################################################
# Ports
################################################################################

EXPOSE 80 443 22 9000

################################################################################
# Entrypoint
################################################################################

ENTRYPOINT ["/usr/bin/supervisord"]
