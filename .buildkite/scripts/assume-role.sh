#!/usr/bin/env bash

set -Eeuo pipefail

aws sts get-caller-identity

ASSUME_ROLE_OUTPUT=$(aws sts assume-role --role-arn arn:aws:iam::253213882263:role/nepa-test-latest-Role --role-session-name test-self-assume)

AWS_ACCESS_KEY_ID=$(echo "$ASSUME_ROLE_OUTPUT" | jq -r '.Credentials.AccessKeyId')
AWS_SECRET_ACCESS_KEY=$(echo "$ASSUME_ROLE_OUTPUT" | jq -r '.Credentials.SecretAccessKey')
AWS_SESSION_TOKEN=$(echo "$ASSUME_ROLE_OUTPUT" | jq -r '.Credentials.SessionToken')

export AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY
export AWS_SESSION_TOKEN
aws sts get-caller-identity
