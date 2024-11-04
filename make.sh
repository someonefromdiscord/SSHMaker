#!/bin/bash
echo root:root | sudo chpasswd
echo runner:runner | sudo chpasswd
# Update package list and install OpenSSH server
sudo apt update
sudo apt install -y openssh-server

# Allow root login in SSH configuration
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Restart SSH service to apply changes
sudo systemctl restart ssh

echo "SSH server installed and root login enabled."

echo Starting Serveo
echo Done! IP Below
USER=serveo ssh -R 0:localhost:22 -o "StrictHostKeyChecking=no" serveo.net
