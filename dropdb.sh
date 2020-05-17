#!/bin/bash
#This script will create a database with user and password

#Getting the currect directory
curDir=$PWD
#getting the db name from arg
dbname=$1
user="root"
echo "Please enter mysql root password"
read pass


dbuser=$dbname$(echo _user)
userpass=$(openssl rand -base64 32)


echo "Logging into MySQL"
echo "Dropomg Database"
mysql -u $user -p$pass <<EOF
DROP DATABASE $dbname;

GRANT ALL PRIVILEGES ON $dbname.* TO $dbuser@localhost IDENTIFIED BY '$userpass';
EOF

echo "Database: $dbname Dropped"