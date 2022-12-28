#!/bin/bash

sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y

sudo useradd -s /bin/bash -d /opt/stack -m stack
sudo chmod +x /opt/stack

sudo echo "stack ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/stack
sudo -u stack -i


git clone https://opendev.org/openstack/devstack 
#caso queira puxar uma outra atualização mais antiga usar no final
#-b stable/#NomeDaAtualização
cd devstack

sudo echo '[[local|localrc]]
ADMIN_PASSWORD=serverEaD
DATABASE_PASSWORD=$ADMIN_PASSWORD
RABBIT_PASSWORD=$ADMIN_PASSWORD
SERVICE_PASSWORD=$ADMIN_PASSWORD
HOST_IP=172.16.1.103
FLAT_INTERFACE=enp3s4f0
FLOATING_RANGE=172.16.1.103/24
FIXED_RANGE=10.11.12.0/24
FIXED_NETWORK_SIZE=256
SWIFT_REPLICAS=1

enable_service s-proxy s-object s-container s-account
enable_plugin magnum http://opendev.org/openstack/magnum
enable_plugin magnum-ui http://opendev.org/openstack/magnum-ui' > /opt/stack/devstack/local.conf
sudo chown stack:stack -R /opt/stack