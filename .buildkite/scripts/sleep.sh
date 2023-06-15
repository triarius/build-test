#!/usr/bin/env bash

set -euo pipefail

trap "echo sleep terming..."

sleep "$@"
