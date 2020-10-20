#!/bin/sh
set -x

PATH_TO_LOGS=chtime_failed.txt
PATH_TO_HOSTS=../hosts.txt

readarray -t hosts < $PATH_TO_HOSTS

for host in "${hosts[@]}"
do
        cat $PATH_TO_LOGS | grep $host | awk 'BEGIN{FS=" "}{print $10}' | uniq > $host.files.txt
        rsync -azh $host.files.txt $host:/home/v.sadovin
done

# haron_count="`ps aux | grep haron | wc -l`"

# if [ "$haron_count" == "2" ]; then
#     echo "Can chown"
# else
#     echo "Can't chown"
# fi

# ionice -c 2 -n 3 chown -R nobody:nobody /storage/*
