#!/usr/bin/env bash

set -euo pipefail

bash --version
buildkite-agent --version
docker compose version

buildkite-agent oidc request-token
buildkite-agent oidc request-token --audience sts.amazonaws.com

echo "$BUILDKITE_OIDC_TOKEN"

echo "Hello From Nepa"
