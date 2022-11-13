#!/usr/bin/env bash

set -Eeufo pipefail

failure() {
  local lineno=$1
  local msg=$2
  echo "Failed at $lineno: $msg" >&2
}

trap 'failure ${LINENO} "$BASH_COMMAND"' ERR

bash --version
buildkite-agent --version
docker compose version

buildkite-agent oidc request-token
buildkite-agent oidc request-token --audience sts.amazonaws.com

echo "$BUILDKITE_OIDC_TOKEN"

echo "Hello From Nepa"
