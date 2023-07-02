#!/usr/bin/env bash

set -euo pipefail

trap "echo sigterm received from sleep script" SIGTERM

echo --- pid: $$
ps -eo pid,ppid,pgid,args | grep $$

echo --- parent pid: $PPID
ps -eo pid,ppid,pgid,args | grep $PPID

sleep 120
