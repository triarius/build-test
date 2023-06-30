#!/usr/bin/env bash

set -Eeuo pipefail

trap "echo pre-exit terming..." SIGTERM

echo "in pre-exit..."
env | grep BUILDKITE
