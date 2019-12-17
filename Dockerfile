FROM php:7.4-cli

ARG VERSION

COPY scripts/copy.sh /copy

RUN set -ex;\
	apt-get update;\
	apt-get install -y unzip

ADD https://github.com/xdebug/xdebug/archive/$VERSION.zip xdebug.zip

RUN set -ex;\
	unzip xdebug.zip;\
	mv /xdebug-$VERSION /xdebug

WORKDIR /xdebug

RUN set -ex;\
	./rebuild.sh
