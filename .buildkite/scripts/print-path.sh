#!/usr/bin/env bash

set -eufo pipefail

mkdir -p artifacts
IFS=':'; for i in $PATH; do test -d "$i" && find "$i" -maxdepth 1 -executable -type f -exec basename {} \;; done | sort -u > artifacts/path.txt
