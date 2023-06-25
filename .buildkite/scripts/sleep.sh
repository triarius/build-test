#!/usr/bin/env bash

set -euo pipefail

trap "echo sleep terming..." SIGTERM

mkdir -p tests
touch tests/test.txt

sleep "$@"
