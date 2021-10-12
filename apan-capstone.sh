#!/usr/bin/env bash

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# User configuration
echo "Configure new user."
read -p "Username: " Username
adduser $Username
cp $SCRIPT_DIR/ /home/$Username/setup
cd /home/$Username/setup

# WSL configurations
echo "Configure WSL"
echo '[user]' >>./wsl.conf
echo 'default="$Username' >>./wsl.conf
sudo mv ./wsl.conf /etc/wsl.conf
echo "WSL configuration completed"
