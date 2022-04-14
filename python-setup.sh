#!/usr/bin/env bash
Script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
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

# Install Python and dependencies
echo "${Green}Install pip venv and PyPy.${Normal}"
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt remove --purge -y python3-apt && sudo apt autoremove -y && sudo apt install -y python3-apt
sudo apt update && sudo apt install -y python3-pip python3-venv pypy3 python3.10-full python3.9-full python3.8-full python3.7-full python3.6-full python3.10-dev
echo "${Green}Installation completes.${Normal}"

# Execution ends
echo "${Lime_yellow}Ended $Script_name.${Normal}"
