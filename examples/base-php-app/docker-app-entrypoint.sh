#!/bin/sh
set -e

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
    set -- php-fpm "$@"
fi

if [ ! -z "$XDEBUG_CONFIG" ]; then
    XDEBUG_SO_PATH="/usr/local/lib/php/extensions/xdebug.so"
    if [ ! -f "$XDEBUG_SO_PATH" ]; then
        wget -O "$XDEBUG_SO_PATH" https://github.com/danilin-em/xdebug-builder/releases/download/v2.9.0/xdebug.so
    fi
    set -- "$@" -d "zend_extension=$XDEBUG_SO_PATH"
fi

exec "$@"
