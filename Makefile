VERSION?=v1.20.0
IMAGE_NAME?=josefuentes/kubectl
IMAGE_VERSION?=$(VERSION)
IMAGE_TAG?=$(IMAGE_NAME):$(IMAGE_VERSION)
PLATFORMS?=linux/arm/v7,linux/arm64/v8,linux/amd64
BUILDX_EXTRA_ARGS?=

push_args=--push $(BUILDX_EXTRA_ARGS)
build_args=$(BUILDX_EXTRA_ARGS)

.PHONY: _docker-%
_docker-%:
	docker buildx build --platform $(PLATFORMS) \
	--build-arg KUBECTL_VERSION=$(VERSION) \
	--tag $(IMAGE_TAG) \
	$($*_args) \
	.

.PHONY: docker-build
docker-build: _docker-build

.PHONY: docker-push
docker-push: _docker-push
