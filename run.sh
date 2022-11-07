#!/usr/bin/env bash

set -Eeufxo pipefail

grep MemTotal /proc/meminfo
ls -lA
