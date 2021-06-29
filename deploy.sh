#!/bin/sh

set -e

export DOCKER_REPO=${1:-balenablocks}/glances
export GLANCES_TAG=${2:-3.1.7}

export DOCKER_CLI_EXPERIMENTAL=enabled

docker run --rm --privileged multiarch/qemu-user-static:5.2.0-2 --reset -p yes

docker buildx build . \
    --pull \
    --platform linux/amd64,linux/386,linux/arm64,linux/arm/v7,linux/arm/v6 \
    --build-arg GLANCES_TAG \
    --tag "${DOCKER_REPO}:${GLANCES_TAG}" \
    --tag "${DOCKER_REPO}:latest" \
    --push
