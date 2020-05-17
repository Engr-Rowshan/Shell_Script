#!/bin/bash

cd $PWD

echo "DB: bictea_database backing up"
./mysqlbackup.sh bictea_database
echo "DB: bictea_database backed up"

echo "DB: nmcint backing up"
./mysqlbackup.sh nmcint
echo "DB: nmcint backed up"

