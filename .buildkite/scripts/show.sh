#!/usr/bin/env bash

set -Eeufo pipefail

function inline_image {
  printf '\033]1338;url='"%s"';alt='"%s"'\a\n' "$1" "$2"
}

inline_image "artifact://artifacts/$BUILDKITE_BUILD_NUMBER/logo.png" 'OMG'
inline_image "artifact://artifacts/$BUILDKITE_BUILD_NUMBER/logo 1.png" 'OMG'
