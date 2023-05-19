#!/usr/bin/env bash

set -Eeufo pipefail

printf "\x1b]1339;url=\"https://example.com/path?a=b&c=d#frag\"\x07a"
