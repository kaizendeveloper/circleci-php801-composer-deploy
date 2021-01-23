FROM php:8.0.1-fpm-alpine3.12
MAINTAINER Miguel Delli Carpini <migueldellicarpini@gmail.com>

RUN addgroup -g 3434 circleci && adduser -u 3434 -G circleci -h /home/circleci -D circleci

RUN apk add --no-cache bzip2-dev icu-dev gettext-dev libxml2-dev libxslt-dev libjpeg-turbo-dev libpng-dev freetype-dev libzip-dev libexif-dev \
    && docker-php-ext-install mysqli \
    && docker-php-ext-enable mysqli \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-enable pdo_mysql \
    && docker-php-ext-install bcmath \
    && docker-php-ext-enable bcmath \
    && docker-php-ext-install bz2 \
    && docker-php-ext-enable bz2 \
    && docker-php-ext-install intl \
    && docker-php-ext-enable intl \
    && docker-php-ext-install gettext \
    && docker-php-ext-install soap \
    && docker-php-ext-enable soap \
    && docker-php-ext-install xsl \
    && docker-php-ext-enable xsl \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd \
    && docker-php-ext-enable gd \
    && docker-php-ext-install zip \
    && docker-php-ext-enable zip \
    && docker-php-ext-install exif \
    && docker-php-ext-enable exif \
    && bash curl git

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
php -r "if (hash_file('sha384', 'composer-setup.php') === 'c31c1e292ad7be5f49291169c0ac8f683499edddcfd4e42232982d0fd193004208a58ff6f353fde0012d35fdd72bc394') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
php composer-setup.php && \
php -r "unlink('composer-setup.php');" && echo '/usr/bin/php /composer.phar $1' > /usr/bin/composer && chmod a+x /usr/bin/composer




