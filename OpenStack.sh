#Script para a criação do usuario stack
#Adicioná-lo ao grupo de administradores
#E clonar o repositório do devstack mais recente

#!/bin/bash

sudo apt update
sudo apt upgrade && dist-upgrade -y

sudo useradd -s /bin/bash -d /opt/stack -m stack
sudo chmod +x /opt/stack

sudo echo "stack ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/stack
sudo -u stack -i


git clone https://opendev.org/openstack/devstack 
#caso queira puxar uma outra atualização mais antiga usar no final "-b stable/#NomeDaAtualização"
cd devstack

sudo chown stack:stack -R /opt/stack

###Caso queira fazer por linha de comando cada um dos comando acima também é possivel###
