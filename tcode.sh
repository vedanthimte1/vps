# VPS with gui and interconnected network 
# Script Autor : VEDANT HIMTE 
clear
sudo apt update && sudo apt upgrade -y

# Installing GUi services
sudo apt install xfce4 xfce4-goodies tightvncserver  -y

vncserver :1
vncserver -kill :1
echo "#!/bin/bash" > .vnc/xstartup
echo "xrdb $HOME/.Xresources" >> .vnc/xstartup
echo "startxfce4 &" >> .vnc/xstartup
vncserver :1


curl -s https://install.zerotier.com | sudo bash

sudo echo 'alias connect="sudo service zerotier-one restart && sudo zerotier-cli join 363c67c55ac194ca"' >> /root/.bashrc 
sudo echo 'alias connect="sudo service zerotier-one restart && sudo zerotier-cli join 363c67c55ac194ca"' >> /home/codespace/.bashrc 

sudo service zerotier-one restart
sudo zerotier-cli join 363c67c55ac194ca

