#!/bin/bash

tmux -V foo >/dev/null 2>&1 || { echo >&2 "tmux not installed.  Aborting."; exit 1; }

sessions=`tmux ls | awk -F\: '{print $1}'`

counter=1
echo "List of available sessions:" 

for session in $sessions; do 
    echo -e '\t' $counter: $session
    let counter+=1
done

echo -n "Set session (q to quit) : "
read session_id

counter=0

if [ $session_id == 'q' ]; then
    exit 0
fi

for session in $sessions; do 
    let counter+=1
    if [ $counter == $session_id ]; then
        exec tmux -u attach -t $session
    fi
done

