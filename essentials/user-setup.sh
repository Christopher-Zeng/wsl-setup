#!/usr/bin/env bash
Script_dir="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
Script_name="$(basename $BASH_SOURCE)" 

# Echo color configurations
Red=$(tput setaf 1)
Green=$(tput setaf 2)
Lime_yellow=$(tput setaf 190)
Powder_blue=$(tput setaf 153)
Magenta=$(tput setaf 5)
Cyan=$(tput setaf 6)
Bright=$(tput bold)
Normal=$(tput sgr0)
Underline=$(tput smul)

# Execution begins
echo "${Lime_yellow}Started $Script_name.${Normal}"

# Importable variable: DistroUsername

# User configuration
echo "${Green}Configure new user.${Normal}"
if [ -z "$DistroUsername" ]
then 
    read -p "Username: " DistroUsername
fi
sudo adduser $DistroUsername
echo "${Green}Add the current user to sudoer.${Normal}"
sudo usermod -aG sudo $DistroUsername
echo "${Green}Set the current user to distro default.${Normal}"
sudo printf "[user]\ndefault=\"$DistroUsername\"\n" >> /etc/wsl.conf
echo "The current content of /etc/wsl.conf is:"
cat /etc/wsl.conf
echo "${Green}User setup completes.${Normal}"

# Execution ends
echo "${Lime_yellow}Ended $Script_name.${Normal}"