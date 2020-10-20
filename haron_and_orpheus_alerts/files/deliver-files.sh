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
