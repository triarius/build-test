#!/usr/bin/env bash

set -Eeufo pipefail

echo -n "$BUILDKITE_AGENT_ACCESS_TOKEN" | sha256sum
