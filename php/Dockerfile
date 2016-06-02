FROM php:7-fpm

MAINTAINER Alexandre JARDIN <aja@emakina.fr>

COPY *.ini /usr/local/etc/php/conf.d/
COPY *.sh /usr/bin/

RUN chmod +x /usr/bin/*.sh

RUN apt-get update \
    && apt-get install -y \
        libicu-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        libxslt-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd iconv intl mbstring mcrypt pdo_mysql soap xsl \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update \
    && apt-get install -y \
        imagemagick \
        graphicsmagick \
        libmagickwand-dev \
    && ln -s /usr/lib/x86_64-linux-gnu/ImageMagick-6.8.9/bin-Q16/MagickWand-config /usr/bin/ \
    && yes | pecl install imagick \
    && echo "extension=imagick.so" > /usr/local/etc/php/conf.d/php-ext-imagick.ini \
    && rm -rf /var/lib/apt/lists/*

# RUN pecl install -o -f xdebug
#     && rm -rf /tmp/pear \
#     && echo "zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20151012/xdebug.so" >> /usr/local/etc/php/conf.d/php.ini \
#     && echo "xdebug.max_nesting_level=500" >> /usr/local/etc/php/conf.d/php.ini \
#     && echo "xdebug.profiler_enable_trigger=1" >> /usr/local/etc/php/conf.d/php.ini \
#     && echo "xdebug.profiler_output_dir=/var/www/html/xdebug" >> /usr/local/etc/php/conf.d/php.ini \
#     && echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/php.ini \
#     && echo "xdebug.remote_connect_back=1" >> /usr/local/etc/php/conf.d/php.ini \
#     && echo "xdebug.remote_port=9000" >> /usr/local/etc/php/conf.d/php.ini \
#     && echo "xdebug.remote_autostart=0" >> /usr/local/etc/php/conf.d/php.ini \
#     && echo "xdebug.remote_handler=dbgp" >> /usr/local/etc/php/conf.d/php.ini \
#     && echo "memory_limit = 128M" >> /usr/local/etc/php/conf.d/php.ini

RUN apt-get update \
    && apt-get install -y \
        vim \
        cron \
        nano

ENV EDITOR /usr/bin/nano

RUN usermod -u 1000 www-data
