#Openstack
Arquivos que contém as configuração do Devstack para a instalação do 
                        OPENSTACK
                            
###################### Ordem das configurações: ######################

1 - Modificar a zona do sistema 
---------------------------------------------------------------------------------------------------------------------------
Digitar o comando "timedatectl list-timezone" para listar as zonas.

Escolher a zona desejada.

Para modfiicar, utilizar o comando "timedatectl set-timezone " seguido da zona desejada. 

Depois reiniciaro serviço de timezone do Systemd 
Utilizando o comando "systemctl restart systemd-timedated"
---------------------------------------------------------------------------------------------------------------------------
 2 - Openstack.sh
  Caso queira usar o arquivo, contrário utilizar os comandos citados nele.

 3 - 00-installer-config.yaml -->> /etc/netplan
 
 4 - resolved.conf ------------->> /etc/systemd
---------------------------------------------------------------------------------------------------------------------------
Após a configuração do resolved.conf aplique as configurações:
Digite o comando: netplan apply (aplicar as configurações do arq 000)
"systemctl restart systemd-resolved" (aplicar as configurações DNS do resolved)
---------------------------------------------------------------------------------------------------------------------------
 5 - local.conf ---------------->> /opt/stack/devstack
 
 6 - stack.sh  ----------------->> /opt/stack/devstack
---------------------------------------------------------------------------------------------------------------------------
 Dica 1:
 Caso de erro de compressão na página http, utilizar sujestão abaixo.

 ###### ERROR OfflineGenerationError at /auth/login/ ######

 - ir até o destino "/opt/stack/horizon/openstack_dashboard"
 - Editar o arquivo "settings.py" na linha 147 "COMPRESS_ENABLED = True"
 - Editar para "COMPRESS_ENABLED = False"
 - Após a modificação dar o comando "sudo reboot"
---------------------------------------------------------------------------------------------------------------------------
 Dica 2:
 Caso de exit na instalação do "stack.sh"(na linha 560) e não completando a instalção, comentar a linha 560("#exit"). Ou caso queira comentar antes de iniciar a primeira instalação, também é possivel.
---------------------------------------------------------------------------------------------------------------------------
