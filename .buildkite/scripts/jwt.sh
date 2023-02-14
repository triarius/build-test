#!/usr/bin/env bash

set -Eexufo pipefail

failure() {
  local lineno=$1
  local msg=$2
  echo "Failed at $lineno: $msg" >&2
}

trap 'failure ${LINENO} "$BASH_COMMAND"' ERR

# docker buildx build --progress=plain -t jwt:latest .
#
# function jwt {
#   docker run --rm -i -e FORCE_COLOR=3 jwt:latest
# }


echo --- :key: OIDC Tokens

buildkite-agent oidc request-token --claim organization_id --claim pipeline_id
