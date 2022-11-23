#!/usr/bin/env bash

set -Eexufo pipefail

failure() {
  local lineno=$1
  local msg=$2
  echo "Failed at $lineno: $msg" >&2
}

trap 'failure ${LINENO} "$BASH_COMMAND"' ERR

echo "Hello From Nepa"

bash --version
buildkite-agent --version
