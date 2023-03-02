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

# Build Essentials
echo "${Green}Install C and C++ dev tools.${Normal}"
sudo apt install -y build-essential debian-keyring gdb g++-10 g++-multilib g++-9-multilib g++-10-multilib clang-12
echo "${Green}Installation completes.${Normal}"

# Execution ends
echo "${Lime_yellow}Ended $Script_name.${Normal}"