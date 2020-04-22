#!/usr/bin/env bash

#tar -czf /tmp/myhomebak.tar.gz /home/rowshan 2> /dev/null
stat_time=$(date)

#Startig the counting and compression
clear

echo "Backup Starting at: ${stat_time}/n"
printf "\n"
tar cf - /home/rowshan -P 2> /dev/null | pv -s $(du -sb /home/rowshan 2> /dev/null | awk '{print $1}')  | gzip > /tmp/rowshan.bak.tar.gz
end_time=$(date)
printf "\n"
echo "Backup End at: ${end_time}"
