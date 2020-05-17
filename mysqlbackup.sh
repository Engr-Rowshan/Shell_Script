#!/bin/bash

now=$(date +"%Y-%m-%d-%H-%M-%S")
dbname=$1
user=backup
password=backup

#creating backup directory
if [ ! -d /backup ]
then
	mkdir /backup
	echo "/backup directory created"
fi

#creating backup/db directory
if [ ! -d /backup/db ]
then
        mkdir /backup/db
        echo "/backup/db directory created"
fi

#creating backup/db/$dbname directory
if [ ! -d /backup/db/$dbname ]
then
        mkdir /backup/db/$dbname
        echo "/backup/db/$dbname directory created"
fi


destpath="/backup/db/$dbname"

filename="$dbname-$now.sql"

dest="$destpath/$filename"

mysqldump $dbname | gzip -c > "$destpath/$dbname-$now.sql.gz"

echo "$dbname successfully backed up into $dest.gz"


