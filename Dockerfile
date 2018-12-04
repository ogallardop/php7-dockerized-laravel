FROM ubuntu:18.04

MAINTAINER oscar.gallardo@outlook.com

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -yq --no-install-recommends \
  apt-utils \
  curl \
  # Install git
  git \
  # Install apache
  apache2 \
  # Install php 7.2
  libapache2-mod-php7.2 \
  php7.2-cli \
  php7.2-json \
  php7.2-curl \
  php7.2-fpm \
  php7.2-gd \
  php7.2-ldap \
  php7.2-mbstring \
  php7.2-mysql \
  php7.2-soap \
  php7.2-sqlite3 \
  php7.2-xml \
  php7.2-zip \
  php7.2-intl \
  php7.2-pgsql \
  php-imagick \
  # Install tools
  openssl \
  nano \
  graphicsmagick \
  imagemagick \
  ghostscript \
  mysql-client \
  iputils-ping \
  locales \
  sqlite3 \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set locales
RUN locale-gen en_US.UTF-8 en_GB.UTF-8 de_DE.UTF-8 es_ES.UTF-8 fr_FR.UTF-8 it_IT.UTF-8 km_KH sv_SE.UTF-8 fi_FI.UTF-8

RUN a2enmod rewrite expires

# Configure vhost
ADD sites/default.conf /etc/apache2/sites-enabled/000-default.conf

EXPOSE 80 443 22 9000

WORKDIR /var/www/html
VOLUME ["/var/www"]

RUN rm index.html

CMD ["apache2ctl", "-D", "FOREGROUND"]

