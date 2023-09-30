curl -s https://install.zerotier.com | sudo bash

sudo echo 'alias start="sudo service zerotier-one restart"' >> /root/.bashrc 
sudo echo 'alias connect="sudo zerotier-cli join 363c67c55ac194ca"' >> /root/.bashrc 

sudo echo 'alias start="sudo service zerotier-one restart"' >> /home/codespace/.bashrc
sudo echo 'alias connect="sudo zerotier-cli join 363c67c55ac194ca"' >> /home/codespace/.bashrc
 
sudo service zerotier-one restart
sudo zerotier-cli join 363c67c55ac194ca

