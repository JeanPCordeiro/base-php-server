#!/bin/sh

# Update and Upgrade system
sudo apt -y update
#sudo apt -y upgrade

# Allocate swap memory file
sudo fallocate -l 3G /swapfile 
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile 
sudo cp /etc/fstab /etc/fstab.bak 
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

# Install NodeJS
curl -sL https://deb.nodesource.com/setup_12.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt -y update
sudo apt -y install nodejs

# Install Code-Server IDE
password=`cat ~/bitnami_application_password`
curl -fsSL https://code-server.dev/install.sh | sh
cat <<EOF > ~/.config/code-server/config.yaml
bind-addr: 0.0.0.0:8000
auth: password
password: $password
cert: false
EOF
sudo systemctl enable --now code-server@$USER
