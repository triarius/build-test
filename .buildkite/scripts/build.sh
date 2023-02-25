#!/usr/bin/env bash

set -Eeufo pipefail

QEMU_VERSION=6.2.0

docker run --privileged --userns=host --rm "tonistiigi/binfmt:qemu-v$QEMU_VERSION" --uninstall qemu-*
docker run --privileged --userns=host --rm "tonistiigi/binfmt:qemu-v$QEMU_VERSION" --install all

builder_name=$(docker buildx create --use)
# shellcheck disable=SC2064 # we want the current $builder_name to be trapped, not the runtime one
trap "docker buildx rm $builder_name || true" EXIT

docker buildx build --progress plain --builder "$builder_name" --platform linux/amd64,linux/arm64 .
