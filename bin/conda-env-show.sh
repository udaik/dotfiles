#!/bin/bash

conda -V > /dev/null 2>&1 || { echo >&2 "conda not installed.  Aborting."; exit 1; }

environs=`conda env list | grep -v \# | awk -F\  '{print $1}'`
echo "List of available environs: " 

counter=1
echo -e "env name \t python version"
echo -e "-------- \t --------------"


for environ in $environs; do 
    pypath=`conda-env list | grep -v base| grep -v '*' |grep -v '#' | awk -F\  '{print $2}'`
    pyversion=`$pypath/bin/python -V 2>&1 | tr '\r\n' ' ' `
    echo -e $environ '\t\t' $pyversion

    let counter+=1
done

echo "activate env 'source activate env-name'"
exit 0

echo -n "Set environ (q to quit) : "
read environ_id

counter=0

if [ $environ_id == 'q' ]; then
    exit 0
fi

for environ in $environs; do 
    let counter+=1
    if [ $counter == $environ_id ]; then
        set -x 
        exec ". $ACTIVATE $environ"
    fi
done

