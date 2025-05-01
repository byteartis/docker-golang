# Golang Image

Wrapper around the official [Docker Go](https://hub.docker.com/_/golang) image with some extra Byte Artis dependencies for local development.

## Image Details

### Tool's Versions

| Tool | Version |
| - | - |
| alpine | 3.21 |
| [golang/golangci-lint](https://github.com/golangci/golangci-lint) | v2.1.5 |
| [go-delve/delve](https://github.com/go-delve/delve) | v1.24.2 |

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
