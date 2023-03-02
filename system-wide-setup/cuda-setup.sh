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

# CUDA support
echo "${Green}Install CUDA toolkits for WSL.${Normal}"
sudo apt-get install -y software-properties-common
wget https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/cuda-keyring_1.0-1_all.deb
sudo dpkg -i cuda-keyring_1.0-1_all.deb
sudo apt-get update
sudo apt-get -y install cuda
echo "${Green}Installation completed.${Normal}"

# Execution ends
echo "${Lime_yellow}Ended $Script_name.${Normal}"
