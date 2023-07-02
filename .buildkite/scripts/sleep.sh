#!/usr/bin/env bash

set -euo pipefail

trap "echo sigterm received from sleep script" SIGTERM

mkdir -p tests
touch tests/test.txt

sleep 60
