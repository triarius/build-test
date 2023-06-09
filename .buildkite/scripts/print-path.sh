#!/usr/bin/env bash

mkdir -p artifacts
IFS=':'; for i in $PATH; do test -d "$i" && find "$i" -maxdepth 1 -executable -type f -exec basename {} \;; done > artifacts/path.txt