# Golang Image

Wrapper around the official [Docker Go](https://hub.docker.com/_/golang) image with some extra Byte Artis dependencies for local development.

## Image Details

### Tool's Versions

| Tool | Version |
| - | - |
| alpine | 3.19 |
| [golang/golangci-lint](https://github.com/golangci/golangci-lint) | v1.59.1 |
| [cespare/reflex](https://github.com/cespare/reflex) | v0.3.1 |
| [go-delve/delve](https://github.com/go-delve/delve) | v1.22.1 |
| [ory/go-acc](https://github.com/ory/go-acc) | v0.2.8 |

### Configurations

1. Git is configured to use SSH instead of HTTPS
2. Git keys are added to known_hosts already
3. Default WORKDIR is `/go/app`

The following apk dependencies are installed by default:

- gcc
- musl-dev
- git
- openssh
- openssh-client
