VERSION ?= v0.3.6
REPO ?= cargo.caicloudprivatetest.com/caicloud

.PHONY: build-local build-linux docker-build docker-push

build-local:
	go build -o adapter .

build-linux:
	GOOS=linux GOARCH=amd64 go build -o adapter 

docker-build: build-linux
	docker build -t $(REPO)/opentsdb-adapter .

docker-push: docker-build
	docker push $(REPO)/opentsdb-adapter
