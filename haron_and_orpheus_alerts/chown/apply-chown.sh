#!/bin/sh
set -x

HOSTNAME=`hostname | awk 'BEGIN{FS="."}{print $1}'`
PATH_TO_FILE=/home/v.sadovin/${HOSTNAME}.files.txt


readarray -t files < ${PATH_TO_FILE}

for file in "${files[@]}"
do
        chown nobody:nobody $file
done
rm $PATH_TO_FILE
