.PHONY: build
build:
	@go generate ./tools.go
	@../scripts/protocw \
		-I .. \
		--plugin=protoc-gen-go='./bin/protoc-gen-go' \
		--go_opt=module=github.com/proto-graphql/proto-graphql/go \
    --go_out=. \
		../graphql/*.proto
