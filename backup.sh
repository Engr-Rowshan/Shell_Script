#!/bin/bash

cd $PWD

echo "###############################"
echo "1. Starting DB Backup"
./dbbackup.sh
echo "All Database Backup Complete"
echo "###############################"

echo "2. Nginx Backup Starting"
./nginxbackup.sh
echo "Nginx Backup Complete"
echo "###############################"

echo "3. Php FPM Backup Starting"
./phpfpmbackup.sh
echo "Php FPM Backup Complete"
echo "###############################"

echo "4. IPTABLES Backup Starting"
./iptablesbackup.sh
echo "IPTABLES Backup Complete"
echo "###############################"

