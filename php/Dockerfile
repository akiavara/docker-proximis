FROM php:7-fpm

MAINTAINER Alexandre JARDIN <aja@emakina.fr>

COPY *.ini /usr/local/etc/php/conf.d/

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /composer
ENV COMPOSER_VERSION 1.1.0
ENV PATH /composer/vendor/bin:$PATH

RUN apt-get update && apt-get install -y git \
    && curl -o /tmp/composer-setup.php https://getcomposer.org/installer \
    && curl -o /tmp/composer-setup.sig https://composer.github.io/installer.sig \
    && php -r "if (hash('SHA384', file_get_contents('/tmp/composer-setup.php')) !== trim(file_get_contents('/tmp/composer-setup.sig'))) { unlink('/tmp/composer-setup.php'); echo 'Invalid installer' . PHP_EOL; exit(1); }" \
    && php /tmp/composer-setup.php --no-ansi --install-dir=/usr/local/bin --filename=composer --version=${COMPOSER_VERSION} && rm -rf /tmp/* \
    && composer

#RUN apt-get update \
#    && apt-get install -y \
#        libicu-dev \
#        libfreetype6-dev \
#        libjpeg62-turbo-dev \
#        libmcrypt-dev \
#        libpng12-dev \
#        libxslt-dev \
#    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
#    && docker-php-ext-install gd iconv intl mbstring mcrypt pdo_mysql soap xsl \
#    && rm -rf /var/lib/apt/lists/*
#
#RUN apt-get update \
#    && apt-get install -y \
#        imagemagick \
#        graphicsmagick \
#        libmagickwand-dev \
#    && ln -s /usr/lib/x86_64-linux-gnu/ImageMagick-6.8.9/bin-Q16/MagickWand-config /usr/bin/ \
#    && yes | pecl install imagick \
#    && echo "extension=imagick.so" > /usr/local/etc/php/conf.d/php-ext-imagick.ini \
#    && rm -rf /var/lib/apt/lists/*

RUN usermod -u 1000 www-data
