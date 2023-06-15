#!/usr/bin/env bash

set -euo pipefail

trap "echo sleep terming..." SIGTERM

sleep "$@"
