.PHONY: build clean down up perms rmq-perms

DOCKER_FRESH ?= false
RABBITMQ_DOCKER_TAG ?= rabbitmq:3-management

clean: perms
	git clean -xffd

down:
	docker compose down

build:
ifeq ($(DOCKER_FRESH),true)
	docker compose build --no-cache --pull --build-arg RABBITMQ_DOCKER_TAG=$(RABBITMQ_DOCKER_TAG)
else
	docker compose build --build-arg RABBITMQ_DOCKER_TAG=$(RABBITMQ_DOCKER_TAG)
endif

up: rmq-perms build
ifeq ($(DOCKER_FRESH),true)
	docker compose up --pull always
else
	docker compose up
endif

perms:
	sudo chown -R "$$(id -u):$$(id -g)" data log

rmq-perms:
	sudo chown -R '999:999' data log
