.PHONY: help deploy build sh

IMAGE?=pemcconnell/docker-burpsuite
TAG?=1.7.22-alpine

help: ## shows all available targets
	@echo ""
	@echo "Docker ~ BURP (free)"
	@echo ""
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/\(.*\)\:.*##/\1:/'
	@echo ""

deploy: build ## builds and pushes the locally taggged image to docker hub
	docker push ${IMAGE}:${TAG}

build: ## build and tag our image.
	@if [ "${TAG}" = "" ]; then \
	  echo "TAG not set, or blank"; \
	  exit 1; \
	fi;
	docker build -t ${IMAGE}:${TAG} .

sh: build ## execute 'sh' inside the container
	docker run --rm --entrypoint sh -ti ${IMAGE}:${TAG}
