
IMAGE_NAME = s2d-centos7

.PHONY: build
build:
	docker build -t $(IMAGE_NAME) .

