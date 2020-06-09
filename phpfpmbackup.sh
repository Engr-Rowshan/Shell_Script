#!/bin/bash

cd $PWD

echo "##########################"
echo "Turning of PHPFPM"
systemctl stop php7.4-fpm

sleep 3

now=$(date +"%Y-%m-%d-%H-%M-%S")
destFile="phpfpm-$now$(echo "-archive.tar.gz")"

if [ ! -d /backup/phpfpm ]
then
	mkdir /backup/phpfpm
fi

tar -zcvf $destFile /etc/php/7.4/fpm/

mv $destFile /backup/phpfpm/
 
echo "Archived reated and moved"

echo "Starting phpfpm  again"

systemctl start php7.4-fpm

echo "Backup complete"

