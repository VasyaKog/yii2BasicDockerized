FROM php:7.1-fpm-alpine

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN apk add --no-cache zip unzip zlib-dev bzip2 xz openssl-dev fontconfig libxrender freetype-dev readline-dev git sudo mysql-client icu-dev libxml2-dev

RUN docker-php-ext-install zip pdo pdo_mysql \
    && docker-php-ext-configure intl --enable-intl \
    && docker-php-ext-configure soap --enable-soap \
    && docker-php-ext-install intl \
    && docker-php-ext-install soap

ADD php.ini /usr/local/etc/php/conf.d/

RUN apk add --no-cache 'su-exec>=0.2' && chmod u+s /sbin/su-exec

ENV user php
RUN addgroup -S $user && adduser -S -G $user $user && \
    echo "$user ALL=(ALL)NOPASSWD: ALL" >> /etc/sudoers

WORKDIR /var/www

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["php-fpm"]
