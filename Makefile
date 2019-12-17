#!make
include .env

help:
	echo "Usage:"
	echo "	make build	Build image"
	echo "	make env	Run env"
	echo "	make copy	Copy module"
build:
	docker build --build-arg VERSION=$(VERSION) -t localhost/xdebug-builder:latest -t localhost/xdebug-builder:$(VERSION) .
env:
	docker run --rm -it localhost/xdebug-builder:latest bash
copy:
	docker run --rm -it localhost/xdebug-builder:latest -v `pwd`/dist:/dist /copy `id -u`:`id -g`
