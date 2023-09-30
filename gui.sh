#!/bin/bash

# Update the system
sudo apt update

# Install the GNOME desktop environment
sudo apt install -y ubuntu-desktop

# Install the GNOME display manager
sudo apt install -y gdm3

# Enable and start the display manager
sudo systemctl enable gdm
sudo systemctl start gdm

# Install TigerVNC server
sudo apt install -y tigervnc-standalone-server tigervnc-common

# Set up a VNC password (replace 'your_password' with your desired password)
echo '@iamvedant' | vncpasswd -f > ~/.vnc/passwd
chmod 600 ~/.vnc/passwd

# Create a systemd service for VNC server
cat <<EOL > ~/.vnc/vncserver@.service
[Unit]
Description=Remote desktop service (VNC)
After=syslog.target network.target

[Service]
Type=forking
User=%i
ExecStartPre=/bin/sh -c '/usr/bin/vncserver -kill :%i > /dev/null 2>&1 || :'
ExecStart=/usr/bin/vncserver :%i -localhost no -geometry 1280x800
PIDFile=/home/%i/.vnc/%H%i.pid
ExecStop=/usr/bin/vncserver -kill :%i

[Install]
WantedBy=multi-user.target
EOL

# Enable the VNC server service
sudo systemctl enable ~/.vnc/vncserver@1.service

# Start the VNC server service
systemctl start ~/.vnc/vncserver@1

# Open port 5901 in the firewall for VNC (adjust firewall rules as needed)
sudo ufw allow 5901/tcp

echo "GUI and VNC installation and configuration completed. You can now connect using a VNC client to port 5901."
