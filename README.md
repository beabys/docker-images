# docker-images

This repo builds and publishes Docker images under the [`beabys`](https://hub.docker.com/u/beabys) namespace. Currently one active image: **`beabys/php-grpc`** — PHP-FPM with the gRPC extension precompiled and enabled.

**Links:** [Docker Hub](https://hub.docker.com/r/beabys/php-grpc)

## Images

| Image | What it is | Architectures | Status |
| --- | --- | --- | --- |
| [`beabys/php-grpc`](https://hub.docker.com/r/beabys/php-grpc) | PHP-FPM + `grpc` PECL extension | `linux/amd64`, `linux/arm64` | active |


## Build it yourself

Clone and build single-arch (host architecture):

```bash
git clone https://github.com/beabys/docker-images.git
cd docker-images
docker build --build-arg PHP_FPM_VERSION=8.5.12-fpm -f php/Dockerfile-php-grpc -t beabys/php-grpc:local .
docker run --rm beabys/php-grpc:local php -m | grep -i grpc
```

CI builds multi-arch (`linux/amd64` + `linux/arm64`) with `docker buildx` and pushes both platforms in one invocation.

## Release

Push a release tag:

```bash
make php-tag VERSION=8.5.12           # publishes beabys/php-grpc:8.5.12-fpm-grpc
make php-tag VERSION=8.5.12-latest    # also repoints :latest
```

The make target pushes a git tag that GitHub Actions turns into a Docker Hub release. Requires `DOCKER_HUB_USERNAME` and `DOCKER_HUB_ACCESS_TOKEN` secrets configured in the repo.

## Contribute

Flow: fork → branch → change Dockerfile or add new image → build + verify locally → PR.

Adding a new image checklist:

1. Create the Dockerfile (`php/Dockerfile-<name>` or `<tool>/Dockerfile`).
2. Create `.github/workflows/<name>.yml` triggered on tag push, same login + buildx + push shape as `php-fpm-grpc.yml`.
3. Add `<name>-tag` makefile target with `VERSION` variable and usage message.
4. Add row to the Images table above.
5. Add `docs/dockerhub/<name>-overview.md` (and `.html`) for Docker Hub.
6. Build locally, verify extension/tool works, then PR.

## makefile

| Target | Variable | Example |
| --- | --- | --- |
| `php-tag` | `VERSION` (required; append `-latest` to repoint `:latest`) | `make php-tag VERSION=8.5.12` |
