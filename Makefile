#!make
include .env

DOCKER_REPO=docker.io/danilinem/xdebug-builder:$(VERSION)

help:
	echo "Usage:"
	echo "	make build	Build image"
	echo "	make env	Run env"
	echo "	make copy	Copy module"
	echo "	make copy-root	Copy module (as root)"
	echo "	make push	Push image to https://hub.docker.com"
build:
	docker build --build-arg VERSION=$(VERSION) -t localhost/xdebug-builder:latest -t localhost/xdebug-builder:$(VERSION) .
env:
	docker run --rm -it -v `pwd`/dist:/dist localhost/xdebug-builder:latest bash
copy:
	docker run --rm -v `pwd`/dist:/dist localhost/xdebug-builder:latest /copy `id -u`:`id -g`
copy-root:
	docker run --rm -v `pwd`/dist:/dist localhost/xdebug-builder:latest /copy
push:
	docker tag localhost/xdebug-builder:$(VERSION) $(DOCKER_REPO)
	docker push $(DOCKER_REPO)
