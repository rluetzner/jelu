#!/usr/bin/env bash
# Arguments:
# 1: next version
# 2: channel

source "$(dirname "$0")/docker-common.sh" $1 $2

# Push docker images (built previously)
docker buildx build \
    --platform $PLATFORMS \
    --tag rluetzner/jelu:$DOCKER_CHANNEL \
    --tag rluetzner/jelu:$1 \
    --file ./Dockerfile . \
    --push
