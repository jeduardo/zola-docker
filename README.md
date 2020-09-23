# zola-docker

This is a simple Docker image that contains the latest
[Zola](https://getzola.org) binary released and packs it into a Docker image
based on `debian-slim`. It's intended to be used for CI/CD workflows.

## Build instructions

```ShellSession
docker build -t zola:latest .
```
