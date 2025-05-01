#!/bin/bash

ALPINE_VERSION=3.21
GOLANGCI_LINT_VERSION=v2.1.5
DELVE_VERSION=v1.24.2

# Full image name
FULL_NAME="byteartis/golang"

# Simple golang version <major>.<minor>
GO_MINOR_VERSION="${GO_VERSION%\.*}"
GO_MAJOR_VERSION="${GO_MINOR_VERSION%.*}"

docker_build() {
    # Build the image
    docker buildx build --platform linux/amd64,linux/arm64/v8 \
        --build-arg GO_VERSION=$GO_VERSION \
        --build-arg ALPINE_VERSION=$ALPINE_VERSION \
        --build-arg GOLANGCI_LINT_VERSION=$GOLANGCI_LINT_VERSION \
        --build-arg DELVE_VERSION=$DELVE_VERSION \
        -t $FULL_NAME:latest \
        -t $FULL_NAME:alpine \
        -t $FULL_NAME:alpine$ALPINE_VERSION \
        -t $FULL_NAME:$GO_MAJOR_VERSION-alpine \
        -t $FULL_NAME:$GO_MAJOR_VERSION-alpine$ALPINE_VERSION \
        -t $FULL_NAME:$GO_MINOR_VERSION-alpine \
        -t $FULL_NAME:$GO_MINOR_VERSION-alpine$ALPINE_VERSION \
        -t $FULL_NAME:$GO_VERSION-alpine \
        -t $FULL_NAME:$GO_VERSION-alpine$ALPINE_VERSION \
        --push \
        .
}

# Build prod image
docker_build
