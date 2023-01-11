#!/bin/bash
echo "Set Static IP for Ubuntu Sever"
echo "IPv4 address is 192.168.8.___"

read -p 'Host: ' HOST

if [ $HOST -gt 1 ] && [ $HOST -lt 255 ]; then
    sed -i "s/HOST_NUM/$HOST/g" 00-installer-config.yaml && # change config file with host
    sudo mv ./00-installer-config.yaml /etc/netplan/ && # move config file to /etc/netplan/
    sudo netplan apply && # apply netplan
    echo "IP Set Successfully!!!" &&
    ip address # show current ip address
else
    echo "You enter wrong host number"
fi
