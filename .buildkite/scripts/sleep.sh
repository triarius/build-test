#!/usr/bin/env bash

set -euo pipefail

trap "echo sigterm received from sleep script" SIGTERM

mkdir -p tests
touch tests/test.txt

echo pid: $$
ps -eo pid,ppid,pgid,args | grep $$

echo parent pid: $PPID
ps -eo pid,ppid,pgid,args | grep $PPID

echo printing process tree of grandparent
pstree -hp "$(ps -o ppid= -p $PPID)"

sleep 60
