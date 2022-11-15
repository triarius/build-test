#!/usr/bin/env bash

set -Eexufo pipefail

failure() {
  local lineno=$1
  local msg=$2
  echo "Failed at $lineno: $msg" >&2
}

trap 'failure ${LINENO} "$BASH_COMMAND"' ERR

bash --version
buildkite-agent --version

buildkite-agent oidc request-token | jwt
buildkite-agent oidc request-token --audience sts.amazonaws.com | jwt
buildkite-agent oidc request-token --audience sts.amazonaws.com --lifetime 600 | jwt

echo "Hello From Nepa"
