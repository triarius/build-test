#!/usr/bin/env bash

set -Eeufo pipefail

function inline_image {
  printf '\033]1338;url='"%s"';alt='"%s"'\a\n' "$1" "$2"
}

mkdir -p "artifacts/$BUILDKITE_BUILD_NUMBER"

curl -sSL https://buildkite.com/_site/favicon.png > "artifacts/${BUILDKITE_BUILD_NUMBER}/logo.png"
curl -sSL https://buildkite.com/_site/favicon.png > "artifacts/${BUILDKITE_BUILD_NUMBER}/logo 1.png"

buildkite-agent artifact upload 'artifacts/**/*.png'

inline_image "artifact://artifacts/$BUILDKITE_BUILD_NUMBER/logo.png" 'OMG'
inline_image "artifact://artifacts/$BUILDKITE_BUILD_NUMBER/logo 1.png" 'OMG'
