.PHONY: test build run

all: lint test build

lint:
	docker run \
		-t \
		--rm \
		-v ./:/app \
		-w /app \
		golangci/golangci-lint:v1.53.3 \
		golangci-lint run -v

test:
	go test ./...

build:
	go build -o build/pizza main.go

install: build
	sudo mv build/pizza /usr/local/bin/

run:
	go run main.go


