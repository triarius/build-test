#!/usr/bin/env bash

set -Eeufo pipefail

echo Hello from Build "$BUILDKITE_BUILD_NUMBER" > hello.txt

echo --- :s3::arrow_up: Uploading to S3

aws s3 cp hello.txt "s3://buildkite-nepa-test-oidc/${BUILDKITE_BUILD_NUMBER}/hello.txt"
aws s3 cp hello.txt "s3://buildkite-nepa-test-oidc/${BUILDKITE_BRANCH}/hello.txt"
