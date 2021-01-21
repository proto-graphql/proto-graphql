.DEFAULT_GOAL := build

.PHONY: build
build: build-go

.PHONY: build-go
build-go:
	@cd go && $(MAKE) build
