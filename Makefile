.DEFAULT_GOAL := build

.PHONY: build
build:
	@cd ./proto && buf generate
