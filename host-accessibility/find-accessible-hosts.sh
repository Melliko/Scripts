#!/bin/sh
set -x

PATH_TO_HOSTS=$1
PATH_TO_AVAILABLE_HOSTS=$2

readarray -t hosts < $PATH_TO_HOSTS
readarray -t existing_hosts < $PATH_TO_AVAILABLE_HOSTS

found_flag=0

for i in "${hosts[@]}"
do
	echo "New cycle"
	for j in "${existing_hosts[@]}"
	do
		echo $j
		if [ "$i" == "$j" ]; then
			found_flag=1
			echo "$i" >> accessible.txt
			break
		fi
	done
	
	if [ "$found_flag" == "1" ]; then
		found_flag=0 
	else
		echo "$i" >> unreachable.txt
	fi
done


