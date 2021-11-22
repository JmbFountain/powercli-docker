#vars
IMG=powercli
TAG=${shell git rev-parse --short HEAD}

.PHONY: help build clean export


.DEFAULT_GOAL := build

help: 
	@echo "just make to create the image, make clean to clean your docker stuff up"
	@echo "'make export' creates a tar.gz file with the created image"
build:
	docker build -t ${IMG}:${TAG} .

export:
	docker save -o ./${IMG}${TAG}.tar.gz powercli

clean:
	@docker container prune
	@docker image prune -a
	@rm *.gz
