#!/bin/bash
echo "Set Static IP for Ubuntu Sever"
echo "IPv4 address is 192.168.8.___"

read -p 'Host: ' HOST

if [ $HOST -gt 1 ] && [ $HOST -lt 255 ]; then
    sed -i "s/HOST_NUM/$HOST/g" 00-installer-config.yaml &&\
    sudo mv ./00-installer-config.yaml /etc/netplan/ &&\
    sudo netplan apply &&\
    echo "IP Set Successfully!!!" &&\
    sleep 3
    ip address &&\
    sudo apt update &&\
    sudo apt install openssh-server
else
    echo "You enter wrong host number"
fi
