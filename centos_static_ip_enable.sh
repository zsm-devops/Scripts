#!/bin/bash

if [ -f "/etc/sysconfig/network-scripts/ifcfg-enp0s8" ]; then
   echo "File exist"
else
   cat > /etc/sysconfig/network-scripts/ifcfg-enp0s8 <<EOF
DEVICE="enp0s8"
BOOTPROTO="static"
NM_CONTROLLED="yes"
ONBOOT="yes"
TYPE="Ethernet"
IPADDR="192.168.56.108"
NETMASK="255.255.255.0"
GATEWAY="192.168.56.1"
DNS1="192.168.56.108"

EOF
   ifdown enp0s8
   sleep 3
   ifup enp0s8
   systemctl restart NetworkManager
#   nmcli networking off
#   nmcli networking on

fi

#dnf install -y openssh-server
