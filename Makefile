NAME ?= opensips
OPENSIPS_VERSION ?= 3.1
OPENSIPS_BUILD ?= releases
OPENSIPS_DOCKER_REPO ?= cruzccl
OPENSIPS_DOCKER_TAG ?= latest
OPENSIPS_CLI ?= true
OPENSIPS_EXTRA_MODULES ?=

all: build start

.PHONY: build start
build:
	docker build \
		--build-arg=OPENSIPS_BUILD=$(OPENSIPS_BUILD) \
		--build-arg=OPENSIPS_VERSION=$(OPENSIPS_VERSION) \
		--build-arg=OPENSIPS_CLI=${OPENSIPS_CLI} \
		--build-arg=OPENSIPS_EXTRA_MODULES="${OPENSIPS_EXTRA_MODULES}" \
		--tag="$(OPENSIPS_DOCKER_REPO)/opensips:$(OPENSIPS_DOCKER_TAG)" \
		.

start:
	docker run -d --name $(NAME) $(OPENSIPS_DOCKER_REPO)/opensips:$(OPENSIPS_DOCKER_TAG)
