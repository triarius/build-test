#!/usr/bin/env bash

set -euo pipefail

grep MemTotal /proc/meminfo
ls -lA
