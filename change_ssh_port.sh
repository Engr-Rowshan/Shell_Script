#! /bin/bash
# This Script will get a single parameter as port number and
# change the port number in sshd_config, remove old port from iptables
# change the service port of ssh to new one, add new port to iptables
# and restart the sshd service

FILE="/etc/ssh/sshd_config"
PORT=$1
S="#Port [0-9]\+"
S1="Port [0-9]\+"
D="Port $PORT"

if [ -f "$FILE" ]; then

    sed -i "s/$S/$D/g" $FILE
    sed -i "s/$S1/$D/g" $FILE

else
    echo "sshd_config file not exit in $FILE location"
fi

# Remove iptables rules
iptables -D INPUT -p tcp --dport ssh -j ACCEPT
ip6tables -D INPUT -p tcp --dport ssh -j ACCEPT

# Changing the service port
echo "Changin the service port"
FILE2="/etc/services"
S3="ssh[		]*[0-9]*"
D3="ssh		$PORT"

sed -i "s/$S3/$D3/g" $FILE2

#change iptables
# Remove iptables rules
iptables -A INPUT -p tcp --dport ssh -j ACCEPT
ip6tables -A INPUT -p tcp --dport ssh -j ACCEPT

#save iptables
iptables-save  > /etc/iptables/rules.v4
ip6tables-save > /etc/iptables/rules.v6

# Restarting 
echo "SSH Port changed to $PORT, Restarting sshd service"
systemctl restart sshd
# SSH port change success full