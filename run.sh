#!/usr/bin/env bash

set -euo pipefail

bash --version
buildkite-agent --version

grep MemTotal /proc/meminfo
ls -lA
