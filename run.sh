#!/usr/bin/env bash

set -euo pipefail

bash --version
buildkite-agent --version
docker compose version

buildkite-agent oidc token || true
buildkite-agent oidc token --audience sts.amazonaws.com || true
echo "$BUILDKITE_OIDC_TOKEN"

echo "Hello From Nepa"
