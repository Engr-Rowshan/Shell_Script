#!/bin/bash

cd $PWD

echo "##########################"
echo "Saving Ip tables"
iptables-save > /etc/iptables/rules.v4

now=$(date +"%Y-%m-%d-%H-%M-%S")
destFile="iptables-$now$(echo "-archive.tar.gz")"

if [ ! -d /backup/iptables ]
then
	mkdir /backup/iptables
fi

tar -zcvf $destFile /etc/iptables/rules.v4

mv $destFile /backup/iptables/
 
echo "Archived Created and moved"

echo "Backup complete"

