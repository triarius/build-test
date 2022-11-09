#!/usr/bin/env bash

set -euo pipefail

bash --version
buildkite-agent --version
docker compose version

echo "Hello From Nepa"
