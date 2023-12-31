ifeq ($(OS),Windows_NT)
	BINARY_FILE=goboundcheck.exe
else
	BINARY_FILE=goboundcheck
endif

all: golangci gosec compile test

golangci:
	golangci-lint run ./...

gosec:
	gosec run ./...

compile:
	go build -o ${BINARY_FILE} ./cmd/goboundcheck

test:
	go test ./...

clean:
	go clean
	rm ${BINARY_FILE}