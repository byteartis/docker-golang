ARG GO_VERSION
ARG ALPINE_VERSION

################
# Base Container
################
FROM golang:${GO_VERSION}-alpine${ALPINE_VERSION} AS base

ARG GOLANGCI_LINT_VERSION
ARG DELVE_VERSION

# Install apk dependencies
RUN apk add --no-cache --update \
  gcc \
  musl-dev \
  git \
  openssh \
  openssh-client

# Force git clone to use SSH
RUN git config --global url."git@github.com:".insteadOf "https://github.com/"

# Verify host keys
WORKDIR /root/.ssh
RUN ssh-keyscan -H github.com > known_hosts \
    && chown -R 600 . \
    && mkdir -p -m 0600 ~/.ssh

# Set workdir back to /
WORKDIR /

# Install golangci-lint
RUN curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/HEAD/install.sh | sh -s -- -b $(go env GOPATH)/bin ${GOLANGCI_LINT_VERSION}

# Install debug tool
RUN go install github.com/go-delve/delve/cmd/dlv@${DELVE_VERSION}

# Define final working directory
WORKDIR /go/app
