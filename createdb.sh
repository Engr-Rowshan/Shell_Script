#!/bin/bash
#This script will create a database with user and password

#Getting the currect directory
curDir=$PWD
#getting the db name from arg
dbname=$1
user="root"
read -s -p "Please enter mysql root password" pass

dbuser=$dbname$(echo _user)
userpass=$(openssl rand -base64 32)


echo "Logging into MySQL"
echo "Creting Database"
mysql -u $user -p$pass <<EOF
CREATE DATABASE $dbname;

GRANT ALL PRIVILEGES ON $dbname.* TO $dbuser@localhost IDENTIFIED BY '$userpass';
EOF

echo "Database: $dbname Created, User: $dbuser; "
echo "Password: $userpass"
echo "Let me know where you want to copy the database creadential? [Must be a writable directiry with trailing /]"
read dest
destpath=$dest$(echo db.env)
echo "HOST=\"localhost\"" >> $destpath
echo "DB=\"$dbname\"" >> $destpath
echo "USER=\"$dbuser\"" >> $destpath
echo "PASSWORD=\"$userpass\"" >> $destpath

echo "Database config saved into $destpath"

