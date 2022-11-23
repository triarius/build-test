#!/usr/bin/env bash

set -Eeufxo pipefail

echo Hello from Build "$BUILDKITE_BUILD_NUMBER" > hello.txt

aws s3 cp hello.txt "s3://buildkite-nepa-test-oidc/${BUILDKITE_BUILD_NUMBER}/hello.txt"
aws s3 cp hello.txt "s3://buildkite-nepa-test-oidc/${BUILDKITE_BRANCH}/hello.txt"
