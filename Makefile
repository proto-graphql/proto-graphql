.DEFAULT_GOAL := build

.PHONY: build
build:
	buf generate
