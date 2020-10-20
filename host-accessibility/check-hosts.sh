#!/bin/sh
#set -x

USER=v.sadovin
PATH_TO_HOSTS_FILE=$1

readarray -t array < $PATH_TO_HOSTS_FILE
counter=1

for i in "${array[@]}"
do
	ssh -o BatchMode=yes -o ConnectTimeout=2 -o StrictHostKeyChecking=no ${USER}@${i} exit >& buffer.txt
	result=$?
	if [ "$result" == "0" ]; then
		echo "${i}" >> available.txt
	else
		echo "1!${i}: `cat buffer.txt`" >> unreachable.txt
	fi
	echo $counter
	counter=$((counter + 1)) 
done
