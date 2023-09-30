# VPS with gui and interconnected network 
# Script Autor : VEDANT HIMTE 

networkId = " "

curl -s https://install.zerotier.com | sudo bash

sudo echo 'alias start="sudo service zerotier-one restart"' >> /root/.bashrc 
sudo echo 'alias connect="sudo zerotier-cli join $networkId"' >> /root/.bashrc 

sudo echo 'alias start="sudo service zerotier-one restart"' >> /home/codespace/.bashrc
sudo echo 'alias connect="sudo zerotier-cli join $networkId"' >> /home/codespace/.bashrc
 
sudo service zerotier-one restart
sudo zerotier-cli join $networkId

