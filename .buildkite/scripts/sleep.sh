#!/usr/bin/env bash

set -euo pipefail

trap "sleep infinity" SIGTERM

mkdir -p tests
touch tests/test.txt

sleep 60
