#!/bin/bash

cd $PWD

echo "##########################"
echo "Turning of nginx"
systemctl stop nginx

sleep 3

now=$(date +"%Y-%m-%d-%H-%M-%S")
destFile="nginx-$now$(echo "-archive.tar.gz")"

if [ ! -d /backup/nginx ]
then
	mkdir /backup/nginx
fi

tar -zcvf $destFile /etc/nginx/sites-available /etc/nginx/conf.d /etc/nginx/nginx.conf /etc/nginx/conf.d

mv $destFile /backup/nginx/
 
echo "Archived Created and moved"

echo "Starting nginx again"

systemctl start nginx

echo "Backup complete"

