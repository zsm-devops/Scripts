#!/bin/bash

if [ -f "/etc/sysconfig/network-scripts/ifcfg-enp0s8" ]; then
   echo "File exist"
else
   cat > /etc/netplan/my_settings.yaml <<EOF
DEVICE="enp0s8"
BOOTPROTO="static"
NM_CONTROLLED="yes"
ONBOOT="yes"
TYPE="Ethernet"
IPADDR="192.168.56.103"
NETMASK="255.255.255.0"
GATEWAY="192.168.56.1"
DNS1="8.8.8.8"

EOF

   systemctl restart network
fi

apt install -y openssh-server
