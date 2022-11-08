#!/bin/bash

LOGS_DIR=/home/udai/console_logs

fileName=$LOGS_DIR/$(date +"%d-%b-%G")-minicom.log

sudo /usr/bin/minicom dev -C $fileName
