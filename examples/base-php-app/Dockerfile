FROM php:7.4-fpm-alpine

ADD docker-app-entrypoint.sh /docker-app-entrypoint

ENTRYPOINT ["/docker-app-entrypoint"]

CMD ["php-fpm"]

ADD src /var/www/html
