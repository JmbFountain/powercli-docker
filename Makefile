#vars
TAG=powercli:${shell git rev-parse --short HEAD}

.PHONY: help build clean


.DEFAULT_GOAL := build

help: 
	@echo "just make to create the image, make clean to clean your docker stuff up"
build:
	docker build -t ${TAG} .

clean:
	@docker container prune
	@docker image prune -a
