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
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub
sudo add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/ /"
sudo apt-get update && sudo apt-get install -y cuda-toolkit-11-6 libcublas-dev-11-6 libcudnn8-dev libcufft-dev-11-6 libcurand-dev-11-6 libcusolver-dev-11-6 libcusparse-dev-11-6 libcutensor-dev libnvinfer-dev

# Execution ends
echo "${Lime_yellow}Ended $Script_name.${Normal}"
