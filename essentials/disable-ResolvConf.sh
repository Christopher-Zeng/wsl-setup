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

# User configuration
echo "${Green}Disable automatic generation of ResolvConf for this distro.${Normal}"
sudo printf "[network]\ngenerateResolvConf = false\n" >> /etc/wsl.conf
echo "The current content of /etc/wsl.conf is:"
cat /etc/wsl.conf
echo "${Green}Systemd enabled.${Normal}"

# Execution ends
echo "${Lime_yellow}Ended $Script_name.${Normal}"