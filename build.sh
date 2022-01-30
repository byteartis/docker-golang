#!/bin/bash

GO_VERSION=1.17.6
ALPINE_VERSION=3.15
GOLANGCI_LINT_VERSION=v1.44.0
REFLEX_VERSION=v0.3.1
DELVE_VERSION=v1.8.0

# Full image name
FULL_NAME="ealves/golang"

# Tags for prod and dev images
LATEST="$FULL_NAME:latest"

# Simple golang version <major>.<minor>
GO_MINOR_VERSION="${GO_VERSION%\.*}"
GO_MAJOR_VERSION="${GO_MINOR_VERSION%.*}"

docker_build() {
  # Build the image
  docker build \
    --build-arg GO_VERSION=$GO_VERSION \
    --build-arg ALPINE_VERSION=$ALPINE_VERSION \
    --build-arg GOLANGCI_LINT_VERSION=$GOLANGCI_LINT_VERSION \
    --build-arg REFLEX_VERSION=$REFLEX_VERSION \
    --build-arg DELVE_VERSION=$DELVE_VERSION \
    -t $LATEST \
    .

  local VERSIONS=(
    "$FULL_NAME:alpine"
    "$FULL_NAME:alpine$ALPINE_VERSION"
    "$FULL_NAME:$GO_MAJOR_VERSION-alpine"
    "$FULL_NAME:$GO_MAJOR_VERSION-alpine$ALPINE_VERSION"
    "$FULL_NAME:$GO_MINOR_VERSION-alpine"
    "$FULL_NAME:$GO_MINOR_VERSION-alpine$ALPINE_VERSION"
    "$FULL_NAME:$GO_VERSION-alpine"
    "$FULL_NAME:$GO_VERSION-alpine$ALPINE_VERSION"
  )

  for v in "${VERSIONS[@]}"; do
    docker tag $LATEST $v
    docker push $v
  done
}

# Build prod image
docker_build
