#!/usr/bin/env bash

set -euo pipefail

bash --version
buildkite-agent --version
docker compose version

buildkite-agent oidc token
buildkite-agent oidc token --audience sts.amazonaws.com

echo "Hello From Nepa"
