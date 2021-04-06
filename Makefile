COMMIT:=$(shell git rev-list -1 HEAD)
VERSION?=$(COMMIT)
DOCKER_IMG?=josefuentes/kubectl:$(VERSION)
PLATFORMS?=linux/arm/v7,linux/arm64/v8,linux/amd64

.PHONY: docker-build
docker-build:
	docker buildx build --platform $(PLATFORMS) --tag $(DOCKER_IMG) .

.PHONY: docker-push
docker-push:
	docker buildx build --platform $(PLATFORMS) --tag $(DOCKER_IMG) --push .
