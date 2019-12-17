#!/bin/bash

if [[ ! $1 ]]; then
    echo "Usage: /copy USER_ID:USER_GROUP_ID"
    exit 1
fi

if [[ ! -d /dist ]]; then
    mkdir /dist
fi

set -ex

rm -rf /dist/*

cp /xdebug/modules/xdebug.so /dist/xdebug.so

chown -R "$1" /dist
