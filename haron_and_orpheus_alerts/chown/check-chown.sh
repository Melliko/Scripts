#!/bin/sh
set -x

haron_count="`ps aux | grep haron | wc -l`"

if [ "$haron_count" == "2" ]; then
    echo "Can chown"
else
    echo "Can't chown"
fi
