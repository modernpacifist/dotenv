#!/bin/bash

set -e 

while :
do
    read line
    value=$(awk '{printf("%d:%02d:%02d:%02d\n",($1/60/60/24),($1/60/60%24),($1/60%60),($1%60))}' /proc/uptime)
    echo $value > /tmp/i3statusuptime
    block='{"full_text":""}'
    echo "${line/\[\{/\[$block,\{}" || exit 1
done
