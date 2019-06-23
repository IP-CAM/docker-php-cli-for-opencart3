#
# Dockerfile for php cli for opencart 3
#

FROM php:7.3.6
MAINTAINER aaron <info@aamservices.uk>

RUN apt-get update && \
    apt-get install -y --no-install-recommends git zip libzip-dev

RUN set -xe \
    && apt-get update \
    && apt-get install -y libpng-dev libjpeg-dev libmcrypt-dev unzip \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
    && docker-php-ext-install gd mbstring mysqli pdo_mysql zip \
    && pecl install mcrypt-1.0.2 \
    && docker-php-ext-enable mcrypt

WORKDIR /var/www/html

CMD ["tail", "-f", "/var/log/faillog"]
