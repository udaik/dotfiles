#!/bin/bash

echo -n "Create session: session name: "

tmux -V foo >/dev/null 2>&1 || { echo >&2 "tmux not installed.  Aborting."; exit 1; }

read session_name 

exec tmux -u new -s "$session_name"
