image=localhost/xdebug-builder/examples/base-php-app
tag=latest
hostname=$(shell hostname)
XDEBUG_CONFIG=remote_host=$(hostname) remote_port=9000 remote_enable=1 remote_autostart=1
all: build run

build:
	docker build -t $(image):$(tag) .
run:
	docker run --rm \
		-p 8080:8080 \
		-v `pwd`/src:/var/www/html \
		-e XDEBUG_CONFIG='$(XDEBUG_CONFIG)' \
			$(image):$(tag) php -S 0.0.0.0:8080
