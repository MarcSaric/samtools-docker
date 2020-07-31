VERSION = 1.1
DOCKER_REPO = samtools

DOCKER_URL := quay.io/ncigdc
DOCKER_IMAGE := ${DOCKER_URL}/${DOCKER_REPO}:${VERSION}

.PHONY: version version-* name
name:
	@echo ${NAME}

version:
	@echo --- VERSION: ${VERSION} ---

version-docker:
	@echo ${DOCKER_IMAGE_COMMIT}
	@echo ${DOCKER_IMAGE}

.PHONY: docker-*
docker-login:
	@echo
	docker login -u=${QUAY_USERNAME} -p=${QUAY_PASSWORD} quay.io

.PHONY: build build-*
build: build-docker

build-docker:
	@echo
	@echo -- Building docker --
	docker build . \
		--no-cache \
		--file ./Dockerfile \
		--build-arg VERSION=${VERSION} \
		-t "${DOCKER_IMAGE}"

.PHONY: publish
publish: docker-login
	docker push ${DOCKER_IMAGE}

