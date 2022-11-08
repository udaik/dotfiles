#!/bin/bash

sessions=`tmux ls | awk -F\: '{print $1}'`

counter=1
echo "List of available sessions:" 

for session in $sessions; do 
    echo -e '\t' $counter: $session
    let counter+=1
done

