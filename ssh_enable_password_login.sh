#!/bin/bash

FILE="/etc/ssh/sshd_config"

PORT=$1
S1="#PasswordAuthentication yes"
S2="#PasswordAuthentication no"
S3="PasswordAuthentication no"
D="PasswordAuthentication yes"

if [ -f "$FILE" ]; then

    sed -i "s/$S1/$D/g" $FILE
    sed -i "s/$S2/$D/g" $FILE
    sed -i "s/$S3/$D/g" $FILE

else
    echo "sshd_config file not exit in $FILE location"
fi

# Restarting 
echo "SSH Password login enabled, Don't forget to disable it, Restarting sshd service"
systemctl restart sshd