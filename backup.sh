#!/usr/bin/env bash

if [ -z $1]; then
	echo "Please metion a directory or file to backuo"
	echo "Backup not succesful"
	exit 1
else
	input=$1
fi

if [ -z $2 ]; then
	echo "Destination file not set."
	echo "Mention destion as 2nd parameter"
	exit 2
else
	output=$2
fi

#tar -czf /tmp/myhomebak.tar.gz /home/rowshan 2> /dev/null
stat_time=$(date)

#Startig the counting and compression
clear

echo "Backup Starting at: ${stat_time}/n"
printf "\n"
tar cf - $input -P 2> /dev/null | pv -s $(du -sb $input 2> /dev/null | awk '{print $1}')  | gzip > $output
end_time=$(date)
printf "\n"
echo "Backup End at: ${end_time}"
