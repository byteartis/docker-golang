# Golang Image

Wrap the official [Golang](https://hub.docker.com/_/golang) image and adds several
tools for local development

## Image Details

### Tool's Versions

| Tool | Version |
| - | - |
| golang | 1.17.6 |
| alpine | 3.15 |
| [golang/golangci-lint](https://golangci-lint.run) | v1.44.0 |
| [cespare/reflex](https://github.com/cespare/reflex) | v0.3.1 |
| [go-delve/delve](https://github.com/go-delve/delve) | v1.8.0 |

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
