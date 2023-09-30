# VPS with gui and interconnected network 
# Script Autor : VEDANT HIMTE 
clear
sudo apt update && sudo apt upgrade -y

# Installing GUi services
sudo apt install xfce4 xfce4-goodies tightvncserver  -y

vncserver :1
vncserver -kill :1
#Thius settings are user specific make sure you login with the same for which vnc is activated
#Or just paste this settings in ~/.vnc/xstartup

##!/bin/bash
#xrdb $HOME/.Xresources
#startxfce4 &

echo "#!/bin/bash" > .vnc/xstartup
echo "xrdb $HOME/.Xresources" >> .vnc/xstartup
echo "startxfce4 &" >> .vnc/xstartup

vncserver :1


