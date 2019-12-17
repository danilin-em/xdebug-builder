#!/bin/bash

if [[ ! -d /dist ]]; then
    mkdir /dist
fi

set -ex

rm -rf /dist/*

cp /xdebug/modules/xdebug.so /dist/xdebug.so

if [[ $1 ]]; then
    chown -R "$1" /dist
fi
