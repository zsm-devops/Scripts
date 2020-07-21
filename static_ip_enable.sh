#!/bin/bash

if [ -f "/etc/netplan/my_settings.yaml" ]; then
   echo "File exist"
else
   cat > /etc/netplan/my_settings.yaml <<EOF
#  Let NetworkManager manage all devices on this system
network:
  version: 2
  renderer: NetworkManager
  ethernets:
    enp0s8:
      dhcp4: no
      dhcp6: no
      addresses: [192.168.56.104/24, ]
      gateway4: 192.168.56.1
      nameservers:
        addresses: [8.8.8.8, ]


EOF

   netplan apply
fi

apt install -y openssh-server


