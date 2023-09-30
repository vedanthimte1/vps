# VPS with gui and interconnected network 
# Script Autor : VEDANT HIMTE 
sudo apt update && sudo apt upgrade -y

curl -s https://install.zerotier.com | sudo bash

sudo echo 'alias connect="sudo service zerotier-one restart && sudo zerotier-cli join 363c67c55ac194ca"' >> /root/.bashrc 
sudo echo 'alias connect="sudo service zerotier-one restart && sudo zerotier-cli join 363c67c55ac194ca"' >> /home/codespace/.bashrc 

sudo service zerotier-one restart
sudo zerotier-cli join 363c67c55ac194ca

# Installing GUi services